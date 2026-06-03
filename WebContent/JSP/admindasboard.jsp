<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String role = (String) session.getAttribute("userRole");
    if (role == null) {
        response.sendRedirect(contextPath + "/JSP/login.jsp");
        return;
    }
    if (!"admin".equals(role)) {
        response.sendRedirect(contextPath + "/JSP/unauthorized.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body>
    <header class="app-header">
        <div class="brand">Student Dashboard Admin</div>
        <div class="profile-summary">
            <a class="button secondary" href="<%= contextPath %>/JSP/logout.jsp">Logout</a>
        </div>
    </header>
    <main class="app-main">
        <section class="section-panel">
            <h1>Administrator Console</h1>
            <p>Use this console to manage course requirements, registration workflow, and student progress metrics.</p>
            <div class="card-grid">
                <div class="card">
                    <h2>Student overview</h2>
                    <p>Review student enrollment and active projects.</p>
                </div>
                <div class="card">
                    <h2>Document policy</h2>
                    <p>Maintain document verification rules and upload deadlines.</p>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
