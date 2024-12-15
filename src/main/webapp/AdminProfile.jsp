<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <link rel="stylesheet" href="AdminProfile.css">
</head>
<body>
    <header>
        <img src="ResortLogo.png" alt="MD Resort Logo" style=" width: 75px; height: auto;">
        <div class="logo" style="margin-left: -200px;">MD Resort Pantai Siring Melaka</div>        
        <nav>
            <a href="AdminDashboard.jsp">Dashboard</a>
            <a href="SalesReport.jsp">Sales Report</a>
            <a href="Rooms.jsp">Room</a>
            <a href="Facilities.jsp">Facilities</a>
        </nav>
        <div class="profile-icon">
            <img src="Profile.png" alt="MD Resort Logo" style=" width: 45px; height: auto;">
        </div>
    </header>

    <!-- Success Message after Profile Update -->
    <%
        if ("success".equals(request.getParameter("update"))) {
    %>
        <div class="success-message">
            <p>Your profile was successfully updated!</p>
        </div>
    <%
        }
    %>

    <!-- Error Handling for Empty Field or Update Failure -->
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <div class="error-message">
            <p style="color: red;">
                <%
                    if ("emptyField".equals(error)) {
                %>
                    Please fill in the field.
                <%
                    } else if ("updateFailed".equals(error)) {
                %>
                    Failed to update profile. Please try again.
                <%
                    } else if ("exception".equals(error)) {
                %>
                    An error occurred while updating your profile.
                <%
                    } else {
                %>
                    Unknown error occurred.
                <%
                    }
                %>
            </p>
        </div>
    <%
        }
    %>

    <!-- Profile Header -->
    <section class="profile-header">
        <img src="Profile.png" alt="MD Resort Logo" style=" width: 45px; height: auto;">
        <h2>@<%= (request.getAttribute("staffName") != null) ? request.getAttribute("staffName") : "N/A" %></h2>
        <p><%= (request.getAttribute("staffEmail") != null) ? request.getAttribute("staffEmail") : "N/A" %></p>
    </section>

    <!-- User Profile Section -->
    <section class="card">
        <h3>Admin Profile</h3>
        <div class="info">
            <span>Username:</span>
            <span>
                <%= (request.getAttribute("staffName") != null) ? request.getAttribute("staffName") : "N/A" %>
                <a href="EditProfile.jsp?field=staffName">Edit</a>
            </span>
        </div>
        <div class="info">
            <span>Email Address:</span>
            <span>
                <%= (request.getAttribute("staffEmail") != null) ? request.getAttribute("staffEmail") : "N/A" %>
                <a href="EditProfile.jsp?field=staffEmail">Edit</a>
            </span>
        </div>
        <div class="info">
            <span>Phone Number:</span>
            <span>
                <%= (request.getAttribute("staffPhoneNo") != null) ? request.getAttribute("staffPhoneNo") : "N/A" %>
                <a href="EditProfile.jsp?field=staffPhoneNo">Edit</a>
            </span>
        </div>
    </section>

    <!-- Security Section -->
    <section class="card">
        <h3>Security</h3>
        <div class="info">
            <span>Password:</span>
            <span>**** <a href="ChangePassword.jsp">Change Password</a></span>
        </div>
        <div class="info">
            <span>Delete Account:</span>
            <a href="DeleteAccount.jsp" style="color: red;">Delete Account</a>
        </div>
    </section>

    <!-- Logout Button -->
    <form action="AdminProfile.jsp?logout=true" method="post">
        <button type="submit" class="btn-logout">LOG OUT</button>
    </form>

    <%
        // Invalidate session if logout parameter is present
        String logout = request.getParameter("logout");
        if ("true".equals(logout)) {
            session.invalidate(); // Invalidate the session
            response.sendRedirect("index.jsp"); // Redirect to Admin Register page
        }
    %>

</body>
</html>
