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

@WebServlet("/BuyPlanServlet")
public class BuyPlanServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("userId") == null){

            response.sendRedirect("user.jsp");
            return;

        }

        int planId = Integer.parseInt(request.getParameter("planId"));

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String planName = "";
        String duration = "";
        double price = 0;
        String description = "";

        try{

            con = DBConnection.getConnection();

            String sql = "SELECT * FROM plans WHERE id=?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, planId);

            rs = ps.executeQuery();
            if(rs.next()){

                planName = rs.getString("name");
                duration = rs.getString("duration");
                price = rs.getDouble("price");
                description = rs.getString("description");

            }

            request.setAttribute("planId", planId);
            request.setAttribute("planName", planName);
            request.setAttribute("duration", duration);
            request.setAttribute("price", price);
            request.setAttribute("description", description);

            request.getRequestDispatcher("User/Payment.jsp")
                    .forward(request, response);

        }catch(Exception e){

            e.printStackTrace();

        }finally{

            try{
                if(rs!=null)
                    rs.close();
            }catch(Exception e){}

            try{
                if(ps!=null)
                    ps.close();
            }catch(Exception e){}

            try{
                if(con!=null)
                    con.close();
            }catch(Exception e){}

        }

    }

}