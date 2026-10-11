package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/AddPlan")
public class AddPlan extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String duration = request.getParameter("duration");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");

        PlanDAO.addPlan(name, duration, price, description);

        response.sendRedirect("Plans.jsp");
    }
}

