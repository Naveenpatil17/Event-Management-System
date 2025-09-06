# 🎓 Campus Event Management System

## 📌 Overview

This project is a Campus Event Management System designed to facilitate the organization, registration, and management of campus events such as hackathons, workshops, seminars, and fests. It streamlines communication between students, colleges, and event organizers by providing a centralized platform for event discovery, registration, attendance tracking, and feedback collection.

---

## ✨ Features

### 🔐 User Authentication

Secure login and registration system with role-based access for students and admins.

### 📅 Event Management

Administration of various event types with detailed information and capacity limits.

### 📝 Registration

Students can browse active events and register for those of interest.

### 🎟️ Attendance Tracking

Check-in and check-out system for tracking student participation at events.

### ⭐ Feedback Submission

Students can provide ratings and comments to help improve future events.

### 🔔 Notifications

System-generated messages notify users about event updates, registrations, and announcements.

### 🏫 Venue Management

Events can be associated with multiple venues managed via the platform.

### 📊 Admin Dashboard (Planned)

Manage users, events, venues, and generate event participation reports.

---

## 🛠️ Technology Stack

### ⚙️ Backend

- 🐍 Python (Flask)  
- 📦 Libraries: PyMySQL, PyJWT, python-dotenv

### 🗄️ Database

- MySQL

### 🌐 Frontend

- 💻 HTML5  
- 🎨 CSS3  
- ⚡ JavaScript (ES6+)  
- 📡 Fetch API for async calls  
- 📱 Responsive design (Flexbox/Grid)  
- ✍️ Google Fonts for typography

### 🔒 Security

- SHA-256 for password hashing  
- JWT for session tokens

---

## 🗂️ Key Components

- 👤 **Users Table:** Stores user credentials and roles (student/admin).  
- 🎉 **Events Table:** Stores event details (type, timing, capacity, status).  
- 📝 **Registrations Table:** Tracks student event registrations.  
- ⏱️ **Attendance Table:** Records check-in/out timestamps.  
- ⭐ **Feedback Table:** Stores ratings and comments.  
- 🏢 **Venues & Event Venues:** Manages physical event locations.  
- 📢 **Notifications Table:** Stores system-generated messages.

---

## 🚀 Usage

### 1️⃣ Setup the Database

Run provided SQL scripts to create tables and insert sample data.

### 2️⃣ Configure Flask Backend

- Set `SECRET_KEY` in `.env`.  
- Install dependencies: Flask, PyMySQL, PyJWT, python-dotenv.  
- Run `app.py`.

### 3️⃣ Frontend

- Open `index.html` in your browser.  
- Login with test users.  
- Browse, register for events, and view your dashboard.

### 4️⃣ Extensibility

Add more endpoints, improve frontend, or integrate mobile apps.

---

## 📝 Development Notes

- 🔒 Passwords stored using SHA-256 hashing.  
- ⏳ JWT tokens expire after 24 hours.  
- ⚡ Environment variables managed via `.env`.  
- 📡 Frontend uses Fetch API for backend communication.  
- 📱 Fully responsive & accessible UI design.

---

## 🔮 Future Enhancements

- 📊 Full-fledged Admin Dashboard.  
- 🔍 Advanced event filtering & search.  
- 🌐 Real-time WebSocket notifications.  
- 📅 Calendar app & reminder integration.  
- 👫 Social features & richer user profiles.

---

## 👨‍💻 Developer

### ✍️ Naveen Patil
