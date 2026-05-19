package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.Admin;

public class AdminDAO {

    public boolean updateAdmin(Admin a) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE admin SET email=?, password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, a.getEmail());
            ps.setString(2, a.getPassword());

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