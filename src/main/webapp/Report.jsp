<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.ReportDAO,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports - Gym Management</title>
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
    <style >
    .cards {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 15px;
    margin-bottom: 20px;
}

.card {
    background: #fff;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}

.details-table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    margin-bottom: 20px;
}

.details-table th, .details-table td {
    padding: 10px;
    border-bottom: 1px solid #eee;
}
    
    </style>
    
</head>
<body>

<div class="topbar">
    <div class="logo"> RG GYM - Admin Panel</div>
    <div class="welcome">Welcome : Admin</div>
</div>
<div class="wrapper">
    <div class="sidebar">
        <ul class="menu">
            <li><a href="AdminDashboard.jsp"><i class="fa-solid fa-house"></i>
            Dashboard</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="Members.jsp">Members</a></li>
            <li><a href="trainer.jsp">Trainer</a></li>           
            <li><a href="Plans.jsp">Plans</a></li>
            <li><a href="Report.jsp" class="active">Report</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </div>

    <div class="content">
        <div class="page-title">Reports</div>

<%
    int total = ReportDAO.getTotalMembers();
    int active = ReportDAO.getActiveMembers();
    double revenue = ReportDAO.getMonthlyRevenue();

    List<String[]> payments = ReportDAO.getRecentPayments();
%>

<div class="cards">
    <div class="card">Total Members <h3><%= total %></h3></div>
    <div class="card">Active Members <h3><%= active %></h3></div>
    <div class="card">Revenue (This Month) <h3>₹ <%= revenue %></h3></div>
</div>

<h3>Recent Payments</h3>
<table class="details-table">
<tr><th>Name</th><th>Plan</th><th>Amount</th><th>Type</th><th>Date</th></tr>
<% for(String[] p : payments){ %>
<tr>
<td><%= p[0] %></td>
<td><%= p[1] %></td>
<td>₹ <%= p[2] %></td>
<td><%= p[3] %></td>
<td><%= p[4] %></td>
</tr>
<% } %>
</table>


        
    </div>
</div>

</body>
</html>
