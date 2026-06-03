package Backend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class facultyservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userRole") == null) {
            response.sendRedirect(request.getContextPath() + "/JSP/login.jsp");
            return;
        }
        if (!"faculty" .equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/JSP/unauthorized.jsp");
            return;
        }
        request.getRequestDispatcher("/JSP/facultydashboard.jsp").forward(request, response);
    }
}
