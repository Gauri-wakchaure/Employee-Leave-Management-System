package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Employee;

public class EmployeeDAO {

	// ADD EMPLOYEE
	public boolean addEmployee(Employee e) {

	    boolean status = false;

	    Connection con = null;
	    PreparedStatement ps = null;

	    try {

	        con = DBConnection.getConnection();

	        if (con == null) {
	            System.out.println("Connection NULL in addEmployee");
	            return false;
	        }

	        String sql = "INSERT INTO employee(name,email,password,dept_id) VALUES(?,?,?,?)";

	        ps = con.prepareStatement(sql);

	        ps.setString(1, e.getName());
	        ps.setString(2, e.getEmail());
	        ps.setString(3, e.getPassword());
	        ps.setInt(4, e.getDeptid());

	        int row = ps.executeUpdate();

	        if (row > 0) {
	            status = true;
	            System.out.println("Insert Success");
	        }

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }

	    return status;
	}
	// EMPLOYEE LOGIN
	public Employee login(String email, String password) {

		Employee emp = null;

		try {
			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM employee WHERE email=? AND password=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				emp = new Employee();

				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setEmail(rs.getString("email"));
				emp.setPassword(rs.getString("password"));
				emp.setDeptid(rs.getInt("dept_id"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return emp;
	}

	// GET ALL EMPLOYEES
	public List<Employee> getAllEmployees() {

		List<Employee> list = new ArrayList<>();

		try {
			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM employee";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Employee e = new Employee();

				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setEmail(rs.getString("email"));
				e.setPassword(rs.getString("password"));
				e.setDeptid(rs.getInt("dept_id"));

				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;
	}

	// EMPLOYEE COUNT
	public int getEmployeeCount() {

		int count = 0;

		try {
			Connection con = DBConnection.getConnection();

			String sql = "SELECT COUNT(*) FROM employee";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	public boolean updateEmployee(Employee e) {

		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			if (con == null) {
				System.out.println("DB not connected");
				return false;
			}

			String sql = "UPDATE employee SET name=?, email=?, password=?, dept_id=? WHERE id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, e.getName());
			ps.setString(2, e.getEmail());
			ps.setString(3, e.getPassword());
			ps.setInt(4, e.getDeptid());
			ps.setInt(5, e.getId());

			int row = ps.executeUpdate();

			if (row > 0) {
				status = true;
			}

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	// DELETE EMPLOYEE
	public boolean deleteEmployee(int id) {

		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			String sql = "DELETE FROM employee WHERE id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);

			int row = ps.executeUpdate();

			if (row > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
}