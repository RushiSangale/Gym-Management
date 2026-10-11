<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gym Homepage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    background: #f5f7fa;
    color: #1f2933;
}

/* Top Bar */
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

/* Hero */
.hero {
    height: 93vh;
    background-image: 
        linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.1)),
        url("https://t3.ftcdn.net/jpg/04/29/35/62/240_F_429356296_CVQ5LkC6Pl55kUNLqLisVKgTw9vjyif1.jpg");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;

    color: #fff;
    text-align: center;
    padding-top: 150px;
}

.hero-content {
    width: 100%;
    text-align: center;
    margin-top: 105px;
}

.hero h1 {
    font-size: 46px;
    margin-bottom: 15px;
    color:#06f23;
}

.hero p {
    font-size: 22px;
    margin-bottom: 20px;
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

    <section class="hero">
        <div class="hero-content">
            <h1>Train Hard. Stay Fit.</h1>
            <p>Join RG GYM and transform your body with expert trainers.</p>
            <a href="register.jsp" class="btn-primary">Get Started</a>
        </div>
    </section>


</body>
</html>
