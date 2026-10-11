<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Trainer</title>
<link rel="stylesheet" href="css/Style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>
 .member-form {
    max-width: 500px;
    margin: 0 auto;          
    background: #ffffff;
    padding: 25px 30px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
   }

    .page-title {
    text-align: center;
    margin-bottom: 20px;
    }

   .form-row {
    display: grid;
    grid-template-columns: 120px 1fr; 
    align-items: center;
    gap: 10px;
    margin-bottom: 12px;
    }

   .form-row label {
    font-weight: 600;
    color: #607d8b;
    }

    .member-form input,
    .member-form select {
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    }

    .member-form input:focus,
    .member-form select:focus {
    border-color: #009688;
    outline: none;
    }

    .form-actions {
    text-align: center;
    margin-top: 15px;
    }

    .btn-secondary {
    background: #90a4ae;
    color: #fff;
    padding: 8px 14px;
    border-radius: 4px;
    text-decoration: none;
    margin-left: 10px;
    }
</style>
</head>
<body>

<div class="topbar">
    <div class="logo"> RG-GYM - Admin</div>
    <div class="welcome">Welcome : Rushi</div>
</div>

<div class="wrapper">
  <div class="sidebar">
        <ul class="menu">
            <li><a href="AdminDashboard.jsp">Dashboard</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="Members.jsp" >Members</a></li>
            <li><a href="trainer.jsp" class="active">Trainers</a></li>
            <li><a href="Plans.jsp">Plans</a></li>
            <li><a href="Report.jsp">Report</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </div>
    
<div class="content">   
    
<form action="AddTrainer" method="post" class="member-form">
    <div class="form-row">
        <label>Name</label>
        <input type="text" name="name" required>
    </div>

    <div class="form-row">
        <label>Mobile</label>
        <input type="text" name="mobile" required>
    </div>

    <div class="form-row">
        <label>Email</label>
        <input type="email" name="email">
    </div>

    <div class="form-row">
        <label>Specialization</label>
        <input type="text" name="specialization" placeholder="Weight Training / Yoga / Cardio" required>
    </div>

    <div class="form-row">
        <label>Experience (years)</label>
        <input type="number" name="experience" min="0" required>
    </div>

    <div class="form-row">
        <label>Status</label>
        <select name="status">
            <option>ACTIVE</option>
            <option>INACTIVE</option>
        </select>
    </div>

    <div class="form-actions">
        <button type="submit" class="btn">Save</button>
        <a href="trainer.jsp" class="btn btn-secondary">Cancel</a>
    </div>
</form>
</div>
</div>  
</body>
</html>