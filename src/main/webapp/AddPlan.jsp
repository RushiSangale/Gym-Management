<%@ page import="java.util.*, com.example.PlanDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plans - Gym Management</title>
<link rel="stylesheet" href="css/Style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style >
/* Card container (you already use this, but keep consistent) */
.card {
    background: #ffffff;
    border-radius: 8px;
    padding: 20px 25px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    margin-bottom: 20px;
}

/* Plan form container */
.plan-form {
    max-width: 520px;
}

/* Each row: label + input */
.form-row {
    display: grid;
    grid-template-columns: 140px 1fr;
    align-items: center;
    gap: 12px;
    margin-bottom: 12px;
}

/* Labels */
.form-row label {
    font-weight: 600;
    color: #607d8b;
}

/* Inputs & textarea */
.plan-form input,
.plan-form textarea {
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    width: 100%;
}

.plan-form textarea {
    resize: vertical;
    min-height: 70px;
}

/* Focus effect */
.plan-form input:focus,
.plan-form textarea:focus {
    border-color: #009688;
    outline: none;
}

/* Action buttons */
.form-actions {
    margin-top: 15px;
}

/* Button style (reuse your existing .btn if already defined) */
.btn {
    background: #009688;
    color: #fff;
    padding: 7px 14px;
    border-radius: 4px;
    border: none;
    cursor: pointer;
    font-size: 14px;
    justify-content: space-between;
}

.btn:hover {
    background: #00796b;
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
        <h3>Dashboard</h3>
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
        
        <!-- Add Plan -->
        <div class="card">
            <h3>Create New Plan</h3>
            <form action="AddPlan" method="post" class="plan-form">
                <div class="form-row">
                    <label>Plan Name</label>
                    <input type="text" name="name" required>
                </div>

                <div class="form-row">
                    <label>Duration</label>
                    <input type="text" name="duration" required>
                </div>

                <div class="form-row">
                    <label>Price (₹)</label>
                    <input type="number" name="price" required>
                </div>

                <div class="form-row">
                    <label>Description</label>
                    <textarea name="description" rows="3"></textarea>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn">Save Plan</button>
                    <a href="Plans.jsp" class="btn btn-danger">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
