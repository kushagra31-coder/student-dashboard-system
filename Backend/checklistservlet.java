package Backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class checklistservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userRole") == null) {
            response.sendRedirect(request.getContextPath() + "/JSP/login.jsp");
            return;
        }
        if (!"student".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/JSP/unauthorized.jsp");
            return;
        }

        int studentId = session.getAttribute("studentId") instanceof Integer ? (Integer) session.getAttribute("studentId") : 0;
        List<String[]> achievements = new ArrayList<>();

        try (Connection conn = DBconnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT title, description FROM achievements WHERE student_id = ?")) {
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                achievements.add(new String[] { rs.getString("title"), rs.getString("description") });
            }
        } catch (Exception e) {
            request.setAttribute("error", "Unable to load achievement progress: " + e.getMessage());
        }

        request.setAttribute("achievements", achievements);
        request.getRequestDispatcher("/JSP/achievements.jsp").forward(request, response);
    }
}
