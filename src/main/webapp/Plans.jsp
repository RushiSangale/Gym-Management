<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*, com.example.PlanDAO" %>

<html>
<head>
<meta charset="UTF-8">
<title>Plans - Gym Management</title>
<link rel="stylesheet" href="css/Style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>
/* Reuse members header style */
    .members-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
    }

/* Card box */
.card {
    background: #fff;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    margin-bottom: 20px;
}

/* Table */
.details-table {
    width: 100%;
    border-collapse: collapse;
}

.details-table th,
.details-table td {
    padding: 10px;
    border-bottom: 1px solid #eee;
    text-align: left;
}

.details-table th {
    background: #f5f7fa;
    color: #607d8b;
    font-weight: 600;
}

/* Form */
.plan-form {
    max-width: 500px;
}

.form-row {
    display: grid;
    grid-template-columns: 140px 1fr;
    gap: 10px;
    margin-bottom: 12px;
}

.form-row label {
    font-weight: 600;
    color: #607d8b;
}

.plan-form input,
.plan-form textarea {
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 100%;
}

.form-actions {
    margin-top: 15px;
}
</style>
</head>
<body>

<div class="topbar">
    <div class="logo">RG GYM - Admin Panel</div>
    <div class="welcome">Welcome : Rushi</div>
</div>

<div class="wrapper">
    <div class="sidebar">
        <ul class="menu">
            <li><a href="AdminDashboard.jsp"><i class="fa-solid fa-house"></i>
            Dashboard</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="Members.jsp">Members</a></li>
            <li><a href="trainer.jsp">Trainers</a></li>
            <li><a href="Plans.jsp" class="active">Plans</a></li>
            <li><a href="Report.jsp">Report</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </div>

    <div class="content">

        <h2>Membership Plans</h2>

        <!-- 🔹 Plan List -->
        <div class="card">
            <div class="members-header">
                <h3>Plan List</h3>
                <a href="AddPlan.jsp" class="btn btn-primary">+ Add New Plan</a>
            </div>

           <table class="details-table members-table">
    <tr>
        <th>ID</th>
        <th>Plan Name</th>
        <th>Duration</th>
        <th>Price (₹)</th>
        <th>Description</th>
        <th>Action</th>
    </tr>

    <%
        List<String[]> plans = PlanDAO.getAllPlans();
        for (String[] p : plans) {
    %>
    <tr>
        <td><%= p[0] %></td>
        <td><%= p[1] %></td>
        <td><%= p[2] %></td>
        <td><%= p[3] %></td>
        <td><%= p[4] %></td>
        <td>
            <a href="DeletePlan?id=<%= p[0] %>" 
               class="btn btn-danger"
               onclick="return confirm('Delete this plan?')">
               Delete
            </a>
        </td>
    </tr>
    <% } %>
</table>
        </div>

    </div>
</div>

</body>
</html>
