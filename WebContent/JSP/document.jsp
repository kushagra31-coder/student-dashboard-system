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
    List<String[]> documents = (List<String[]>) request.getAttribute("documents");
    List<String> requirements = (List<String>) request.getAttribute("requirements");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Documents - Student Dashboard</title>
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
            <h1>Document Status</h1>
            <p>Review the documents you have submitted and the university requirements you should complete.</p>
            <% if (documents != null && !documents.isEmpty()) { %>
                <table class="data-table">
                    <thead>
                        <tr><th>Document</th><th>Uploaded File</th><th>Upload Date</th><th>Status</th></tr>
                    </thead>
                    <tbody>
                        <% for (String[] document : documents) { %>
                            <tr>
                                <td><%= document[0] %></td>
                                <td><%= document[1] != null && !document[1].isEmpty() ? document[1] : "Not uploaded" %></td>
                                <td><%= document[2] != null ? document[2] : "-" %></td>
                                <td><%= document[3] != null ? document[3] : "Pending" %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <div class="alert alert-info">No uploaded documents found yet. Please upload your copies through the campus portal.</div>
            <% } %>
        </section>
        <section class="section-panel">
            <h2>Required Documents</h2>
            <% if (requirements != null && !requirements.isEmpty()) { %>
                <ul class="bullet-list">
                    <% for (String requirement : requirements) { %>
                        <li><%= requirement %></li>
                    <% } %>
                </ul>
            <% } else { %>
                <div class="alert alert-info">University requirements are not available yet. Check back after the next update.</div>
            <% } %>
        </section>
    </main>
    <footer class="page-footer">
        <span>Student Dashboard &copy; 2026</span>
    </footer>
</body>
</html>
