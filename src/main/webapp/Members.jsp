<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.example.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Members - RG GYM</title>
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="css/Style.css">
<style >
.members-header {
    display: flex;
    justify-content: space-between;  /* pushes button to right */
    align-items: center;
    margin-bottom: 8px;
}

.members-header h2 {
    margin: 0;
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
.btn-danger {
    background: #e53935;
}

.btn-danger:hover {
    background: #c62828;
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
            <li><a href="AdminDashboard.jsp"><i class="fa-solid fa-house"></i>Dashboard</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="Members.jsp" class="active">Members</a></li>
            <li><a href="trainer.jsp">Trainers</a></li>
            <li><a href="Plans.jsp">Plans</a></li>
            <li><a href="Report.jsp">Report</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </div>

    <div class="content">

        <div class="members-header">
            <h2>All Members</h2>
        </div>

        <table class="details-table members-table">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Plan</th>
                <th>Join Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%
                List<String[]> members = MemberDAO.getAllMembers();
                for (String[] m : members) {
            %>
            <tr>
                <td><%= m[0] %></td>
                <td><%= m[1] %></td>
                <td><%= m[2] %></td>
                <td><%= m[3] %></td>
                <td><%= m[4] %></td>
                <td><%= m[5] %></td>
                <td><%= m[6] %></td>
                <td>
                    <a href="DeleteMember?id=<%= m[0] %>" class="btn btn-danger"
                       onclick="return confirm('Delete this member?')">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>

    </div>
</div>

</body>
</html>
