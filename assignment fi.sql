use `campus_event_management`;
show Tables;
INSERT INTO colleges (college_name, location, contact_info) VALUES
('Reva University', 'Bangalore, Karnataka', 'info@reva.edu.in'),
('B.M.S. College of Engineering', 'Bangalore, Karnataka', 'contact@bmsce.ac.in'),
('B.M.S. Institute of Technology and Management', 'Bangalore, Karnataka', 'info@bmsitm.ac.in'),
('B.N.M. Institute of Technology', 'Bangalore, Karnataka', 'contact@bnmit.in'),
('Bangalore Institute of Technology', 'Bangalore, Karnataka', 'info@bit-bangalore.edu.in'),
('Brindavan College of Engineering', 'Bangalore, Karnataka', 'info@brindavancollege.edu.in'),
('City Engineering College', 'Bangalore, Karnataka', 'contact@cityengg.edu.in'),
('CMR Institute of Technology', 'Bangalore, Karnataka', 'info@cmrit.ac.in'),
('Dayananda Sagar College of Engineering', 'Bangalore, Karnataka', 'contact@dsce.edu.in'),
('Dr. Ambedkar Institute of Technology', 'Bangalore, Karnataka', 'info@drait.ac.in'),
('Don Bosco Institute of Technology', 'Bangalore, Karnataka', 'contact@dbit.edu.in'),
('Global Academy of Technology', 'Bangalore, Karnataka', 'info@globalacademy.in'),
('PES University', 'Bangalore, Karnataka', 'contact@pes.edu'),
('International Institute of Information Technology, Bangalore (IIIT-B)', 'Bangalore, Karnataka', 'info@iiitb.ac.in'),
('Indian Institute of Science (IISc)', 'Bangalore, Karnataka', 'contact@iisc.ac.in'),
('MS Ramaiah Institute of Technology', 'Bangalore, Karnataka', 'info@msrit.edu.in'),
('New Horizon College of Engineering', 'Bangalore, Karnataka', 'contact@newhorizonindia.edu'),
('Nitte Meenakshi Institute of Technology', 'Bangalore, Karnataka', 'info@nmit.ac.in'),
('Christ University School of Engineering and Technology', 'Bangalore, Karnataka', 'contact@christuniversity.in'),
('R.V. College of Engineering', 'Bangalore, Karnataka', 'info@rvce.edu.in'),
('Ramaiah Institute of Technology', 'Bangalore, Karnataka', 'contact@msrit.edu.in'),
('RNS Institute of Technology', 'Bangalore, Karnataka', 'info@rnsit.ac.in'),
('Sai Vidya Institute of Technology', 'Bangalore, Karnataka', 'contact@saividya.edu.in'),
('Sambhram Institute of Technology', 'Bangalore, Karnataka', 'info@sambhram.edu.in'),
('Sir M. Visvesvaraya Institute of Technology', 'Bangalore, Karnataka', 'contact@smvit.edu.in'),
('SJB Institute of Technology', 'Bangalore, Karnataka', 'info@sjbit.edu.in'),
('Sapthagiri College of Engineering', 'Bangalore, Karnataka', 'contact@sapthagiri.edu.in'),
('Sri Revana Siddeshwara Institute of Technology', 'Bangalore, Karnataka', 'info@srisiddeshwara.edu.in'),
('Sri Venkateshwara College of Engineering', 'Bangalore, Karnataka', 'contact@svce.ac.in'),
('T. John Institute of Technology', 'Bangalore, Karnataka', 'info@tjits.org'),
('University Visvesvaraya College of Engineering (UVCE)', 'Bangalore, Karnataka', 'contact@uvce.ac.in');
SELECT college_id, college_name FROM colleges;

-- Assuming college_id = 1 for Reva University, and college_id 2-30 for other colleges in your `colleges` table.

INSERT INTO students (college_id, student_name, email, phone, course, year, password_hash) VALUES
-- Reva University students (80)
(1, 'Naveen Kumar', 'naveenkumar@reva.edu', '9876500010', 'Computer Science', 3, SHA2('password123',256)),
(1, 'Mahendra Singh', 'mahendrasingh@reva.edu', '9876500011', 'Information Technology', 2, SHA2('password123',256)),
(1, 'Mithun Reddy', 'mithunreddy@reva.edu', '9876500012', 'Electronics', 4, SHA2('password123',256)),
(1, 'Kumar Prasad', 'kumarprasad@reva.edu', '9876500013', 'Mechanical', 1, SHA2('password123',256)),
(1, 'Anil Sharma', 'anisharma@reva.edu', '9876500014', 'Civil Engineering', 3, SHA2('password123',256)),
(1, 'Suresh Raina', 'sureshraina@reva.edu', '9876500015', 'Computer Science', 2, SHA2('password123',256)),
(1, 'Ravi Kishan', 'ravikishan@reva.edu', '9876500016', 'Information Technology', 4, SHA2('password123',256)),
(1, 'Rajesh Khanna', 'rajeshkhanna@reva.edu', '9876500017', 'Electronics', 1, SHA2('password123',256)),
(1, 'Ajay Devgan', 'ajaydevgan@reva.edu', '9876500018', 'Mechanical', 3, SHA2('password123',256)),
(1, 'Vijay Kumar', 'vijaykumar@reva.edu', '9876500019', 'Civil Engineering', 2, SHA2('password123',256)),

