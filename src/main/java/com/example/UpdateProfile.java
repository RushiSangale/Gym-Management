package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password"); // optional

        HttpSession session = request.getSession();
        String adminUsername = (String) session.getAttribute("userName"); 
        // or admin id if you are storing id in session

        try {
            AdminDAO.updateProfile(adminUsername, name, email, contact, password);
            session.setAttribute("success", "Profile updated successfully!");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Failed to update profile!");
        }

        response.sendRedirect("profile.jsp");
    }
}

