package com.users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import com.example.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PaymentSuccessServlet")
public class PaymentSuccessServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("userId") == null) {

            response.sendRedirect("user.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        int planId = Integer.parseInt(request.getParameter("planId"));

        String paymentType = request.getParameter("paymentType");

        String transactionId = request.getParameter("transactionId");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            // =========================================================
            // 1. GET SELECTED PLAN DETAILS
            // =========================================================

            String sql = "SELECT * FROM plans WHERE id=?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, planId);

            rs = ps.executeQuery();

            double amount = 0;
            String duration = "";

            if (rs.next()) {

                amount = rs.getDouble("price");

                // trim() removes unwanted spaces
                duration = rs.getString("duration").trim();

            } else {

                throw new ServletException("Plan not found!");

            }

            rs.close();
            ps.close();


            // =========================================================
            // 2. CONVERT PLAN DURATION INTO MONTHS / YEARS
            // =========================================================

            int monthsToAdd = 0;
            int yearsToAdd = 0;

            if (duration.equalsIgnoreCase("1 Month")) {

                monthsToAdd = 1;

            } else if (duration.equalsIgnoreCase("3 Months")) {

                monthsToAdd = 3;

            } else if (duration.equalsIgnoreCase("6 Months")) {

                monthsToAdd = 6;

            } else if (duration.equalsIgnoreCase("1 Year")) {

                yearsToAdd = 1;

            } else if (duration.equalsIgnoreCase("5 Years")) {

                yearsToAdd = 5;

            } else {

                throw new ServletException(
                        "Invalid plan duration: [" + duration + "]"
                );

            }


            // =========================================================
            // 3. CURRENT DATE
            // =========================================================

            LocalDate today = LocalDate.now();

            LocalDate joinDate;

            LocalDate expiryDate;


            // =========================================================
            // 4. CHECK WHETHER MEMBER ALREADY EXISTS
            // =========================================================

            String checkSql =
                    "SELECT id, join_date, expiry_date " +
                    "FROM members " +
                    "WHERE user_id=?";

            ps = con.prepareStatement(checkSql);

            ps.setInt(1, userId);

            rs = ps.executeQuery();

            int memberId = 0;


            // =========================================================
            // 5. EXISTING MEMBERSHIP
            // =========================================================

            if (rs.next()) {

                memberId = rs.getInt("id");

                Date oldJoinDate = rs.getDate("join_date");

                Date oldExpiryDate = rs.getDate("expiry_date");


                LocalDate oldExpiry = null;

                if (oldExpiryDate != null) {

                    oldExpiry = oldExpiryDate.toLocalDate();

                }


                /*
                 * CASE 1:
                 * Existing membership is still active.
                 *
                 * Example:
                 *
                 * Old expiry = 24-10-2026
                 * Buy 3 Months
                 *
                 * New expiry =
                 * 24-10-2026 + 3 Months
                 * = 24-01-2027
                 */

                if (oldExpiry != null && oldExpiry.isAfter(today)) {

                    joinDate = oldJoinDate.toLocalDate();

                    expiryDate = oldExpiry;

                }

                /*
                 * CASE 2:
                 * Existing membership has expired.
                 *
                 * Example:
                 *
                 * Old expiry = 20-09-2026
                 * Today      = 24-09-2026
                 * Buy 3 Months
                 *
                 * New expiry =
                 * 24-09-2026 + 3 Months
                 * = 24-12-2026
                 */

                else {

                    joinDate = today;

                    expiryDate = today;

                }


                // =====================================================
                // 6. ADD NEW PLAN DURATION TO EXPIRY DATE
                // =====================================================

                if (monthsToAdd > 0) {

                    expiryDate =
                            expiryDate.plusMonths(monthsToAdd);

                }

                if (yearsToAdd > 0) {

                    expiryDate =
                            expiryDate.plusYears(yearsToAdd);

                }


                rs.close();
                ps.close();


                // =====================================================
                // 7. UPDATE EXISTING MEMBERSHIP
                // =====================================================

                String updateSql =
                        "UPDATE members " +
                        "SET plan_id=?, join_date=?, expiry_date=?, status=? " +
                        "WHERE id=?";

                ps = con.prepareStatement(updateSql);

                ps.setInt(1, planId);

                ps.setDate(2, Date.valueOf(joinDate));

                ps.setDate(3, Date.valueOf(expiryDate));

                ps.setString(4, "ACTIVE");

                ps.setInt(5, memberId);

                ps.executeUpdate();

                ps.close();

            }


            // =========================================================
            // 8. NEW MEMBERSHIP
            // =========================================================

            else {

                joinDate = today;

                expiryDate = today;


                // Calculate first membership expiry

                if (monthsToAdd > 0) {

                    expiryDate =
                            expiryDate.plusMonths(monthsToAdd);

                }

                if (yearsToAdd > 0) {

                    expiryDate =
                            expiryDate.plusYears(yearsToAdd);

                }


                // =====================================================
                // INSERT NEW MEMBER
                // =====================================================

                String insertSql =
                        "INSERT INTO members " +
                        "(user_id, plan_id, join_date, expiry_date, status) " +
                        "VALUES (?, ?, ?, ?, ?)";

                ps = con.prepareStatement(
                        insertSql,
                        PreparedStatement.RETURN_GENERATED_KEYS
                );

                ps.setInt(1, userId);

                ps.setInt(2, planId);

                ps.setDate(3, Date.valueOf(joinDate));

                ps.setDate(4, Date.valueOf(expiryDate));

                ps.setString(5, "ACTIVE");

                ps.executeUpdate();


                // Get generated member ID

                ResultSet key = ps.getGeneratedKeys();

                if (key.next()) {

                    memberId = key.getInt(1);

                }

                key.close();

                ps.close();

            }


            // =========================================================
            // 9. INSERT PAYMENT RECORD
            // =========================================================

            String paymentSql =
                    "INSERT INTO payments " +
                    "(member_id, amount, payment_type, payment_status, " +
                    "transaction_id, payment_date) " +
                    "VALUES (?, ?, ?, ?, ?, NOW())";

            ps = con.prepareStatement(paymentSql);

            ps.setInt(1, memberId);

            ps.setDouble(2, amount);

            ps.setString(3, paymentType);

            ps.setString(4, "SUCCESS");

            ps.setString(5, transactionId);

            ps.executeUpdate();

            ps.close();


            // =========================================================
            // 10. INSERT RECENT ACTIVITY
            // =========================================================

            String activitySql =
                    "INSERT INTO recent_activity(user_id, action) " +
                    "VALUES (?, ?)";

            ps = con.prepareStatement(activitySql);

            ps.setInt(1, userId);

            ps.setString(
                    2,
                    "Purchased " + duration + " Membership"
            );

            ps.executeUpdate();

            ps.close();


            // =========================================================
            // 11. REDIRECT TO USER DASHBOARD
            // =========================================================

            response.sendRedirect(
                    request.getContextPath() + "/UserDashboard"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath() + "/PlansServlet"
            );


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