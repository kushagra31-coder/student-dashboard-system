<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String role = (String) session.getAttribute("userRole");
    if (role == null) {
        response.sendRedirect(contextPath + "/JSP/login.jsp");
        return;
    }
    if (!"placement".equals(role)) {
        response.sendRedirect(contextPath + "/JSP/unauthorized.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Placement Dashboard</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body>
    <header class="app-header">
        <div class="brand">Placement Dashboard</div>
        <div class="profile-summary">
            <a class="button secondary" href="<%= contextPath %>/JSP/logout.jsp">Logout</a>
        </div>
    </header>
    <main class="app-main">
        <section class="section-panel">
            <h1>Placement Coordinator</h1>
            <p>Manage placement activities, student preparation, and company engagement.</p>
            <div class="card-grid">
                <div class="card">
                    <h2>Interview planning</h2>
                    <p>Organize upcoming campus drives and student submissions.</p>
                </div>
                <div class="card">
                    <h2>Offer tracking</h2>
                    <p>Track placement opportunities and student placements.</p>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
