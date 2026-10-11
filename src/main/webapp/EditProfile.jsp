<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<link rel="stylesheet" href="css/Style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style >
.edit {
     color: green;
     text-align: end;
     font-size: 30px;
}

.profile-simple {
    display: block;
    width: 800px;
    margin: 10px auto;      /* 👈 centers in middle */
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
.profile-simple {
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
 
<h3 class="edit" >Edit Profile</h3><br><br>

    <form action="UpdateProfile" method="post" class="profile-simple">
        <div class="form-line">
            <label>Name</label>
            <input type="text" name="name" value="Admin" required>
        </div>

        <div class="form-line">
            <label>Email</label>
            <input type="email" name="email" value="admin@gym.com" required>
        </div>

        <div class="form-line">
            <label>Contact</label>
            <input type="text" name="contact" value="9876543210" required>
        </div>

        <div class="form-line">
            <label>New Password</label>
            <input type="password" name="password" placeholder="New Password">
        </div>

        <button type="submit" class="btn btn-primary">Save Changes</button>
        <a href="profile.jsp" class="btn btn-info" style="background-color: red">Back</a>
    </form>
</div>
</body>
</html>