use `campus_event_management`;
show Tables;
INSERT INTO users (email, password_hash, role) VALUES
('naveenkumar@reva.edu', SHA2('password123', 256), 'student'),
('mahendrasingh@reva.edu', SHA2('password123', 256), 'student'),
('priyapatel@reva.edu', SHA2('password123', 256), 'student'),
('admin@reva.edu', SHA2('adminpass', 256), 'admin'),
('karanmehta@bmsce.edu', SHA2('password123', 256), 'student'),
('sureshraina@reva.edu', SHA2('password123', 256), 'student'),
('rohitsharma@btcollege.edu', SHA2('password123', 256), 'student'),
('anitarani@reva.edu', SHA2('password123', 256), 'student'),
('rameshgupta@reva.edu', SHA2('password123', 256), 'student'),
('prakashpatel@reva.edu', SHA2('password123', 256), 'student'),
('admin2@btcollege.edu', SHA2('adminpass', 256), 'admin'),
('deepaksingh@reva.edu', SHA2('password123', 256), 'student');
INSERT INTO notifications (recipient_user_id, message, is_read) VALUES
(1, 'Welcome to the Campus Event Management System!', FALSE),
(2, 'Your registration for AI/ML Hackathon is confirmed.', FALSE),
(3, 'Workshop on React.js scheduled for March 20.', FALSE),
(4, 'System maintenance planned for next Sunday.', TRUE),
(5, 'Event “Blockchain Tech Talk” canceled.', FALSE),
(6, 'You have a new message from event admin.', FALSE),
(7, 'Your feedback for AI/ML Hackathon is received.', TRUE),
(8, 'Reminder: Check-in for React Workshop tomorrow.', FALSE),
(9, 'New event added: Cloud Computing Seminar.', FALSE),
(10, 'Your registration is on the waitlist.', FALSE),
(11, 'Admin notification: Event attendance report ready.', TRUE),
(12, 'Welcome aboard! Your account is approved.', FALSE);
INSERT INTO venues (name, location, capacity) VALUES
('Main Auditorium', 'Reva University Campus', 300),
('Computer Lab 101', 'Reva University Campus', 40),
('Conference Room 1', 'Reva University Campus', 60),
('Open Grounds', 'Bangalore Campus', 1000),
('Seminar Hall', 'Bangalore Tech Campus', 150),
('Workshop Room A', 'Bangalore Tech Campus', 70),
('Electronics Lab', 'Reva University Campus', 35),
('Library Hall', 'Reva University Campus', 50),
('Lecture Hall 3', 'BMS College Campus', 200),
('Banquet Hall', 'BMS College Campus', 400),
('Tech Park Room 4', 'BT Institute Campus', 120),
('Sports Pavilion', 'Bangalore University', 500);
-- Assuming event_id 1 to 5 and venue_id 1 to 12 assigned as above
INSERT INTO event_venues (event_id, venue_id) VALUES
(1, 1), -- AI/ML Hackathon at Main Auditorium
(1, 2), -- AI/ML Hackathon also using Computer Lab
(2, 3), -- React Workshop at Conference Room 1
(3, 5), -- Blockchain Tech Talk at Seminar Hall
(4, 4), -- Engineering Fest at Open Grounds
(5, 6), -- Cloud Computing at Workshop Room A
(2, 7), -- React Workshop additional venue Electronics Lab
(3, 8), -- Blockchain Tech Talk additional venue Library Hall
(1, 9), -- AI/ML Hackathon additional venue Lecture Hall 3
(4, 10); -- Engineering Fest additional venue Banquet Hall
INSERT IGNORE INTO users (email, password_hash, role) VALUES
('naveenkumar@reva.edu', SHA2('password123', 256), 'student'),
('mahendrasingh@reva.edu', SHA2('password123', 256), 'student') ;
SELECT email FROM users WHERE email IN ('naveenkumar@reva.edu', 'mahendrasingh@reva.edu');
INSERT IGNORE INTO event_venues (event_id, venue_id) VALUES
(1, 1), (1, 2), (2, 3), (3, 5), (4, 4), (5, 6), (2, 7), (3, 8), (1, 9), (4, 10);

SELECT * FROM event_venues WHERE (event_id, venue_id) IN ((1,1), (1,2), (2,3), (3,5));
SELECT * FROM event_venues WHERE (event_id, venue_id) IN
    ((1,1), (1,2), (2,3), (3,5), (4,4), (5,6), (2,7), (3,8), (1,9), (4,10));
DELETE FROM event_venues;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM event_venues;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM colleges;
SELECT * FROM students;
SELECT * FROM events;
SELECT * FROM registrations;
SELECT * FROM attendance;
SELECT * FROM feedback;
SELECT * FROM users;
SELECT * FROM notifications;
SELECT * FROM venues;
SELECT * FROM event_venues;
INSERT INTO event_venues (event_id, venue_id) VALUES
(1, 120),  
(2, 115),  
(3, 110),  
(5, 85),  
(6, 78),  
(7, 55),  
(8, 44),  
(9, 38),  
(10, 33),  
(11, 29),  
(12, 25),  
(13, 21),  
(14, 18),  
(15, 15),  
(16, 12),  
(17, 10),  
(18, 8),  
(19, 6),  
(20, 4),  
(21, 3),  
(22, 2),  
(23, 1);
