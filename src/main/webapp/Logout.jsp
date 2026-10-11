<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Page</title>
    <link rel="stylesheet" href="css/Style.css">
    <style >
    .logout-container {
    display: flex;
    align-items: center;
    justify-content: center;
    height: calc(100vh - 60px); /* adjust if topbar height differs */
    }

    .logout-card {
    background: #ffffff;
    padding: 30px 40px;
    border-radius: 8px;
    width: 350px;
    height:250px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .logout-card h2 {
      margin-bottom: 20px;
      font-size:30px;
      margin-top:20px;
      color: #009688;
    }

    .logout-card p {
    margin-bottom: 20px;
    margin-top:20px;
    color: #555;
    }

    .logout-actions {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 20px;
    }

    .btn-danger {
    background: #e53935;
    color: #fff;
    padding: 8px 16px;
    border-radius: 4px;
    text-decoration: none;
    }

    .btn-secondary {
    background: #90a4ae;
    color: #fff;
    padding: 8px 16px;
    border-radius: 4px;
    text-decoration: none;
    }

    .btn-danger:hover {
    background: #c62828;
    }

    .btn-secondary:hover {
    background: #78909c;
    }
    
    </style>
</head>
<body>
<div class="topbar">
    <div class="logo"> RG-GYM - Admin</div>
    <div class="welcome">Welcome : Rushi</div>
</div>
<div class="logout-container">
    <div class="logout-card">
        <h2>Confirm Logout</h2>
        <p>Are you sure you want to logout?</p>

        <div class="logout-actions">
            <!-- Yes: Call Logout Servlet -->
            <a href="Logout" class="btn btn-danger">Yes, Logout</a>

            <!-- No: Go back to dashboard -->
            <a href="AdminDashboard.jsp" class="btn btn-secondary">Cancel</a>
        </div>
    </div>
</div>
</body>
</html>