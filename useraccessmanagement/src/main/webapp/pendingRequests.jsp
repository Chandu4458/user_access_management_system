<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Manager")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Requests</title>
</head>
<body>
    <h2>Pending Access Requests</h2>
    <form action="ApprovalServlet" method="post">
        <table border="1">
            <tr>
                <th>Employee Name</th>
                <th>Software Name</th>
                <th>Access Type</th>
                <th>Reason</th>
                <th>Action</th>
            </tr>
            <% 
                Connection conn = DatabaseConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(
                    "SELECT requests.id, users.username, software.name, requests.access_type, requests.reason " +
                    "FROM requests " +
                    "JOIN users ON requests.user_id = users.id " +
                    "JOIN software ON requests.software_id = software.id " +
                    "WHERE requests.status = 'Pending'"
                );
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int requestId = rs.getInt("id");
                    String employeeName = rs.getString("username");
                    String softwareName = rs.getString("name");
                    String accessType = rs.getString("access_type");
                    String reason = rs.getString("reason");
            %>
            <tr>
                <td><%= employeeName %></td>
                <td><%= softwareName %></td>
                <td><%= accessType %></td>
                <td><%= reason %></td>
                <td>
                    <button type="submit" name="action" value="approve_<%= requestId %>">Approve</button>
                    <button type="submit" name="action" value="reject_<%= requestId %>">Reject</button>
                </td>
            </tr>
            <% 
                }
                rs.close();
                ps.close();
                conn.close();
            %>
        </table>
    </form>
</body>
</html>
