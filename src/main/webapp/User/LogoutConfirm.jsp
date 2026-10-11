<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Logout</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial,Helvetica,sans-serif;
    background:#f5f7fa;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.box{
    width:400px;
    background:white;
    padding:35px;
    border-radius:10px;
    text-align:center;
    box-shadow:0 0 15px rgba(0,0,0,.2);
}

h2{
    color:#009688;
}

p{
    margin:25px 0;
    font-size:18px;
}

.btn{
    text-decoration:none;
    padding:12px 25px;
    border-radius:6px;
    color:white;
    margin:10px;
    display:inline-block;
}

.yes{
    background:#009688;
}

.no{
    background:#e53935;
}

</style>

</head>

<body>

<div class="box">

<h2>Logout</h2>

<p>Are you sure you want to logout?</p>

<a href="<%=request.getContextPath()%>/LogoutServlet" class="btn yes">
Yes
</a>

<a href="<%=request.getContextPath()%>/UserDashboard" class="btn no">
    No
</a>

</div>

</body>
</html>