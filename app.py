from flask import Flask, request, jsonify
from flask_cors import CORS
import pymysql
import jwt
import datetime
import hashlib
import os
from functools import wraps
from dotenv import load_dotenv

load_dotenv()  # Load environment variables from .env if present

app = Flask(__name__)
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY')
if not app.config['SECRET_KEY']:
    raise RuntimeError("SECRET_KEY environment variable not set")

CORS(app)

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Mahi@9353',
    'db': 'campus_event_management',
    'cursorclass': pymysql.cursors.DictCursor,
    'charset': 'utf8mb4',
}

def get_db_connection():
    return pymysql.connect(**db_config)

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('Authorization')
        if not token:
            return jsonify({'message': 'Token is missing!'}), 401
        try:
            if token.startswith('Bearer '):
                token = token[7:]
            data = jwt.decode(token, app.config['SECRET_KEY'], algorithms=['HS256'])
            current_user_id = data['user_id']
            current_user_role = data.get('role', 'student')
        except Exception:
            return jsonify({'message': 'Token is invalid!'}), 401
        return f(current_user_id, current_user_role, *args, **kwargs)
    return decorated

def admin_required(f):
    @wraps(f)
    def decorated(current_user_id, current_user_role, *args, **kwargs):
        if current_user_role != 'admin':
            return jsonify({'message': 'Admin access required!'}), 403
        return f(current_user_id, current_user_role, *args, **kwargs)
    return decorated

@app.route('/auth/register', methods=['POST'])
def register():
    data = request.json
    email = data.get('email')
    password = data.get('password')
    name = data.get('name')
    role = 'student'

    if not email or not password or not name:
        return jsonify({'message': 'Name, email, and password required'}), 400

    password_hash = hashlib.sha256(password.encode()).hexdigest()

    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT user_id FROM users WHERE email=%s", (email,))
            if cursor.fetchone():
                return jsonify({'message': 'Email already registered'}), 400

            cursor.execute("INSERT INTO users (email, password_hash, role) VALUES (%s, %s, %s)", 
                           (email, password_hash, role))
            conn.commit()
            return jsonify({'message': 'User registered successfully'})
    finally:
        conn.close()

@app.route('/auth/login', methods=['POST'])
def login():
    data = request.json
    email = data.get('email')
    password = data.get('password')
    if not email or not password:
        return jsonify({'message': 'Email and password required'}), 400
    password_hash = hashlib.sha256(password.encode()).hexdigest()

    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("SELECT user_id, role FROM users WHERE email=%s AND password_hash=%s",
                       (email, password_hash))
        user = cursor.fetchone()
    conn.close()

    if not user:
        return jsonify({'message': 'Invalid credentials'}), 401

    token = jwt.encode({
        'user_id': user['user_id'],
        'role': user['role'],
        'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=24)
    }, app.config['SECRET_KEY'], algorithm='HS256')

    return jsonify({
        'token': token,
        'user_id': user['user_id'],
        'role': user['role']
    })

@app.route('/events', methods=['GET'])
@token_required
def list_events(current_user_id, current_user_role):
    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("""
            SELECT e.*, c.college_name,
                (SELECT COUNT(*) FROM registrations r WHERE r.event_id = e.event_id AND r.status = 'registered') AS total_registrations
            FROM events e
            JOIN colleges c ON e.college_id = c.college_id
            WHERE e.status = 'active'
            ORDER BY e.start_datetime
        """)
        events = cursor.fetchall()
    conn.close()
    return jsonify({'events': events})

