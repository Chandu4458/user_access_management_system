package useraccessmanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/SoftwareServlet")
public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String accessLevels = request.getParameter("accessLevels");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setString(3, accessLevels);
            stmt.executeUpdate();
            response.sendRedirect("createSoftware.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

