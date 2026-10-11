package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/AddTrainer")
public class AddTrainer extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String specialization = request.getParameter("specialization");
        int experience = Integer.parseInt(request.getParameter("experience"));
        String status = request.getParameter("status");

        TrainerDAO.addTrainer(name, mobile, email, specialization, experience, status);

        response.sendRedirect("trainer.jsp");
    }
}


