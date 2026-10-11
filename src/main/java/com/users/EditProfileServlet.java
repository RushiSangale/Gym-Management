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

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
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
        String profilePhoto = "";

        try {

            con = DBConnection.getConnection();

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
                profilePhoto = rs.getString("profile_photo");

            }

            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("mobile", mobile);
            request.setAttribute("gender", gender);
            request.setAttribute("dob", dob);
            request.setAttribute("address", address);
            request.setAttribute("profilePhoto", profilePhoto);

            request.getRequestDispatcher("User/EditProfile.jsp")
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