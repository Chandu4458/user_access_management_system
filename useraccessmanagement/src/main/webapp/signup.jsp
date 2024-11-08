<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
    <h2>User Registration</h2>
    <form action="SignUpServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>

        <!-- Role is hidden and defaulted to "Employee" -->
        <input type="hidden" name="role" value="Employee">

        <input type="submit" value="Sign Up">
    </form>

    <p>Already have an account? <a href="login.jsp">Login here</a>.</p>
</body>
</html>