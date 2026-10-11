package com.example;

import java.sql.*;
import java.util.*;

public class DashboardDAO {

	public static List<String[]> getRecentActivity() throws Exception {

	    List<String[]> list = new ArrayList<>();

	    String sql =
	        "SELECT u.name, r.action, r.activity_time " +
	        "FROM recent_activity r " +
	        "JOIN users u ON r.user_id = u.id " +
	        "ORDER BY r.activity_time DESC LIMIT 5";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {

	            list.add(new String[] {
	                rs.getString("name"),
	                rs.getString("action"),
	                rs.getString("activity_time")
	            });

	        }

	    }

	    return list;
	}

    public static List<String[]> getLoginHistory() {
        List<String[]> list = new ArrayList<>();
        String sql = "SELECT username, login_time FROM admin_login_logs ORDER BY login_time DESC LIMIT 5";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new String[]{
                    rs.getString("username"),
                    rs.getString("login_time")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
