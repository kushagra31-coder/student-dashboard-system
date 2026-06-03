package Backend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class contactservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userRole") == null) {
            response.sendRedirect(request.getContextPath() + "/JSP/login.jsp");
            return;
        }
        request.getRequestDispatcher("/JSP/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userRole") == null) {
            response.sendRedirect(request.getContextPath() + "/JSP/login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty()
                || message == null || message.trim().isEmpty()) {
            request.setAttribute("error", "Please complete all fields before sending your message.");
        } else {
            request.setAttribute("success", "Your message has been received. A member of the student support team will contact you soon.");
        }
        request.getRequestDispatcher("/JSP/contact.jsp").forward(request, response);
    }
}
