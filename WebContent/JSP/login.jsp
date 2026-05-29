<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Student Dashboard</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body class="page-login">
    <main class="login-container">
        <div class="login-panel">
            <h1>Sign in</h1>
            <p>Enter your email and password to access the student dashboard.</p>
            <% if (error != null) { %>
                <div class="alert alert-danger"><%= error %></div>
            <% } %>
            <form method="post" action="<%= contextPath %>/login">
                <label>Email</label>
                <input type="email" name="email" placeholder="student@example.com" required />
                <label>Password</label>
                <input type="password" name="password" placeholder="Password" required />
                <button type="submit" class="button primary">Login</button>
            </form>
            <div class="login-notes">
                <p>Student default password: <strong>student123</strong></p>
                <p>Admin: <strong>admin@dashboard.com</strong> / <strong>admin123</strong></p>
                <p>Faculty: <strong>faculty@dashboard.com</strong> / <strong>faculty123</strong></p>
                <p>Placement: <strong>placement@dashboard.com</strong> / <strong>placement123</strong></p>
            </div>
        </div>
    </main>
</body>
</html>
