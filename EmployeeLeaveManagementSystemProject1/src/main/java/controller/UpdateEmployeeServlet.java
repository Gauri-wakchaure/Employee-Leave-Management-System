package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import dao.EmployeeDAO;
import model.Employee;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.getWriter().println("THIS IS NEW SERVLET CODE");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int deptId = Integer.parseInt(request.getParameter("dept_id"));

        Employee e = new Employee();

        e.setId(id);
        e.setName(name);
        e.setEmail(email);
        e.setPassword(password);
        e.setDeptid(deptId);

        EmployeeDAO dao = new EmployeeDAO();

        boolean status = dao.updateEmployee(e);

        if(status){
            response.sendRedirect("admin/employeeList.jsp");
        } else{
            response.getWriter().println("Update Failed");
        }
    }
}