-- 70 more Reva students (sample, incrementing phones and creating emails in similar pattern)
(1, 'Rahul Sharma', 'rahulsharma@reva.edu', '9876500020', 'Computer Science', 3, SHA2('password123',256)),
(1, 'Priya Patel', 'priyapatel@reva.edu', '9876500021', 'Information Technology', 2, SHA2('password123',256)),
(1, 'Arjun Singh', 'arjunsingh@reva.edu', '9876500022', 'Electronics', 4, SHA2('password123',256)),
(1, 'Sneha Gupta', 'snehagupta@reva.edu', '9876500023', 'Mechanical', 1, SHA2('password123',256)),
(1, 'Devansh Joshi', 'devanshjoshi@reva.edu', '9876500024', 'Civil Engineering', 3, SHA2('password123',256)),
(1, 'Karan Mehta', 'karanmehta@reva.edu', '9876500025', 'Computer Science', 2, SHA2('password123',256)),
(1, 'Anita Sharma', 'anitasharma@reva.edu', '9876500026', 'Information Technology', 4, SHA2('password123',256)),
(1, 'Pooja Singh', 'poojasingh@reva.edu', '9876500027', 'Electronics', 1, SHA2('password123',256)),
(1, 'Manish Kumar', 'manishkumar@reva.edu', '9876500028', 'Mechanical', 3, SHA2('password123',256)),
(1, 'Rohit Raj', 'rohitraj@reva.edu', '9876500029', 'Civil Engineering', 2, SHA2('password123',256)),

-- (Add 60 more similar rows for Reva University, incrementing phone numbers each time)

-- Other Colleges (20 students) - evenly distributed across colleges 2 to 31
(2, 'Anil Kumar', 'anil.kumar@bmsce.edu', '9888800010', 'Computer Science', 3, SHA2('password123',256)),
(3, 'Suresh Patel', 'suresh.patel@bmsitm.edu', '9888800011', 'Mechanical', 2, SHA2('password123',256)),
(4, 'Rajesh Singh', 'rajesh.singh@bnmit.edu', '9888800012', 'Electronics', 4, SHA2('password123',256)),
(5, 'Sunita Sharma', 'sunita.sharma@bit.edu', '9888800013', 'Civil Engineering', 3, SHA2('password123',256)),
(6, 'Vikram Joshi', 'vikram.joshi@brindavan.edu', '9888800014', 'Information Technology', 1, SHA2('password123',256)),

-- (Add 15 more students distributed similarly with unique emails and phones)

(31, 'Shalini Rao', 'shalini.rao@uvce.edu', '9888800029', 'Computer Science', 3, SHA2('password123',256));
-- Additional students in Reva University (college_id = 1)
INSERT INTO students (college_id, student_name, email, phone, course, year, password_hash) VALUES
(1, 'Ramesh Gupta', 'rameshgupta@reva.edu', '9876500030', 'Computer Science', 2, SHA2('password123',256)),
(1, 'Sunita Mohan', 'sunitamohan@reva.edu', '9876500031', 'Information Technology', 3, SHA2('password123',256)),
(1, 'Ajay Menon', 'ajaymenon@reva.edu', '9876500032', 'Electronics', 4, SHA2('password123',256)),
(1, 'Priya Nair', 'priyanair@reva.edu', '9876500033', 'Mechanical', 1, SHA2('password123',256)),
(1, 'Rajeshwari Iyer', 'rajeshwariiyer@reva.edu', '9876500034', 'Civil Engineering', 3, SHA2('password123',256));

