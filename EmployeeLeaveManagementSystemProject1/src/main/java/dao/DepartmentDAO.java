package dao;

import java.sql.*;
import java.util.*;
import model.Department;

public class DepartmentDAO {

	// INSERT
	public boolean addDepartment(Department d) {
		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO department(department, shortform, code) VALUES (?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, d.getDepartment());
			ps.setString(2, d.getShortform());
			ps.setInt(3, d.getCode());

			int rows = ps.executeUpdate();
			if (rows > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	// FETCH ALL
	public List<Department> getAllDepartments() {
		List<Department> list = new ArrayList<>();

		try {
			Connection con = DBConnection.getConnection();
			String sql = "SELECT * FROM department";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Department d = new Department();

				d.setId(rs.getInt("id"));
				d.setDepartment(rs.getString("department"));
				d.setShortform(rs.getString("shortform"));
				d.setCode(rs.getInt("code"));

				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// DELETE
	public boolean deleteDepartment(int id) {
		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();
			String sql = "DELETE FROM department WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			int rows = ps.executeUpdate();
			if (rows > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	// GET BY ID
	public Department getDepartmentById(int id) {
		Department d = new Department();

		try {
			Connection con = DBConnection.getConnection();
			String sql = "SELECT * FROM department WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				d.setId(rs.getInt("id"));
				d.setDepartment(rs.getString("department"));
				d.setShortform(rs.getString("shortform"));
				d.setCode(rs.getInt("code"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}

	// UPDATE
	public boolean updateDepartment(Department d) {
		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			String sql = "UPDATE department SET department=?, shortform=?, code=? WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, d.getDepartment());
			ps.setString(2, d.getShortform());
			ps.setInt(3, d.getCode());
			ps.setInt(4, d.getId());

			int rows = ps.executeUpdate();
			if (rows > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	// COUNT TOTAL DEPARTMENTS
	public int getDepartmentCount() {
		int count = 0;

		try {
			Connection con = DBConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM department";
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

	public String getDepartmentNameById(int id) {
		String name = "";

		try {
			Connection con = DBConnection.getConnection();
			String sql = "SELECT department FROM department WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				name = rs.getString("department");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return name;
	}

	public List<String> getDepartments() {
		List<String> list = new ArrayList<>();

		try {
			Connection con = DBConnection.getConnection();
			String query = "SELECT department FROM department";

			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString("department"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}