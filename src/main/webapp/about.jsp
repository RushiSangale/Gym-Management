<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - RG GYM</title>
<link rel="stylesheet" href="css/Style.css">

<style>
.about-container {
    background: #ffffff;
    padding: 25px 30px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}

.about-section {
    margin-bottom: 25px;
}

.about-section h3 {
    margin-bottom: 10px;
    color: #009688;
}

.about-section p {
    color: #555;
    line-height: 1.6;
}

.about-list {
    list-style: none;
    padding-left: 0;
}

.about-list li {
    padding: 6px 0;
    color: #444;
}

.team-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 15px;
    margin-top: 10px;
}

.team-card {
    background: #f9fbfc;
    padding: 15px;
    border-radius: 6px;
    text-align: center;
    box-shadow: 0 1px 4px rgba(0,0,0,0.05);
}

.team-card h4 {
    margin: 8px 0 4px;
}

.team-card p {
    font-size: 13px;
    color: #777;
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

        <h2 class="page-title">About RG GYM</h2>

        <div class="about-container">

            <!-- 1️⃣ Introduction -->
            <div class="about-section">
                <h3>🏋️ Gym Introduction</h3>
                <p>
                    RG GYM is a modern fitness center dedicated to helping individuals achieve their
                    health and fitness goals. We provide state-of-the-art equipment, certified trainers,
                    and personalized workout plans in a motivating environment.
                </p>
            </div>

            <!-- 2️⃣ Vision & Mission -->
            <div class="about-section">
                <h3>🎯 Vision & Mission</h3>
                <p><b>Mission:</b></p>
                <ul class="about-list">
                    <li>✔️ To promote a healthy lifestyle.</li>
                    <li>✔️ To provide affordable fitness training.</li>
                </ul>

                <p><b>Vision:</b></p>
                <ul class="about-list">
                    <li>✔️ To become the most trusted fitness center in the city.</li>
                </ul>
            </div>

            <!-- 3️⃣ Facilities -->
            <div class="about-section">
                <h3>💪 Facilities & Services</h3>
                <ul class="about-list">
                    <li>✔️ Modern gym equipment</li>
                    <li>✔️ Personal training</li>
                    <li>✔️ Diet & nutrition guidance</li>
                    <li>✔️ Yoga & Zumba classes</li>
                    <li>✔️ Clean changing rooms</li>
                    <li>✔️ Flexible workout timings</li>
                </ul>
            </div>

            <!-- 4️⃣ Why Choose Us -->
            <div class="about-section">
                <h3>⭐ Why Choose Us</h3>
                <ul class="about-list">
                    <li>✔️ Certified trainers</li>
                    <li>✔️ Affordable membership plans</li>
                    <li>✔️ Friendly environment</li>
                    <li>✔️ Personalized fitness programs</li>
                    <li>✔️ Safe and hygienic gym</li>
                </ul>
            </div>

            <!-- 5️⃣ Team -->
            <div class="about-section">
                <h3>👥 Our Team</h3>

                <div class="team-grid">
                    <div class="team-card">
                        <h4>Rushi Sangale</h4>
                        <p>Head Trainer</p>
                    </div>

                    <div class="team-card">
                        <h4>Neha Patil</h4>
                        <p>Fitness Coach</p>
                    </div>

                    <div class="team-card">
                        <h4>Amit Verma</h4>
                        <p>Nutrition Expert</p>
                    </div>
                </div>
            </div>

        </div>

    </div>

</body>
</html>
