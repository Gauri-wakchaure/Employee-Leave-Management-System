package dao;

import java.sql.*;
import java.util.*;
import model.Leave;

public class LeaveDAO {

	private Leave map(ResultSet rs) throws SQLException {
		Leave l = new Leave();
		l.setId(rs.getInt("id"));
		l.setEmpId(rs.getInt("emp_id"));
		l.setLeaveType(rs.getString("type"));
		l.setStartDate(rs.getString("start_date"));
		l.setEndDate(rs.getString("end_date"));
		l.setStatus(rs.getString("status"));
		return l;
	}

	private int getCount(String sql) {
		int c = 0;
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			if (rs.next())
				c = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	public int getTotalLeaves() {
		return getCount("SELECT COUNT(*) FROM leave_table");
	}

	public int getPendingLeaves() {
		return getCount("SELECT COUNT(*) FROM leave_table WHERE status='Pending'");
	}

	public int getApprovedLeaves() {
		return getCount("SELECT COUNT(*) FROM leave_table WHERE status='Approved'");
	}

	public int getDeclinedLeaves() {
		return getCount("SELECT COUNT(*) FROM leave_table WHERE status='Declined'");
	}

	// APPLY LEAVE
	public boolean applyLeave(Leave l) {

		try (Connection con = DBConnection.getConnection()) {

			String sql = "INSERT INTO leave_table(emp_id, type, start_date, end_date, status) VALUES(?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, l.getEmpId());
			ps.setString(2, l.getLeaveType());
			ps.setString(3, l.getStartDate());
			ps.setString(4, l.getEndDate());
			ps.setString(5, "Pending");

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	// EMPLOYEE LEAVES
	public List<Leave> getLeavesByEmpId(int empId) {

		List<Leave> list = new ArrayList<>();

		try (Connection con = DBConnection.getConnection()) {

			String sql = "SELECT * FROM leave_table WHERE emp_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, empId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list.add(map(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// STATUS
	public List<Leave> getLeavesByStatusAndEmpId(String status, int empId) {

		List<Leave> list = new ArrayList<>();

		try (Connection con = DBConnection.getConnection()) {

			String sql = "SELECT * FROM leave_table WHERE status=? AND emp_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, status);
			ps.setInt(2, empId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list.add(map(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// ADMIN STATUS
	public List<Leave> getLeavesByStatus(String status) {

		List<Leave> list = new ArrayList<>();

		try (Connection con = DBConnection.getConnection()) {

			String sql = "SELECT * FROM leave_table WHERE status=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, status);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list.add(map(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// UPDATE STATUS
	public boolean updateLeaveStatus(int id, String status) {

		try (Connection con = DBConnection.getConnection()) {

			String sql = "UPDATE leave_table SET status=? WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, status);
			ps.setInt(2, id);

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
}