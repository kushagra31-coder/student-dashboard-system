<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home - Student Dashboard</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body class="page-home">
    <main class="center-panel">
        <h1>Welcome <%= name != null ? name : "to Student Dashboard" %></h1>
        <p>This portal helps students manage academic records, upload documents, and view placement support.</p>
        <div class="actions">
            <a class="button primary" href="<%= contextPath %>/JSP/studentdashboard.jsp">Dashboard</a>
            <a class="button secondary" href="<%= contextPath %>/profile">Profile</a>
        </div>
    </main>
</body>
</html>
