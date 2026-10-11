package com.example;

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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // ⚠️ Demo validation (replace with DB check later)
        if ("Rushi".equals(username) && "1607".equals(password)) {

            // Store session
            HttpSession session = request.getSession();
            session.setAttribute("adminName", username);

            // 🔥 Insert login log into DB
            try (Connection con = DBConnection.getConnection()) {

                String sql = "INSERT INTO admin_login_logs (username) VALUES (?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect("AdminDashboard.jsp");

        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
