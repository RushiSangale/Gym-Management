<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Profile - Gym Management</title>
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
    <style >
.profile-simple {
    display: block;
    width: 600px;
    margin: 20px auto;      /* 👈 centers in middle */
}

.profile-simple h2,
.profile-simple h3 {
    margin-bottom: 15px;
}

.profile-line {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    border-bottom: 1px solid #eee;
    font-size: 15px;
}

.profile-line .label {
    color: #607d8b;
    font-weight: 600;
}

.profile-line .value {
    color: #333;
}

.status-active {
    color: #2e7d32;
    font-weight: bold;
}

/* Simple form */
.profile-form-simple {
    margin-top: 15px;
}

.form-line {
    display: flex;
    flex-direction: column;
    margin-bottom: 12px;
}

.form-line label {
    font-size: 13px;
    color: #607d8b;
    margin-bottom: 4px;
}

.form-line input {
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.form-line input:focus {
    border-color: #009688;
    outline: none;
}
         
    </style>
</head>
<body>

<div class="topbar">
    <div class="logo"> RG GYMMS - Admin</div>
    <div class="welcome">Welcome : Admin</div>
</div>

<div class="wrapper">
    <div class="sidebar">
        <ul class="menu">
            <li><a href="AdminDashboard.jsp"><i class="fa-solid fa-house"></i>
            Dashboard</a></li>
            <li><a href="profile.jsp" class="active">Profile</a></li>
            <li><a href="Members.jsp">Members</a></li>
            <li><a href="trainer.jsp">Trainers</a></li>
            <li><a href="Plans.jsp">Plans</a></li>
            <li><a href="Report.jsp">Report</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
    
    
<div class="profile-simple">

    <h2>Admin Profile</h2>

    <div class="profile-line">
        <span class="label">Name:</span>
        <span class="value">Rushi</span>
    </div>

    <div class="profile-line">
        <span class="label">Email:</span>
        <span class="value">rushisangale017@gmail.com</span>
    </div>

    <div class="profile-line">
        <span class="label">Contact:</span>
        <span class="value">7666686512</span>
    </div>

    <div class="profile-line">
        <span class="label">Role:</span>
        <span class="value">Admin</span>
    </div>

    <div class="profile-line">
        <span class="label">Status:</span>
        <span class="value status-active">Active</span>
    </div>

    <a href="EditProfile.jsp" class="btn btn-primary" style="margin-top:15px;">Edit Profile</a>    

</div>

</div>

</body>
</html>
