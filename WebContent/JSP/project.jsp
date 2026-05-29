<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%
    String contextPath = request.getContextPath();
    String role = (String) session.getAttribute("userRole");
    if (role == null) {
        response.sendRedirect(contextPath + "/JSP/login.jsp");
        return;
    }
    if (!"student".equals(role)) {
        response.sendRedirect(contextPath + "/JSP/unauthorized.jsp");
        return;
    }
    List<String[]> projects = (List<String[]>) request.getAttribute("projects");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Projects - Student Dashboard</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body>
    <header class="app-header">
        <div class="brand">Student Dashboard</div>
        <div class="profile-summary">
            <a class="button secondary" href="<%= contextPath %>/JSP/logout.jsp">Logout</a>
        </div>
    </header>
    <nav class="app-nav">
        <a href="<%= contextPath %>/JSP/studentdashboard.jsp">Dashboard</a>
        <a href="<%= contextPath %>/profile">Profile</a>
        <a href="<%= contextPath %>/documents">Documents</a>
        <a href="<%= contextPath %>/projects">Projects</a>
        <a href="<%= contextPath %>/achievements">Achievements</a>
        <a href="<%= contextPath %>/contact">Contact</a>
    </nav>
    <main class="app-main">
        <section class="section-panel">
            <h1>Project Tracker</h1>
            <% if (projects != null && !projects.isEmpty()) { %>
                <% for (String[] project : projects) { %>
                    <article class="project-card">
                        <h2><%= project[0] %></h2>
                        <p><%= project[1] != null ? project[1] : "Project description not provided." %></p>
                    </article>
                <% } %>
            <% } else { %>
                <div class="alert alert-info">No projects available for your profile yet. Connect with your faculty coordinator to get started.</div>
            <% } %>
        </section>
    </main>
    <footer class="page-footer">
        <span>Student Dashboard &copy; 2026</span>
    </footer>
</body>
</html>
