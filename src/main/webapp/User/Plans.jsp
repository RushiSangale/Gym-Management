<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.model.Plan"%>

<%
ArrayList<Plan> plans =
(ArrayList<Plan>)request.getAttribute("plans");

String userName =
(String)session.getAttribute("userName");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Membership Plans</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/Dashboard.css">

<style>

.plan-container{

display:grid;

grid-template-columns:repeat(auto-fit,minmax(320px,1fr));

gap:30px;

}

.plan-card{

background:white;

border-radius:15px;

padding:30px;

box-shadow:0 5px 15px rgba(0,0,0,.1);

transition:.3s;

}

.plan-card:hover{

transform:translateY(-8px);

}

.plan-title{

font-size:28px;

font-weight:bold;

color:#009688;

margin-bottom:15px;

}

.plan-price{

font-size:35px;

font-weight:bold;

margin-bottom:20px;

color:#333;

}

.plan-duration{

font-size:18px;

margin-bottom:15px;

color:#666;

}

.plan-description{

min-height:80px;

color:#555;

margin-bottom:25px;

}

.buy-btn{

display:inline-block;

background:#009688;

color:white;

text-decoration:none;

padding:12px 30px;

border-radius:8px;

font-weight:bold;

transition:.3s;

}

.buy-btn:hover{

background:#00796b;

}

</style>

</head>

<body>

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

<li>
    <a href="User/LogoutConfirm.jsp">
        <i class="fa-solid fa-right-from-bracket"></i>
        Logout
    </a>
</li>

</ul>

</div>

<div class="main">

<div class="navbar">

<h2>Membership Plans</h2>

<div class="user">

Welcome, <%=userName%>

</div>

</div>

<div class="container">

<h2 style="margin-bottom:30px;color:#009688;">

Choose Your Membership Plan

</h2>

<div class="plan-container">
<%

if(plans != null && !plans.isEmpty()){

    for(Plan plan : plans){

%>

<div class="plan-card">

    <div class="plan-title">

        <i class="fa-solid fa-dumbbell"></i>

        <%=plan.getName()%>

    </div>

    <div class="plan-price">

        ₹ <%=String.format("%.0f", plan.getPrice())%>

    </div>

    <div class="plan-duration">

        <i class="fa-solid fa-calendar-days"></i>

        Duration :
        <%=plan.getDuration()%>

    </div>

    <div class="plan-description">

        <%=plan.getDescription()%>

    </div>

    <a href="<%=request.getContextPath()%>/BuyPlanServlet?planId=<%=plan.getId()%>"
       class="buy-btn">

        <i class="fa-solid fa-credit-card"></i>

        Buy Now

    </a>

</div>

<%

    }

}else{

%>

<div style="background:white;
padding:40px;
border-radius:15px;
text-align:center;
box-shadow:0 5px 15px rgba(0,0,0,.1);
width:100%;">

    <h2>No Plans Available</h2>

    <p>Please contact Admin.</p>

</div>

<%

}

%>

</div>

</div>

</div>

</body>

</html>