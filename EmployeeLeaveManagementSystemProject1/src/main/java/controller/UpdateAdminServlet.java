package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import dao.AdminDAO;
import model.Admin;

@WebServlet("/UpdateAdminServlet")
public class UpdateAdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin a = new Admin();

        a.setEmail(email);
        a.setPassword(password);

        AdminDAO dao = new AdminDAO();

        boolean status = dao.updateAdmin(a);

        if (status) {

            response.getWriter().println(
                    "<script>alert('Username Password Updated Successfully');"
                            + "window.location='admin/adminDashboard.jsp#admin';</script>");

        } else {

            response.getWriter().println("Update Failed");
        }
    }
}