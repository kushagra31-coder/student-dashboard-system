<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    String name = request.getAttribute("name") != null ? (String) request.getAttribute("name")
            : (String) session.getAttribute("name");
    String email = request.getAttribute("email") != null ? (String) request.getAttribute("email")
            : (String) session.getAttribute("email");
    String phone = request.getAttribute("phone") != null ? (String) request.getAttribute("phone")
            : (String) session.getAttribute("phone");
    String branch = request.getAttribute("branch") != null ? (String) request.getAttribute("branch")
            : (String) session.getAttribute("branch");
    Integer semester = request.getAttribute("semester") != null ? (Integer) request.getAttribute("semester")
            : (Integer) session.getAttribute("semester");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile - Student Dashboard</title>
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
            <h1>Your Profile</h1>
            <div class="profile-grid">
                <div><strong>Name</strong><span><%= name != null ? name : "N/A" %></span></div>
                <div><strong>Email</strong><span><%= email != null ? email : "N/A" %></span></div>
                <div><strong>Phone</strong><span><%= phone != null ? phone : "N/A" %></span></div>
                <div><strong>Branch</strong><span><%= branch != null ? branch : "N/A" %></span></div>
                <div><strong>Semester</strong><span><%= semester != null ? semester : "N/A" %></span></div>
            </div>
        </section>
    </main>
    <footer class="page-footer">
        <span>Student Dashboard &copy; 2026</span>
    </footer>
</body>
</html>
