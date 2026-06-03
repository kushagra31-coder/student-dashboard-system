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

public class documentservlet extends HttpServlet {
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
        List<String[]> documents = new ArrayList<>();
        List<String> requirements = new ArrayList<>();

        try (Connection conn = DBconnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT document_name, file_path, upload_date, status FROM documents WHERE student_id = ?")) {
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                documents.add(new String[] { rs.getString("document_name"), rs.getString("file_path"),
                        rs.getString("upload_date"), rs.getString("status") });
            }

            PreparedStatement reqStmt = conn.prepareStatement("SELECT document_name FROM university_requirements");
            ResultSet reqRs = reqStmt.executeQuery();
            while (reqRs.next()) {
                requirements.add(reqRs.getString("document_name"));
            }
        } catch (Exception e) {
            request.setAttribute("error", "Unable to load document information: " + e.getMessage());
        }

        request.setAttribute("documents", documents);
        request.setAttribute("requirements", requirements);
        request.getRequestDispatcher("/JSP/document.jsp").forward(request, response);
    }
}
