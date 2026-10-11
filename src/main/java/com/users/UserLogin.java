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

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();

                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("userName", rs.getString("name"));
                session.setAttribute("userEmail", rs.getString("email"));

                response.sendRedirect("UserDashboard");
                
            } else {

                response.sendRedirect("user.jsp?error=1");

            }

        } catch (Exception e) {

            e.printStackTrace();
            response.sendRedirect("user.jsp?error=db");

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