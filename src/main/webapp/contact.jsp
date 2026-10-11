<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - RG GYM</title>
<link rel="stylesheet" href="css/Style.css">

<style>
.contact-container {
    background: #ffffff;
    padding: 25px 30px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}

.contact-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 25px;
}

.contact-info h3,
.contact-form h3 {
    margin-bottom: 10px;
    color: #009688;
}

.contact-info p {
    margin: 6px 0;
    color: #555;
    line-height: 1.6;
}

.opening-hours ul {
    list-style: none;
    padding-left: 0;
}

.opening-hours li {
    padding: 4px 0;
    color: #444;
}

/* Form */
.contact-form .form-row {
    display: flex;
    flex-direction: column;
    margin-bottom: 12px;
}

.contact-form label {
    font-weight: 600;
    color: #607d8b;
    margin-bottom: 4px;
}

.contact-form input,
.contact-form textarea {
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.contact-form textarea {
    resize: vertical;
    min-height: 80px;
}

.contact-form input:focus,
.contact-form textarea:focus {
    border-color: #009688;
    outline: none;
}

@media (max-width: 768px) {
    .contact-grid {
        grid-template-columns: 1fr;
    }
}
.topbar {
    background: #009688;
    color: white;
    padding: 15px 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 22px;
    font-weight: bold;
}

.topbar nav a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    font-size: 16px;
}

.btn-primary {
    background: white;
    color: #009688 !important;
    padding: 8px 16px;
    border-radius: 6px;
    font-weight: bold;
}
.btn-primary:hover{
  background-color: lightblue;
}
</style>
</head>
<body>
<header class="topbar">
        <div class="logo">RG GYM</div>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="admin.jsp">Admin</a>
            <a href="user.jsp">Login</a>
            <a href="about.jsp">About</a>
            <a href="contact.jsp">Contact</a>
        </nav>
    </header>

    <div class="content">
        <h2 class="page-title">Contact Us</h2>

        <div class="contact-container">

            <div class="contact-grid">

                <!-- 📍 Contact Info -->
                <div class="contact-info">
                    <h3>📍 Our Address</h3>
                    <p>RG GYM, Near XYZ Chowk, Pune, Maharashtra – 411001</p>

                    <h3>📞 Contact Details</h3>
                    <p><b>Phone:</b> +91 98765 43210</p>
                    <p><b>Email:</b> support@rggym.com</p>
                    <p><b>Website:</b> www.rggym.com</p>

                    <h3>🕒 Opening Hours</h3>
                    <div class="opening-hours">
                        <ul>
                            <li>Monday – Saturday: 6:00 AM – 10:00 PM</li>
                            <li>Sunday: 8:00 AM – 2:00 PM</li>
                        </ul>
                    </div>
                </div>

                <!-- ✉️ Contact Form -->
                <div class="contact-form">
                    <h3>✉️ Send Us a Message</h3>

                    <form action="#" method="post">
                        <div class="form-row">
                            <label>Your Name</label>
                            <input type="text" name="name" required>
                        </div>

                        <div class="form-row">
                            <label>Your Email</label>
                            <input type="email" name="email" required>
                        </div>

                        <div class="form-row">
                            <label>Your Message</label>
                            <textarea name="message" required></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Send Message</button>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>
