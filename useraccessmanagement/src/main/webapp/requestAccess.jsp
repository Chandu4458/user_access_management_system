<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Employee")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Request Access</title>
</head>
<body>
    <h2>Request Access to Software</h2>
    <form action="RequestServlet" method="post">
        <label for="softwareId">Software Name:</label>
        <select name="softwareId" required>
            <!-- Dynamically populate options from the database -->
            <% 
                Connection conn = DatabaseConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("SELECT id, name FROM software");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
            %>
                <option value="<%= id %>"><%= name %></option>
            <% 
                } 
                rs.close();
                ps.close();
                conn.close();
            %>
        </select><br><br>

        <label for="accessType">Access Type:</label>
        <select name="accessType" required>
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Admin">Admin</option>
        </select><br><br>

        <label for="reason">Reason for Request:</label><br>
        <textarea name="reason" rows="4" cols="50" required></textarea><br><br>

        <input type="submit" value="Request Access">
    </form>
</body>
</html>
