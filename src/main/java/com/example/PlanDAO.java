package com.example;

import java.sql.*;
import java.util.*;

public class PlanDAO {

    public static void addPlan(String name, String duration, int price, String description) {
        String sql = "INSERT INTO plans(name, duration, price, description) VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, duration);
            ps.setInt(3, price);
            ps.setString(4, description);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<String[]> getAllPlans() {
        List<String[]> list = new ArrayList<>();
        String sql = "SELECT * FROM plans ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new String[] {
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("duration"),
                    rs.getString("price"),
                    rs.getString("description")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void deletePlan(int id) {
        String sql = "DELETE FROM plans WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
