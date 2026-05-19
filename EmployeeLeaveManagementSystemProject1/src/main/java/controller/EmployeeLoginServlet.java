package controller;

import java.io.IOException;

import dao.EmployeeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Employee;

@WebServlet("/EmployeeLoginServlet")
public class EmployeeLoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		EmployeeDAO dao = new EmployeeDAO();

		Employee emp = dao.login(email, password);

		if (emp != null) {

			HttpSession session = request.getSession();

			session.setAttribute("empId", emp.getId());
			session.setAttribute("empName", emp.getName());

			response.sendRedirect("employee/dashboard.jsp");

		} else {

			response.getWriter().println("Invalid Login");
		}
	}
}