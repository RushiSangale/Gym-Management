package com.example;

import java.sql.*;
import java.util.*;

public class TrainerDAO {

    public static void addTrainer(String name, String mobile, String email,
                                  String specialization, int experience, String status) {

        String sql = "INSERT INTO trainers(name, mobile, email, specialization, experience, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.setString(3, email);
            ps.setString(4, specialization);
            ps.setInt(5, experience);
            ps.setString(6, status);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    public static List<String[]> getAllTrainers() {
        List<String[]> list = new ArrayList<>();
        String sql = "SELECT * FROM trainers ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new String[] {
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("mobile"),
                    rs.getString("email"),
                    rs.getString("specialization"),
                    rs.getString("experience"),
                    rs.getString("status")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void deleteTrainer(int id) {
        String sql = "DELETE FROM trainers WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
