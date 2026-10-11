package com.users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {

            response.sendRedirect("user.jsp");
            return;

        }

        int userId = (Integer) session.getAttribute("userId");

        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");

        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = DBConnection.getConnection();

            con.setAutoCommit(false);

            // ===========================
            // Update users table
            // ===========================

            String userSql =
                    "UPDATE users SET name=? WHERE id=?";

            ps = con.prepareStatement(userSql);

            ps.setString(1, name);
            ps.setInt(2, userId);

            ps.executeUpdate();

            ps.close();

            // ===========================
            // Check if profile exists
            // ===========================

            String checkSql =
                    "SELECT COUNT(*) FROM user_profile WHERE user_id=?";

            ps = con.prepareStatement(checkSql);

            ps.setInt(1, userId);

            var rs = ps.executeQuery();

            rs.next();

            int count = rs.getInt(1);

            rs.close();
            ps.close();

            if (count == 0) {

                // Insert Profile

                String insertSql =
                        "INSERT INTO user_profile(user_id,mobile,gender,dob,address) VALUES(?,?,?,?,?)";

                ps = con.prepareStatement(insertSql);

                ps.setInt(1, userId);
                ps.setString(2, mobile);
                ps.setString(3, gender);
                ps.setString(4, dob);
                ps.setString(5, address);

                ps.executeUpdate();

            } else {

                // Update Profile

                String profileSql =
                        "UPDATE user_profile SET mobile=?,gender=?,dob=?,address=? WHERE user_id=?";

                ps = con.prepareStatement(profileSql);

                ps.setString(1, mobile);
                ps.setString(2, gender);
                ps.setString(3, dob);
                ps.setString(4, address);
                ps.setInt(5, userId);

                ps.executeUpdate();

            }

            con.commit();

            // Update Session Name
            session.setAttribute("userName", name);

            response.sendRedirect("ProfileServlet");

        } catch (Exception e) {

            try {

                if (con != null)
                    con.rollback();

            } catch (Exception ex) {
            }

            e.printStackTrace();

            response.sendRedirect("ProfileServlet");

        } finally {

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