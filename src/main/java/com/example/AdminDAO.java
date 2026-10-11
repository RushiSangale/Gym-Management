package com.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    // 🔹 Get admin by username (for profile page)
    public static String[] getAdminByUsername(String username) {
        String sql = "SELECT name, email, contact, status FROM admin WHERE name = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new String[] {
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("contact"),
                    rs.getString("status")
                };
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 🔹 Update admin profile (password optional)
    public static void updateProfile(String username, String name, String email,
                                     String contact, String password) {

        boolean updatePassword = password != null && !password.trim().isEmpty();
        String sql;

        if (updatePassword) {
            sql = "UPDATE admin SET name=?, email=?, contact=?, password=? WHERE name=?";
        } else {
            sql = "UPDATE admin SET name=?, email=?, contact=? WHERE name=?";
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, contact);

            if (updatePassword) {
                ps.setString(4, password);      // (later you can hash this)
                ps.setString(5, username);
            } else {
                ps.setString(4, username);
            }

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 🔹 Log admin login (for dashboard)
    public static void logAdminLogin(String username) {
        String sql = "INSERT INTO admin_login_logs(username) VALUES(?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 🔹 Get recent admin logins (for dashboard table)
    public static List<String[]> getRecentAdminLogins() {
        List<String[]> list = new ArrayList<>();
        String sql = "SELECT username, login_time FROM admin_login_logs ORDER BY login_time DESC LIMIT 5";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new String[] {
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
