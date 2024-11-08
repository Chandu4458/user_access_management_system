package useraccessmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String action = request.getParameter("action");  // Approve or Reject

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE requests SET status = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, action.equals("approve") ? "Approved" : "Rejected");
            stmt.setInt(2, requestId);
            stmt.executeUpdate();
            response.sendRedirect("pendingRequests.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
