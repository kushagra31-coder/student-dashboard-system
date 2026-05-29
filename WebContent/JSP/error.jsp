<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String message = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Error - Student Dashboard</title>
    <link rel="stylesheet" href="<%= contextPath %>/CSS/style.css" />
</head>
<body class="page-error">
    <main class="center-panel">
        <h1>Something went wrong</h1>
        <p><%= message != null ? message : "An unexpected error occurred. Please try again later." %></p>
        <a class="button primary" href="<%= contextPath %>/JSP/index.jsp">Return home</a>
    </main>
</body>
</html>
