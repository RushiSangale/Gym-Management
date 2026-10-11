<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%
String userName=(String)request.getAttribute("userName");

String planName=(String)request.getAttribute("planName");

String status=(String)request.getAttribute("status");

String expiryDate=(String)request.getAttribute("expiryDate");

String amount=(String)request.getAttribute("amount");

ArrayList<String> activities=
(ArrayList<String>)request.getAttribute("activities");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>User Dashboard</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/Dashboard.css">

</head>

<body>

<!-- Sidebar -->

<div class="sidebar">

<div class="logo">
RG GYM
</div>

<ul>

<li>
<a href="<%=request.getContextPath()%>/UserDashboard">
<i class="fa-solid fa-house"></i>
Dashboard
</a>
</li>

<li>
<a href="<%=request.getContextPath()%>/ProfileServlet">
<i class="fa-solid fa-user"></i>
Profile
</a>
</li>

<li>
<a href="<%=request.getContextPath()%>/PlansServlet">
<i class="fa-solid fa-dumbbell"></i>
Plans
</a>
</li>

<li>
    <a href="User/LogoutConfirm.jsp">
        <i class="fa-solid fa-right-from-bracket"></i>
        Logout
    </a>
</li>

</ul>

</div>

<!-- Main -->

<div class="main">

<div class="navbar">

<h2>User Dashboard</h2>

<div class="user">

Welcome, <%=userName%>

</div>

</div>

<div class="container">
<!-- Dashboard Cards -->

<div class="cards">

    <div class="card">
        <i class="fa-solid fa-id-card"></i>
        <h3>Active Plan</h3>
        <p><%= planName %></p>
    </div>

    <div class="card">
        <i class="fa-solid fa-circle-check"></i>
        <h3>Membership Status</h3>
        <p><%= status %></p>
    </div>

    <div class="card">
        <i class="fa-solid fa-calendar-days"></i>
        <h3>Expiry Date</h3>
        <p><%= expiryDate %></p>
    </div>

    <div class="card">
        <i class="fa-solid fa-wallet"></i>
        <h3>Last Payment</h3>
        <p>₹ <%= amount %></p>
    </div>

</div>

<!-- Recent Activity -->

<div class="activity">

    <h2>Recent Activity</h2>

    <ul>

    <%

    if(activities != null && !activities.isEmpty()){

        for(String activity : activities){

    %>

        <li>
            <i class="fa-solid fa-check-circle"
               style="color:#009688;margin-right:10px;"></i>

            <%= activity %>
        </li>

    <%

        }

    }else{

    %>

        <li>No Recent Activity</li>

    <%

    }

    %>

    </ul>

</div>

</div>

</div>

</body>

</html>