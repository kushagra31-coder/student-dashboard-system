<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body class="page-home">
    <header class="hero-header">
        <div class="hero-brand">Student Dashboard</div>
        <nav class="hero-nav">
            <a href="<%= contextPath %>/JSP/login.jsp">Login</a>
            <a href="<%= contextPath %>/JSP/contact.jsp">Contact</a>
        </nav>
    </header>
    <main class="hero-main">
        <section class="hero-intro">
            <h1>Welcome to the Student Dashboard</h1>
            <p>Track your profile, document status, project details, achievements, and campus notifications from one place.</p>
            <div class="hero-actions">
                <a class="button primary" href="<%= contextPath %>/JSP/login.jsp">Sign In</a>
                <a class="button secondary" href="<%= contextPath %>/JSP/contact.jsp">Campus Support</a>
            </div>
        </section>
        <section class="hero-cards">
            <article class="card">
                <h2>Student portal</h2>
                <p>Access your dashboard, profile, and academic documents.</p>
            </article>
            <article class="card">
                <h2>Project tracking</h2>
                <p>Review project information and progress updates.</p>
            </article>
            <article class="card">
                <h2>Achievement records</h2>
                <p>Maintain certificates and accomplishments in a single view.</p>
            </article>
        </section>
    </main>
    <footer class="page-footer">
        <span>Student Dashboard &copy; 2026</span>
    </footer>
</body>
</html>
