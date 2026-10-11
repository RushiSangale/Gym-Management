<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.util.*, com.example.DashboardDAO" %>
 <%@ page import="com.example.ReportDAO,java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gym Management - Admin Dashboard </title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
    <style>
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
    .details-table th {
    text-align: left;
    font-size: 13px;
    color: #607d8b;
    border-bottom: 1px solid #eee;
    padding-bottom: 8px;
   }
 
   .details-table tr:hover {
    background: #f5f7fa;
    }
    
    
    </style>
</head>
<body>
    <div class="topbar">
        <div class="logo">RG - GYM</div>
        <div class="welcome">
       
            <%
                String adminName = (String) session.getAttribute("adminName");
                if (adminName == null || adminName.trim().isEmpty()) {
                    adminName = "Admin";
                }
            %>
            Welcome : <%= adminName %>
        </div>
    </div>

    <div class="wrapper">

        <div class="sidebar">

            <ul class="menu">
                <li><a href="AdminDashboard.jsp" class="active">
                <i class="fa-solid fa-house"></i>
                Dashboard</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="Members.jsp">Members</a></li>
                <li><a href="trainer.jsp">Trainers</a></li>
                <li><a href="Plans.jsp">Plans</a></li>
                <li><a href="Report.jsp">Report</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>

       
        <div class="content">
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

<div class="dashboard-grid" style="margin-top:20px; display:flex; gap:20px;">

    <!-- Recent Activity -->
    <div class="card" style="flex:1;">
        <div class="card-header">Recent Activity</div>
        <table class="details-table">
            <tr>
                <th>Name</th>
                <th>Action</th>
                <th>Date</th>
            </tr>
            <%
                List<String[]> activities = DashboardDAO.getRecentActivity();
                for (String[] row : activities) {
            %>
            <tr>
                <td><%= row[0] %></td>
                <td><%= row[1] %></td>
                <td><%= row[2] %></td>
            </tr>
            <% } %>
        </table>
    </div>

    <!-- Login History -->
    <div class="card" style="flex:1;">
        <div class="card-header">Recent Admin Logins</div>
        <table class="details-table">
            <tr>
                <th>Username</th>
                <th>Login Time</th>
            </tr>
            <%
                List<String[]> logins = DashboardDAO.getLoginHistory();
                for (String[] row : logins) {
            %>
            <tr>
                <td><%= row[0] %></td>
                <td><%= row[1] %></td>
            </tr>
            <% } %>
        </table>
        </div>
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
