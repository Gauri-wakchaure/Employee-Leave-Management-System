package controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import dao.LeaveDAO;
import model.Leave;

@WebServlet("/ApplyLeaveServlet")
public class ApplyLeaveServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		Integer empId = (Integer) session.getAttribute("empId");

		String type = request.getParameter("leaveType");
		String start = request.getParameter("startDate");
		String end = request.getParameter("endDate");

		Leave l = new Leave();
		l.setEmpId(empId);
		l.setLeaveType(type);
		l.setStartDate(start);
		l.setEndDate(end);

		LeaveDAO dao = new LeaveDAO();
		dao.applyLeave(l);

		response.sendRedirect(request.getContextPath() + "/employee/dashboard.jsp?msg=success");
	}
}