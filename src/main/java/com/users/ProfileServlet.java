package com.users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("user.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String name = "";
        String email = "";
        String mobile = "";
        String gender = "";
        String dob = "";
        String address = "";
        String profilePhoto = "images/default-profile.png";

        String planName = "No Plan";
        String status = "Inactive";
        String joinDate = "-";
        String expiryDate = "-";

        try {

            con = DBConnection.getConnection();

            // ===========================
            // User + Profile Information
            // ===========================

            String sql =
                    "SELECT u.name,u.email,p.mobile,p.gender,p.dob,p.address,p.profile_photo " +
                    "FROM users u " +
                    "LEFT JOIN user_profile p ON u.id=p.user_id " +
                    "WHERE u.id=?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            rs = ps.executeQuery();

            if (rs.next()) {

                name = rs.getString("name");
                email = rs.getString("email");
                mobile = rs.getString("mobile");
                gender = rs.getString("gender");
                dob = rs.getString("dob");
                address = rs.getString("address");

                if (rs.getString("profile_photo") != null &&
                        !rs.getString("profile_photo").isEmpty()) {

                    profilePhoto = rs.getString("profile_photo");
                }

            }

            rs.close();
            ps.close();

            // ===========================
            // Membership Details
            // ===========================

            String memberSql =
                    "SELECT p.name,m.join_date,m.expiry_date,m.status " +
                    "FROM members m " +
                    "JOIN plans p ON m.plan_id=p.id " +
                    "WHERE m.user_id=?";

            ps = con.prepareStatement(memberSql);
            ps.setInt(1, userId);

            rs = ps.executeQuery();

            if (rs.next()) {

                planName = rs.getString("name");
                joinDate = rs.getString("join_date");
                expiryDate = rs.getString("expiry_date");
                status = rs.getString("status");

            }

            // ===========================
            // Send to JSP
            // ===========================

            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("mobile", mobile);
            request.setAttribute("gender", gender);
            request.setAttribute("dob", dob);
            request.setAttribute("address", address);
            request.setAttribute("profilePhoto", profilePhoto);

            request.setAttribute("planName", planName);
            request.setAttribute("joinDate", joinDate);
            request.setAttribute("expiryDate", expiryDate);
            request.setAttribute("status", status);

            request.getRequestDispatcher("User/Profile.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            try {
                if (rs != null)
                    rs.close();
            } catch (Exception e) {
            }

            try {
                if (ps != null)
                    ps.close();
            } catch (Exception e) {
            }

            try {
                if (con != null)
                    con.close();
            } catch (Exception e) {
            }

        }

    }
}