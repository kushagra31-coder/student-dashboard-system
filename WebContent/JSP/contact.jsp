<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String role = (String) session.getAttribute("userRole");
    if (role == null) {
        response.sendRedirect(contextPath + "/JSP/login.jsp");
        return;
    }
    String success = (String) request.getAttribute("success");
    String error = (String) request.getAttribute("error");
    String userName = (String) session.getAttribute("name");
    String userEmail = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Support - Student Dashboard</title>
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
            <h1>Contact Student Support</h1>
            <% if (success != null) { %>
                <div class="alert alert-success"><%= success %></div>
            <% } else if (error != null) { %>
                <div class="alert alert-danger"><%= error %></div>
            <% } %>
            <form method="post" action="<%= contextPath %>/contact" class="contact-form">
                <label>Name</label>
                <input type="text" name="name" value="<%= userName != null ? userName : "" %>" required />
                <label>Email</label>
                <input type="email" name="email" value="<%= userEmail != null ? userEmail : "" %>" required />
                <label>Message</label>
                <textarea name="message" rows="5" required></textarea>
                <button type="submit" class="button primary">Send Message</button>
            </form>
        </section>
    </main>
    <footer class="page-footer">
        <span>Student Dashboard &copy; 2026</span>
    </footer>
</body>
</html>
