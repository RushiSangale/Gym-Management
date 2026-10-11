package com.example;

import java.sql.*;
import java.util.*;

public class ReportDAO {

    public static int getTotalMembers() throws Exception {
        String sql = "SELECT COUNT(*) FROM members";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        }
        return 0;
    }

    public static int getActiveMembers() throws Exception {
        String sql = "SELECT COUNT(*) FROM members WHERE status='ACTIVE'";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        }
        return 0;
    }

    public static int getExpiredMembers() throws Exception {
        String sql = "SELECT COUNT(*) FROM members WHERE expiry_date < CURDATE()";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        }
        return 0;
    }

    public static double getMonthlyRevenue() throws Exception {
        String sql = "SELECT IFNULL(SUM(amount),0) FROM payments WHERE MONTH(payment_date)=MONTH(CURDATE())";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getDouble(1);
        }
        return 0;
    }

    public static List<String[]> getExpiringMembers() throws Exception {
        List<String[]> list = new ArrayList<>();
        String sql = "SELECT name, plan, expiry_date, mobile FROM members WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new String[]{
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4)
                });
            }
        }
        return list;
    }

    public static List<String[]> getRecentPayments() throws Exception {

        List<String[]> list = new ArrayList<>();

        String sql =
            "SELECT u.name, pl.name, p.amount, p.payment_type, p.payment_date " +
            "FROM payments p " +
            "JOIN members m ON p.member_id = m.id " +
            "JOIN users u ON m.user_id = u.id " +
            "JOIN plans pl ON m.plan_id = pl.id " +
            "ORDER BY p.id DESC LIMIT 5";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                list.add(new String[]{

                    rs.getString(1),   // User Name
                    rs.getString(2),   // Plan Name
                    rs.getString(3),   // Amount
                    rs.getString(4),   // Payment Type
                    rs.getString(5)    // Payment Date

                });

            }
        }
        return list;
    }
}
