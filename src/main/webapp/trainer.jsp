<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*, com.example.TrainerDAO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer Page</title>
<link rel="stylesheet" href="css/Style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style >
/* Header row: title left, add button right */
.members-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 8px;
}

.members-header h2 {
    margin: 0;
}

/* Tables */
.details-table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
}

.details-table th,
.details-table td {
    padding: 10px;
    border-bottom: 1px solid #eee;
    text-align: left;
    font-size: 14px;
}

.details-table th {
    background: #f5f7fa;
    color: #607d8b;
    font-weight: 600;
}

.details-table tr:hover {
    background: #f9fbfc;
}

/* Buttons */
.btn {
    background: #009688;
    color: #fff;
    padding: 6px 12px;
    border-radius: 4px;
    text-decoration: none;
    border: none;
    cursor: pointer;
    font-size: 13px;
}

.btn:hover {
    background: #00796b;
}

.btn-primary {
    background: #009688;
}

.btn-danger {
    background: #e53935;
}

.btn-danger:hover {
    background: #c62828;
}

.btn-secondary {
    background: #90a4ae;
}

.btn-secondary:hover {
    background: #78909c;
}

/* Spacing so table is closer to header */
.members-table {
    margin-top: 5px;
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
            <li><a href="AdminDashboard.jsp"><i class="fa-solid fa-house"></i>
            Dashboard</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="Members.jsp" >Members</a></li>
            <li><a href="trainer.jsp" class="active">Trainers</a></li>
            <li><a href="Plans.jsp">Plans</a></li>
            <li><a href="Report.jsp">Report</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="content">

        <div class="members-header">
            <h2>All Trainers</h2>
            <a href="AddTrainer.jsp" class="btn btn-primary">+ Add Trainer</a>
        </div>

        <table class="details-table members-table">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Specialization</th>
                <th>Experience</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%
                List<String[]> trainers = TrainerDAO.getAllTrainers();
                for (String[] t : trainers) {
            %>
            <tr>
                <td><%= t[0] %></td>
                <td><%= t[1] %></td>
                <td><%= t[2] %></td>
                <td><%= t[3] %></td>
                <td><%= t[4] %></td>
                <td><%= t[5] %> yrs</td>
                <td><%= t[6] %></td>
                <td>
                    <a href="DeleteTrainer?id=<%= t[0] %>" class="btn btn-danger"
                       onclick="return confirm('Delete this trainer?')">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</div>
</body>
</html>