package Backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class studentservlet extends HttpServlet {
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
        if (studentId > 0) {
            try (Connection conn = DBconnection.getConnection();
                    PreparedStatement stmt = conn.prepareStatement("SELECT student_id, name, email, phone, branch, semester FROM students WHERE student_id = ?")) {
                stmt.setInt(1, studentId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    request.setAttribute("studentId", rs.getInt("student_id"));
                    request.setAttribute("name", rs.getString("name"));
                    request.setAttribute("email", rs.getString("email"));
                    request.setAttribute("phone", rs.getString("phone"));
                    request.setAttribute("branch", rs.getString("branch"));
                    request.setAttribute("semester", rs.getInt("semester"));
                }
            } catch (Exception e) {
                request.setAttribute("error", "Unable to load profile details: " + e.getMessage());
            }
        }
        request.getRequestDispatcher("/JSP/profile.jsp").forward(request, response);
    }
}
