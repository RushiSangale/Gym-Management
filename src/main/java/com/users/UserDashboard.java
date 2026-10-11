package com.users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.example.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserDashboard")
public class UserDashboard extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("user.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        String userName = (String) session.getAttribute("userName");

        String planName = "No Plan";
        String status = "Inactive";
        String expiryDate = "-";
        String amount = "0";

        ArrayList<String> activities = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int memberId = 0;

        try {

            con = DBConnection.getConnection();

            // ==========================
            // Membership Details
            // ==========================

            String memberSql =
            		"SELECT m.id,p.name,m.status,m.expiry_date " +
            		"FROM members m " +
            		"JOIN plans p ON m.plan_id=p.id " +
            		"WHERE m.user_id=?";

            ps = con.prepareStatement(memberSql);

            ps.setInt(1, userId);

            rs = ps.executeQuery();

            if (rs.next()) {

                memberId = rs.getInt("id");
                planName = rs.getString("name");
                status = rs.getString("status");
                expiryDate = rs.getString("expiry_date");

            }

            rs.close();
            ps.close();

            // ==========================
            // Last Payment
            // ==========================

            if (memberId != 0) {

                String paymentSql =
                        "SELECT amount FROM payments " +
                        "WHERE member_id=? " +
                        "ORDER BY payment_date DESC LIMIT 1";

                ps = con.prepareStatement(paymentSql);

                ps.setInt(1, memberId);

                rs = ps.executeQuery();

                if (rs.next()) {

                    amount = rs.getString("amount");

                }

                rs.close();
                ps.close();

            }

            // ==========================
            // Recent Activity
            // ==========================

            String activitySql =
                    "SELECT action " +
                    "FROM recent_activity " +
                    "WHERE user_id=? " +
                    "ORDER BY activity_time DESC LIMIT 5";

            ps = con.prepareStatement(activitySql);

            ps.setInt(1, userId);

            rs = ps.executeQuery();

            while (rs.next()) {

                activities.add(rs.getString("action"));

            }

            // ==========================
            // Send data to JSP
            // ==========================

            request.setAttribute("userName", userName);
            request.setAttribute("planName", planName);
            request.setAttribute("status", status);
            request.setAttribute("expiryDate", expiryDate);
            request.setAttribute("amount", amount);
            request.setAttribute("activities", activities);

            request.getRequestDispatcher("User/UserDashboard.jsp")
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