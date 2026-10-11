<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Integer userId=(Integer)session.getAttribute("userId");

if(userId==null){

    response.sendRedirect("../user.jsp");
    return;

}

String userName=(String)session.getAttribute("userName");

int planId=(Integer)request.getAttribute("planId");

String planName=(String)request.getAttribute("planName");

String duration=(String)request.getAttribute("duration");

double price=(Double)request.getAttribute("price");

String description=(String)request.getAttribute("description");

String transactionId="TXN"+System.currentTimeMillis();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Payment Gateway</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet"
href="css/Dashboard.css">

<style>

.payment-card{

background:white;

padding:35px;

border-radius:15px;

box-shadow:0 5px 15px rgba(0,0,0,.1);

max-width:650px;

margin:auto;

}

.payment-card h2{

text-align:center;

color:#009688;

margin-bottom:30px;

}

.info{

margin-bottom:18px;

font-size:18px;

}

.info span{

font-weight:bold;

color:#009688;

}

.payment-method{

margin-top:25px;

}

.payment-method label{

display:block;

margin:15px 0;

font-size:17px;

cursor:pointer;

}

.btn{

background:#009688;

color:white;

padding:12px 35px;

border:none;

border-radius:8px;

font-size:17px;

cursor:pointer;

margin-top:30px;

}

.btn:hover{

background:#00796b;

}

.cancel{

margin-left:15px;

background:#666;

}

</style>

</head>

<body>

<div class="sidebar">

<div class="logo">

RG GYM

</div>

<ul>

<li><a href="<%=request.getContextPath()%>/UserDashboardServlet"><i class="fa-solid fa-house"></i> Dashboard</a></li>

<li><a href="<%=request.getContextPath()%>/ProfileServlet"><i class="fa-solid fa-user"></i> Profile</a></li>

<li><a href="<%=request.getContextPath()%>/PlansServlet"><i class="fa-solid fa-dumbbell"></i> Plans</a></li>

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

<h2>Payment Gateway</h2>

<div class="user">

Welcome, <%=userName%>

</div>

</div>

<div class="container">

<div class="payment-card">

<h2>

<i class="fa-solid fa-credit-card"></i>

Payment Details

</h2>

<form action="<%=request.getContextPath()%>/PaymentSuccessServlet"

method="post">
<input type="hidden" name="planId" value="<%=planId%>">

<input type="hidden" name="transactionId"
value="<%=transactionId%>">

<div class="info">

Plan :
<span><%=planName%></span>

</div>

<div class="info">

Duration :
<span><%=duration%></span>

</div>

<div class="info">

Description :
<span><%=description%></span>

</div>

<div class="info">

Amount :
<span>₹ <%=String.format("%.0f",price)%></span>

</div>

<div class="info">

Transaction ID :
<span><%=transactionId%></span>

</div>

<div class="payment-method">

<h3>Select Payment Method</h3>

<label>

<input type="radio"
name="paymentType"
value="UPI"
checked>

UPI

</label>

<label>

<input type="radio"
name="paymentType"
value="Credit Card">

Credit/Debit Card

</label>

<label>

<input type="radio"
name="paymentType"
value="Debit Card">

Cash On Delivery

</label>

<label>

<input type="radio"
name="paymentType"
value="Net Banking">

Net Banking

</label>

</div>

<button class="btn" type="submit">

<i class="fa-solid fa-circle-check"></i>

Pay Now

</button>

<a href="<%=request.getContextPath()%>/PlansServlet">

<button type="button"
class="btn cancel">

Cancel

</button>

</a>

</form>

</div>

</div>

</div>

</body>

</html>