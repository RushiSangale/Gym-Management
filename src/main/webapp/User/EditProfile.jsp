<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<%
String name=(String)request.getAttribute("name");
String email=(String)request.getAttribute("email");
String mobile=(String)request.getAttribute("mobile");
String gender=(String)request.getAttribute("gender");
String dob=(String)request.getAttribute("dob");
String address=(String)request.getAttribute("address");
String profilePhoto=(String)request.getAttribute("profilePhoto");

if(profilePhoto==null || profilePhoto.isEmpty()){
    profilePhoto="../images/default-profile.png";
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Profile</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/Dashboard.css">

<style>

.form-card{

background:white;

padding:35px;

border-radius:15px;

box-shadow:0 5px 15px rgba(0,0,0,.1);

max-width:700px;

margin:auto;

}

.form-card h2{

color:#009688;

margin-bottom:25px;

}

.form-group{

margin-bottom:18px;

}

.form-group label{

display:block;

margin-bottom:8px;

font-weight:bold;

}

.form-group input,

.form-group textarea,

.form-group select{

width:100%;

padding:12px;

border:1px solid #ddd;

border-radius:8px;

font-size:15px;

}

textarea{

resize:none;

height:100px;

}

.profile-image{

text-align:center;

margin-bottom:25px;

}

.profile-image img{

width:130px;

height:130px;

border-radius:50%;

border:4px solid #009688;

object-fit:cover;

margin-bottom:15px;

}

.btn{

background:#009688;

color:white;

padding:12px 30px;

border:none;

border-radius:8px;

font-size:16px;

cursor:pointer;

}

.btn:hover{

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

<li><a href="UserDashboard"><i class="fa-solid fa-house"></i> Dashboard</a></li>

<li><a href="ProfileServlet"><i class="fa-solid fa-user"></i> Profile</a></li>

<li><a href="PlansServlet"><i class="fa-solid fa-dumbbell"></i> Plans</a></li>

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

<h2>Edit Profile</h2>

<div class="user">

Welcome, <%=name%>

</div>

</div>

<div class="container">

<div class="form-card">

<h2>Edit Your Profile</h2>

<form action="UpdateProfileServlet" method="post">

<div class="profile-image">

<img src="<%=profilePhoto%>">

</div>
<!-- Name -->

<div class="form-group">

    <label>Name</label>

    <input type="text"
           name="name"
           value="<%=name%>"
           required>

</div>

<!-- Email -->

<div class="form-group">

    <label>Email</label>

    <input type="email"
           value="<%=email%>"
           readonly>

</div>

<!-- Mobile -->

<div class="form-group">

    <label>Mobile</label>

    <input type="text"
           name="mobile"
           value="<%=mobile==null?"":mobile%>"
           placeholder="Enter Mobile Number">

</div>

<!-- Gender -->

<div class="form-group">

    <label>Gender</label>

    <select name="gender">

        <option value="">Select Gender</option>

        <option value="Male"
        <%= "Male".equals(gender) ? "selected" : "" %>>
        Male
        </option>

        <option value="Female"
        <%= "Female".equals(gender) ? "selected" : "" %>>
        Female
        </option>

        <option value="Other"
        <%= "Other".equals(gender) ? "selected" : "" %>>
        Other
        </option>

    </select>

</div>

<!-- Date of Birth -->

<div class="form-group">

    <label>Date of Birth</label>

    <input type="date"
           name="dob"
           value="<%=dob==null?"":dob%>">

</div>

<!-- Address -->

<div class="form-group">

    <label>Address</label>

    <textarea
        name="address"
        placeholder="Enter Address"><%=address==null?"":address%></textarea>

</div>

<!-- Buttons -->

<div style="text-align:center;margin-top:25px;">

    <button type="submit" class="btn">

        <i class="fa-solid fa-floppy-disk"></i>

        Update Profile

    </button>

    <a href="../ProfileServlet"
       style="
       margin-left:15px;
       background:#6c757d;
       color:white;
       padding:12px 30px;
       border-radius:8px;
       text-decoration:none;">

        Cancel

    </a>

</div>

</form>

</div>

</div>

</div>

</body>

</html>