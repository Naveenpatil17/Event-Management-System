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
## ✨ Dashboard 
<table>
  <tr>
    <td><img src="<img width="1903" height="914" alt="Screenshot 2025-09-07 024232" src="https://github.com/user-attachments/assets/9dd05d43-1510-477f-a4e6-c2991d83b62a" />
" alt="Image 1" width="250" /></td>
    <td><img src="<img width="1898" height="901" alt="Screenshot 2025-09-07 023916" src="https://github.com/user-attachments/assets/1364d48c-4a86-45ae-bcf5-cf34fee8c66c" />
" alt="Image 2" width="250" /></td>
  </tr>
  <tr>
    <td><img src="<img width="1886" height="909" alt="Screenshot 2025-09-07 023955" src="https://github.com/user-attachments/assets/2f710644-eeab-4f06-b3cd-d35e515366f0" />
" alt="Image 3" width="250" /></td>
    <td><img src="<img width="1410" height="905" alt="Screenshot 2025-09-07 024054" src="https://github.com/user-attachments/assets/033ca379-2ab5-4a63-8d3b-1162d4422d65" />
" alt="Image 4" width="250" /></td>
  </tr>
</table>


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
