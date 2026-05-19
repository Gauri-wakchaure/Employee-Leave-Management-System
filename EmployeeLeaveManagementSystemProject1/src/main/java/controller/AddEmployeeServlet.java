package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import model.Employee;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Servlet Called");

		try {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			int deptId = Integer.parseInt(request.getParameter("dept_id"));

			System.out.println(name);
			System.out.println(email);
			System.out.println(password);
			System.out.println(deptId);

			Employee e = new Employee();

			e.setName(name);
			e.setEmail(email);
			e.setPassword(password);
			e.setDeptid(deptId);

			EmployeeDAO dao = new EmployeeDAO();

			boolean status = dao.addEmployee(e);

			if (status) {

				System.out.println("Inserted Successfully");

				response.sendRedirect(request.getContextPath() + "/admin/adminDashboard.jsp?section=emp");

			} else {

				System.out.println("Insert Failed");
				response.getWriter().println("Insert Failed");

			}

		} catch (Exception ex) {

			ex.printStackTrace();
			response.getWriter().println("Error : " + ex.getMessage());

		}
	}
}