<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Logged Out</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body class="page-logout">
    <main class="center-panel">
        <h1>You have been signed out</h1>
        <p>Thanks for using the student dashboard. Choose one of the options below to continue.</p>
        <a class="button primary" href="<%= contextPath %>/JSP/login.jsp">Sign in again</a>
        <a class="button secondary" href="<%= contextPath %>/JSP/index.jsp">Return home</a>
    </main>
</body>
</html>
