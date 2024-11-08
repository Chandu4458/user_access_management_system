package useraccessmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RequestServlet")
public class RequestServlet<HttpServletResponse> extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = (int) request.getSession().getAttribute("userId");
        int softwareId = Integer.parseInt(request.getParameter("softwareId"));
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO requests (user_id, software_id, access_type, reason) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, softwareId);
            stmt.setString(3, accessType);
            stmt.setString(4, reason);
            stmt.executeUpdate();
            response.sendRedirect("requestAccess.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