@app.route('/registrations', methods=['POST'])
@token_required
def register_event(current_user_id, current_user_role):
    data = request.json
    event_id = data.get('event_id')
    if not event_id:
        return jsonify({'message': 'Event ID is required'}), 400

    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                SELECT e.max_capacity,
                    (SELECT COUNT(*) FROM registrations r WHERE r.event_id = e.event_id AND r.status='registered') AS current_registrations,
                    e.status
                FROM events e WHERE e.event_id = %s
            """, (event_id,))
            event = cursor.fetchone()

            if not event or event['status'] != 'active':
                return jsonify({'message': 'Event not found or inactive'}), 404

            if event['current_registrations'] >= event['max_capacity']:
                return jsonify({'message': 'Event is full'}), 400

            cursor.execute("""
                SELECT registration_id FROM registrations WHERE event_id=%s AND student_id=%s AND status='registered'
            """, (event_id, current_user_id))
            if cursor.fetchone():
                return jsonify({'message': 'Already registered'}), 400

            cursor.execute("""
                INSERT INTO registrations (event_id, student_id) VALUES (%s, %s)
            """, (event_id, current_user_id))
            conn.commit()
            registration_id = cursor.lastrowid
            return jsonify({'registration_id': registration_id, 'message': 'Registration successful'})
    finally:
        conn.close()

@app.route('/registrations', methods=['GET'])
@token_required
def get_registrations(current_user_id, current_user_role):
    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("""
            SELECT r.registration_id, r.status, e.event_name, e.start_datetime, e.end_datetime
            FROM registrations r
            JOIN events e ON r.event_id = e.event_id
            WHERE r.student_id = %s AND r.status = 'registered'
            ORDER BY e.start_datetime
        """, (current_user_id,))
        registrations = cursor.fetchall()
    conn.close()
    return jsonify({'registrations': registrations})

@app.route('/attendance/checkin', methods=['POST'])
@token_required
def checkin(current_user_id, current_user_role):
    data = request.json
    event_id = data.get('event_id')
    if not event_id:
        return jsonify({'message': 'Event ID is required'}), 400

    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                SELECT registration_id FROM registrations WHERE event_id=%s AND student_id=%s AND status='registered'
            """, (event_id, current_user_id))
            reg = cursor.fetchone()
            if not reg:
                return jsonify({'message': 'Registration not found'}), 404

            cursor.execute("""
                INSERT INTO attendance (registration_id, checked_in_at) VALUES (%s, NOW())
                ON DUPLICATE KEY UPDATE checked_in_at=NOW()
            """, (reg['registration_id'],))
            conn.commit()

            return jsonify({'registration_id': reg['registration_id'], 'checked_in_at': datetime.datetime.now().isoformat(), 'message': 'Checked in successfully'})
    finally:
        conn.close()

