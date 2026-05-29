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
    String name = (String) session.getAttribute("name");
    String branch = (String) session.getAttribute("branch");
    Integer semester = (Integer) session.getAttribute("semester");
    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body>
    <header class="app-header">
        <div class="brand">Student Dashboard</div>
        <div class="profile-summary">
            <span>Welcome, <strong><%= name != null ? name : "Student" %></strong></span>
            <span><%= email != null ? email : "" %></span>
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
        <section class="section-overview">
            <div class="overview-card">
                <h2>Academic Profile</h2>
                <p><strong>Branch:</strong> <%= branch != null ? branch : "N/A" %></p>
                <p><strong>Semester:</strong> <%= semester != null ? semester : "N/A" %></p>
            </div>
            <div class="overview-card">
                <h2>Actions</h2>
                <ul>
                    <li><a href="<%= contextPath %>/profile">View Profile</a></li>
                    <li><a href="<%= contextPath %>/documents">Document Status</a></li>
                    <li><a href="<%= contextPath %>/projects">Project Tracker</a></li>
                </ul>
            </div>
        </section>
        <section class="dashboard-widgets">
            <article class="widget">
                <h3>Upcoming tasks</h3>
                <p>Upload pending documents and confirm your current project plan.</p>
            </article>
            <article class="widget">
                <h3>Tips</h3>
                <p>Keep your profile information up to date and use the contact form to speak with support.</p>
            </article>
        </section>
    </main>
    <footer class="page-footer">
        <span>Student Dashboard &copy; 2026</span>
    </footer>
</body>
</html>
