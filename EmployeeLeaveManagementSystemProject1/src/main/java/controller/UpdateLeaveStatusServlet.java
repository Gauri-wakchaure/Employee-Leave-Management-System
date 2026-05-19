package controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import dao.LeaveDAO;

@WebServlet("/UpdateLeaveStatusServlet")
public class UpdateLeaveStatusServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String status = request.getParameter("status");

			LeaveDAO dao = new LeaveDAO();
			dao.updateLeaveStatus(id, status);

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/admin/adminDashboard.jsp");
	}
}