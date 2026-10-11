package com.users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.example.DBConnection;
import com.model.Plan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlansServlet")
public class PlansServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {

            response.sendRedirect("user.jsp");
            return;
        }

        ArrayList<Plan> plans = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            String sql = "SELECT * FROM plans ORDER BY price";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {

                Plan plan = new Plan();

                plan.setId(rs.getInt("id"));
                plan.setName(rs.getString("name"));
                plan.setDuration(rs.getString("duration"));
                plan.setPrice(rs.getDouble("price"));
                plan.setDescription(rs.getString("description"));

                plans.add(plan);

            }

            // Send data to JSP

            request.setAttribute("plans", plans);

            request.getRequestDispatcher("User/Plans.jsp")
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