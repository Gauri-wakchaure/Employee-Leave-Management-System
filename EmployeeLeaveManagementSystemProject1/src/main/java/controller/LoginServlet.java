package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(email.equals("admin@gmail.com")
                && password.equals("admin123")){

            HttpSession session = request.getSession();
            session.setAttribute("admin", email);

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/adminDashboard.jsp");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/adminLogin.jsp?error=invalid");
		}
	}
}