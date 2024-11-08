<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Software</title>
</head>
<body>
    <h2>Add New Software Application</h2>
    <form action="SoftwareServlet" method="post">
        <label for="name">Software Name:</label>
        <input type="text" name="name" required><br><br>

        <label for="description">Description:</label><br>
        <textarea name="description" rows="4" cols="50"></textarea><br><br>

        <label>Access Levels:</label><br>
        <input type="checkbox" name="accessLevels" value="Read"> Read<br>
        <input type="checkbox" name="accessLevels" value="Write"> Write<br>
        <input type="checkbox" name="accessLevels" value="Admin"> Admin<br><br>

        <input type="submit" value="Add Software">
    </form>
</body>
</html>
