<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String name=(String)request.getAttribute("name");
String email=(String)request.getAttribute("email");
String mobile=(String)request.getAttribute("mobile");
String gender=(String)request.getAttribute("gender");
String dob=(String)request.getAttribute("dob");
String address=(String)request.getAttribute("address");

String planName=(String)request.getAttribute("planName");
String joinDate=(String)request.getAttribute("joinDate");
String expiryDate=(String)request.getAttribute("expiryDate");
String status=(String)request.getAttribute("status");

String profilePhoto=(String)request.getAttribute("profilePhoto");

if(profilePhoto==null || profilePhoto.isEmpty()){
    profilePhoto="../images/default-profile.png";
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>User Profile</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,Helvetica,sans-serif;
}

body{
background:#f5f7fa;
display:flex;
}

/* Sidebar */

.sidebar{
width:250px;
height:100vh;
background:#009688;
position:fixed;
color:white;
}

.logo{
padding:25px;
font-size:28px;
font-weight:bold;
text-align:center;
border-bottom:1px solid rgba(255,255,255,.2);
}

.sidebar ul{
list-style:none;
margin-top:20px;
}

.sidebar ul li{
padding:18px 25px;
transition:.3s;
}

.sidebar ul li:hover{
background:#00796b;
}

.sidebar ul li a{
text-decoration:none;
color:white;
font-size:17px;
display:block;
}

.sidebar i{
margin-right:12px;
}

/* Main */

.main{
margin-left:250px;
width:100%;
}

/* Navbar */

.navbar{
background:white;
padding:18px 30px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.navbar h2{
color:#009688;
}

.user{
font-size:17px;
font-weight:bold;
}

/* Container */

.container{
padding:35px;
}

/* Profile Header */

.profile-header{

background:white;

border-radius:15px;

padding:30px;

text-align:center;

box-shadow:0 5px 15px rgba(0,0,0,.1);

margin-bottom:30px;

}

.profile-header img{

width:130px;

height:130px;

border-radius:50%;

border:5px solid #009688;

object-fit:cover;

}

.profile-header h2{

margin-top:15px;

color:#333;

}

.profile-header p{

margin-top:8px;

font-size:16px;

color:#666;

}

.active{

display:inline-block;

margin-top:10px;

padding:8px 20px;

background:#009688;

color:white;

border-radius:25px;

font-size:14px;

}

</style>

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

<h2>User Profile</h2>

<div class="user">

Welcome, <%=name%>

</div>

</div>

<div class="container">

<div class="profile-header">

<img src="<%=profilePhoto%>">

<h2><%=name%></h2>

<p><%=email%></p>

<span class="active">

<%=status%>

</span>

</div>
<!-- Profile Details -->

<div style="display:grid;
grid-template-columns:1fr 1fr;
gap:25px;">

    <!-- Personal Information -->

    <div style="background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.1);">

        <h2 style="color:#009688;
        margin-bottom:20px;">
            <i class="fa-solid fa-user"></i>
            Personal Information
        </h2>

        <table style="width:100%;border-spacing:12px;">

            <tr>
                <td><b>Name</b></td>
                <td><%=name%></td>
            </tr>

            <tr>
                <td><b>Email</b></td>
                <td><%=email%></td>
            </tr>

            <tr>
                <td><b>Mobile</b></td>
                <td><%=mobile==null?"Not Updated":mobile%></td>
            </tr>

            <tr>
                <td><b>Gender</b></td>
                <td><%=gender==null?"Not Updated":gender%></td>
            </tr>

            <tr>
                <td><b>Date of Birth</b></td>
                <td><%=dob==null?"Not Updated":dob%></td>
            </tr>

            <tr>
                <td><b>Address</b></td>
                <td><%=address==null?"Not Updated":address%></td>
            </tr>

        </table>

    </div>

    <!-- Membership Information -->

    <div style="background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.1);">

        <h2 style="color:#009688;
        margin-bottom:20px;">
            <i class="fa-solid fa-id-card"></i>
            Membership Details
        </h2>

        <table style="width:100%;border-spacing:12px;">

            <tr>
                <td><b>Current Plan</b></td>
                <td><%=planName%></td>
            </tr>

            <tr>
                <td><b>Status</b></td>
                <td>
                    <span style="
                    background:#009688;
                    color:white;
                    padding:5px 15px;
                    border-radius:20px;">
                    <%=status%>
                    </span>
                </td>
            </tr>

            <tr>
                <td><b>Join Date</b></td>
                <td><%=joinDate%></td>
            </tr>

            <tr>
                <td><b>Expiry Date</b></td>
                <td><%=expiryDate%></td>
            </tr>

        </table>

    </div>

</div>

<!-- Buttons -->

<div style="margin-top:35px;
text-align:center;">

<a href="<%=request.getContextPath()%>/EditProfileServlet"
       style="
       background:#009688;
       color:white;
       text-decoration:none;
       padding:12px 30px;
       border-radius:8px;
       margin-right:15px;
       display:inline-block;
       font-weight:bold;">

        <i class="fa-solid fa-user-pen"></i>

        Edit Profile

    </a>


</div>

</div>

</div>

</body>

</html>