-- Students in other Bangalore colleges (college_id from 2 to 10 as example)
INSERT INTO students (college_id, student_name, email, phone, course, year, password_hash) VALUES
(2, 'Vinay Kumar', 'vinaykumar@bmsce.edu', '9888800035', 'Computer Science', 3, SHA2('password123',256)),
(3, 'Deepa Sharma', 'deepasharma@bmsitm.edu', '9888800036', 'Information Technology', 2, SHA2('password123',256)),
(4, 'Karthik Reddy', 'karthikreddy@bnmit.edu', '9888800037', 'Electronics', 4, SHA2('password123',256)),
(5, 'Neha Singh', 'nehasingh@bit.edu', '9888800038', 'Mechanical', 1, SHA2('password123',256)),
(6, 'Sanjay Joshi', 'sanjayjoshi@brindavan.edu', '9888800039', 'Civil Engineering', 3, SHA2('password123',256)),
(7, 'Mitali Patil', 'mitalipatil@cityengg.edu', '9888800040', 'Computer Science', 2, SHA2('password123',256)),
(8, 'Rahul Desai', 'rahuldesai@cmrit.edu', '9888800041', 'Information Technology', 4, SHA2('password123',256)),
(9, 'Laxmi Kulkarni', 'laxmikulkarni@dsce.edu', '9888800042', 'Electronics', 1, SHA2('password123',256)),
(10, 'Amit Shah', 'amitshah@drait.edu', '9888800043', 'Mechanical', 3, SHA2('password123',256)),
(2, 'Sunil Dutt', 'sunildutt@bmsce.edu', '9888800044', 'Civil Engineering', 2, SHA2('password123',256));

SELECT * FROM students;
INSERT INTO events (college_id, event_name, event_type, description, venue, start_datetime, end_datetime, max_capacity, created_by, status)
VALUES
(1, 'AI/ML Hackathon 2025', 'hackathon', '24-hour AI and machine learning challenge.', 'Main Auditorium', '2025-03-15 09:00:00', '2025-03-16 09:00:00', 100, NULL, 'active'),
(1, 'React Workshop', 'workshop', 'Hands-on React.js development.', 'Lab 202', '2025-03-20 10:00:00', '2025-03-20 17:00:00', 50, NULL, 'active'),
(1, 'Blockchain Tech Talk', 'tech_talk', 'Introduction to blockchain technology.', 'Conference Room', '2025-03-25 15:00:00', '2025-03-25 17:00:00', 60, NULL, 'active');
INSERT INTO registrations (event_id, student_id)
VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(1, 6), (1, 7), (1, 8), (1, 9), (1, 10);
INSERT INTO attendance (registration_id, checked_in_at, checked_out_at)
VALUES
(1, '2025-03-15 09:05:00', '2025-03-16 08:55:00'),
(2, '2025-03-15 09:10:00', '2025-03-16 08:50:00'),
(3, '2025-03-15 09:00:00', '2025-03-16 08:45:00');
-- Add more as needed for other registration_ids
INSERT INTO feedback (registration_id, rating, comments, submitted_at)
VALUES
(1, 5, 'Great event, learned a lot!', '2025-03-16 10:00:00'),
(2, 4, 'Good experience but needed more breaks.', '2025-03-16 11:15:00'),
(3, 5, 'Excellent mentors and challenges.', '2025-03-16 09:45:00');
-- Add more as needed
SELECT * FROM feedback;
SELECT * FROM registrations WHERE event_id = 1 AND student_id = 1;
INSERT INTO registrations (event_id, student_id)
SELECT 1, student_id FROM students
WHERE student_id NOT IN (
    SELECT student_id FROM registrations WHERE event_id = 1
)
LIMIT 10;
-- More event rows (for college_id = 1 and 2)
INSERT INTO events (college_id, event_name, event_type, description, venue, start_datetime, end_datetime, max_capacity, status)
VALUES
(1, 'Data Science Workshop', 'workshop', 'Introduction to Data Science tools', 'Lab 204', '2025-04-01 10:00:00', '2025-04-01 16:00:00', 40, 'active'),
(1, 'Cloud Computing Seminar', 'tech_talk', 'Cloud technologies overview', 'Seminar Hall', '2025-04-07 14:00:00', '2025-04-07 17:00:00', 60, 'active'),
(2, 'Robotics Fest 2025', 'fest', 'Annual Robotics event', 'Main Grounds', '2025-05-10 09:00:00', '2025-05-12 18:00:00', 150, 'active');

-- More registrations
INSERT INTO registrations (event_id, student_id)
VALUES
(2, 5), (2, 6), (3, 1), (3, 7), (4, 11), (4, 12);

-- More attendance records
INSERT INTO attendance (registration_id, checked_in_at, checked_out_at)
VALUES
(4, '2025-03-20 10:05:00', '2025-03-20 16:00:00'),
(5, '2025-03-25 09:00:00', '2025-03-25 17:00:00');

-- More feedback entries
INSERT INTO feedback (registration_id, rating, comments)
VALUES
(4, 5, 'Very informative!'),
(5, 4, 'Good session but could improve timing.');
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    role ENUM('student', 'admin') DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    recipient_user_id INT NOT NULL,
    message TEXT,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (recipient_user_id) REFERENCES users(user_id)
);

CREATE TABLE venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255),
    capacity INT
);

CREATE TABLE event_venues (
    event_id INT NOT NULL,
    venue_id INT NOT NULL,
    PRIMARY KEY (event_id, venue_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

-- and so on...
