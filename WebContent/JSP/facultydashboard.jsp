<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String role = (String) session.getAttribute("userRole");
    if (role == null) {
        response.sendRedirect(contextPath + "/JSP/login.jsp");
        return;
    }
    if (!"faculty".equals(role)) {
        response.sendRedirect(contextPath + "/JSP/unauthorized.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Faculty Dashboard</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body>
    <header class="app-header">
        <div class="brand">Faculty Dashboard</div>
        <div class="profile-summary">
            <a class="button secondary" href="<%= contextPath %>/JSP/logout.jsp">Logout</a>
        </div>
    </header>
    <main class="app-main">
        <section class="section-panel">
            <h1>Faculty Dashboard</h1>
            <p>Access student mentoring tools, project review status, and guidance resources.</p>
            <div class="card-grid">
                <div class="card">
                    <h2>Student progress</h2>
                    <p>Review active student placements and performance summaries.</p>
                </div>
                <div class="card">
                    <h2>Project guidance</h2>
                    <p>Track student project submissions and faculty comments.</p>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
