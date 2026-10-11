package com.example;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import com.example.DBConnection;

public class MemberDAO {

    public static List<String[]> getAllMembers() {
        List<String[]> list = new ArrayList<>();
        String sql =
        		"SELECT m.id,u.name,up.mobile,u.email,p.name,m.join_date,m.expiry_date,m.status " +
        		"FROM members m " +
        		"JOIN users u ON m.user_id=u.id " +
        		"LEFT JOIN user_profile up ON u.id=up.user_id " +
        		"JOIN plans p ON m.plan_id=p.id " +
        		"ORDER BY m.id DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
            	list.add(new String[]{

            			rs.getString(1), // Member Id
            			rs.getString(2), // Name
            			rs.getString(3), // Mobile
            			rs.getString(4), // Email
            			rs.getString(5), // Plan
            			rs.getString(6), // Join Date
            			rs.getString(7), // Expiry Date
            			rs.getString(8)  // Status

            			});
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void deleteMember(int id) {
        String sql = "DELETE FROM members WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
