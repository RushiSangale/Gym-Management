<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>
  body {
        background-color: white;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
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
 
    .login-box {
        width: 300px;
        margin: 20px auto;
        background-color:#009688 ;
        padding: 30px;
        border-radius: 15px;
        text-align: center;
        color: white;
    }
    h1{
    font-size: 32px;
    }

    .login-box input {
        width: 90%;
        padding: 10px;
        margin: 8px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    .login-box input[type="submit"] {
        background: white;
        color: Black;
        border: none;
        font-size: 16px;
        cursor: pointer;
        margin-top: 10px;
    }

    .login-box input[type="submit"]:hover {
        background: #06f7;
    }
    
    .img{
    height: 72vh;
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
    
<section class="img">
<div class="login-box">
    <h1>Admin Login</h1>

    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Admin Name" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <input type="submit" value="Login">
    </form>
</div>
</section>
</body>
</html>
