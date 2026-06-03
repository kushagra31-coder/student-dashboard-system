<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Unauthorized</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body class="page-unauthorized">
    <main class="center-panel">
        <h1>Access denied</h1>
        <p>You do not have permission to view this page.</p>
        <div class="actions">
            <a class="button primary" href="<%= contextPath %>/JSP/index.jsp">Go home</a>
            <a class="button secondary" href="<%= contextPath %>/JSP/login.jsp">Sign in</a>
        </div>
    </main>
</body>
</html>
