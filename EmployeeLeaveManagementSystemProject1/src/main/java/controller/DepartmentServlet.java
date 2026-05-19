package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import dao.DepartmentDAO;
import model.Department;

@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String name = request.getParameter("department");
        String shortform = request.getParameter("shortform");
        String codeStr = request.getParameter("code");

        int code = 0;

        if (codeStr != null && !codeStr.isEmpty()) {
            code = Integer.parseInt(codeStr);
        }

        DepartmentDAO dao = new DepartmentDAO();

        Department d = new Department();

        d.setDepartment(name);
        d.setShortform(shortform);
        d.setCode(code);

        if (idStr != null && !idStr.isEmpty()) {
            d.setId(Integer.parseInt(idStr));
            dao.updateDepartment(d);
        } else {
            dao.addDepartment(d);
        }

        response.sendRedirect(request.getContextPath()
                + "/DepartmentServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DepartmentDAO dao = new DepartmentDAO();

        String action = request.getParameter("action");

        if ("delete".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteDepartment(id);

            response.sendRedirect(request.getContextPath()
                    + "/DepartmentServlet");
            return;
        }

        if ("edit".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            Department d = dao.getDepartmentById(id);

            request.setAttribute("editDept", d);
        }

        List<Department> list = dao.getAllDepartments();
        request.setAttribute("deptList", list);

        RequestDispatcher rd =
        		request.getRequestDispatcher("/admin/department.jsp");
        
        rd.forward(request, response);
    }
}