@app.route('/attendance/checkout', methods=['POST'])
@token_required
def checkout(current_user_id, current_user_role):
    data = request.json
    event_id = data.get('event_id')
    if not event_id:
        return jsonify({'message': 'Event ID is required'}), 400

    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                SELECT registration_id FROM registrations WHERE event_id=%s AND student_id=%s AND status='registered'
            """, (event_id, current_user_id))
            reg = cursor.fetchone()
            if not reg:
                return jsonify({'message': 'Registration not found'}), 404

            cursor.execute("""
                UPDATE attendance SET checked_out_at=NOW() WHERE registration_id=%s
            """, (reg['registration_id'],))
            conn.commit()

            return jsonify({'registration_id': reg['registration_id'], 'checked_out_at': datetime.datetime.now().isoformat(), 'message': 'Checked out successfully'})
    finally:
        conn.close()

@app.route('/feedback', methods=['POST'])
@token_required
def submit_feedback(current_user_id, current_user_role):
    data = request.json
    registration_id = data.get('registration_id')
    rating = data.get('rating')
    comments = data.get('comments', '')

    if not registration_id or not rating or not (1 <= rating <= 5):
        return jsonify({'message': 'Invalid data'}), 400

    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM registrations WHERE registration_id = %s AND student_id = %s", (registration_id, current_user_id))
            reg = cursor.fetchone()
            if not reg:
                return jsonify({'message': 'Unauthorized or registration not found'}), 404

            cursor.execute("INSERT INTO feedback (registration_id, rating, comments) VALUES (%s, %s, %s)", (registration_id, rating, comments))
            conn.commit()
            return jsonify({'message': 'Feedback submitted successfully'})
    finally:
        conn.close()

@app.route('/events/<int:event_id>', methods=['GET'])
@token_required
def get_event_details(current_user_id, current_user_role, event_id):
    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("""
            SELECT e.*, c.college_name FROM events e JOIN colleges c ON e.college_id=c.college_id WHERE e.event_id=%s
        """, (event_id,))
        event = cursor.fetchone()
    conn.close()
    if not event:
        return jsonify({'message': 'Event not found'}), 404
    return jsonify(event)

# Additional APIs for users, venues, event_venues, notifications

@app.route('/users/<int:user_id>', methods=['GET'])
@token_required
def get_user(current_user_id, current_user_role, user_id):
    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("SELECT user_id, email, role, created_at FROM users WHERE user_id=%s", (user_id,))
        user = cursor.fetchone()
    conn.close()
    if not user:
        return jsonify({'message': 'User not found'}), 404
    return jsonify(user)

@app.route('/users', methods=['GET'])
@token_required
@admin_required
def list_users(current_user_id, current_user_role):
    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("SELECT user_id, email, role, created_at FROM users ORDER BY created_at DESC")
        users = cursor.fetchall()
    conn.close()
    return jsonify({'users': users})

@app.route('/venues', methods=['GET'])
@token_required
def list_venues(current_user_id, current_user_role):
    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("SELECT * FROM venues ORDER BY name")
        venues = cursor.fetchall()
    conn.close()
    return jsonify({'venues': venues})

@app.route('/venues', methods=['POST'])
@token_required
@admin_required
def create_venue(current_user_id, current_user_role):
    data = request.json
    name = data.get('name')
    location = data.get('location')
    capacity = data.get('capacity')
    if not name or capacity is None:
        return jsonify({'message': 'Name and capacity required'}), 400

    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("INSERT INTO venues (name, location, capacity) VALUES (%s, %s, %s)", (name, location, capacity))
            conn.commit()
            return jsonify({'message': 'Venue created', 'venue_id': cursor.lastrowid})
    finally:
        conn.close()

@app.route('/events/<int:event_id>/venues', methods=['GET'])
@token_required
def get_event_venues(current_user_id, current_user_role, event_id):
    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("""
            SELECT v.* FROM venues v
            JOIN event_venues ev ON v.venue_id = ev.venue_id
            WHERE ev.event_id = %s
        """, (event_id,))
        venues = cursor.fetchall()
    conn.close()
    return jsonify({'venues': venues})

@app.route('/events/<int:event_id>/venues', methods=['POST'])
@token_required
@admin_required
def add_event_venue(current_user_id, current_user_role, event_id):
    data = request.json
    venue_id = data.get('venue_id')
    if not venue_id:
        return jsonify({'message': 'venue_id is required'}), 400
    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM event_venues WHERE event_id = %s AND venue_id = %s", (event_id, venue_id))
            if cursor.fetchone():
                return jsonify({'message': 'This venue is already assigned to the event'}), 400
            cursor.execute("INSERT INTO event_venues (event_id, venue_id) VALUES (%s, %s)", (event_id, venue_id))
            conn.commit()
            return jsonify({'message': 'Venue added to event'})
    finally:
        conn.close()

@app.route('/events/<int:event_id>/venues/<int:venue_id>', methods=['DELETE'])
@token_required
@admin_required
def remove_event_venue(current_user_id, current_user_role, event_id, venue_id):
    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("DELETE FROM event_venues WHERE event_id = %s AND venue_id = %s", (event_id, venue_id))
            conn.commit()
            return jsonify({'message': 'Venue removed from event'})
    finally:
        conn.close()

@app.route('/notifications', methods=['GET'])
@token_required
def get_notifications(current_user_id, current_user_role):
    conn = get_db_connection()
    with conn.cursor() as cursor:
        cursor.execute("SELECT * FROM notifications WHERE recipient_user_id = %s ORDER BY created_at DESC", (current_user_id,))
        notifications = cursor.fetchall()
    conn.close()
    return jsonify({'notifications': notifications})

@app.route('/notifications/<int:notification_id>/read', methods=['PUT'])
@token_required
def mark_notification_read(current_user_id, current_user_role, notification_id):
    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("UPDATE notifications SET is_read = TRUE WHERE notification_id = %s AND recipient_user_id = %s", (notification_id, current_user_id))
            conn.commit()
            return jsonify({'message': 'Notification marked as read'})
    finally:
        conn.close()

@app.route('/notifications', methods=['POST'])
@token_required
@admin_required
def create_notification(current_user_id, current_user_role):
    data = request.json
    recipient_user_id = data.get('recipient_user_id')
    message = data.get('message')
    if not recipient_user_id or not message:
        return jsonify({'message': 'recipient_user_id and message are required'}), 400
    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("INSERT INTO notifications (recipient_user_id, message) VALUES (%s, %s)", (recipient_user_id, message))
            conn.commit()
            return jsonify({'message': 'Notification created', 'notification_id': cursor.lastrowid})
    finally:
        conn.close()

@app.route('/')
def home():
    return jsonify({'message': 'Campus Event Management API is running.'})

if __name__ == '__main__':
    app.run(debug=True)
