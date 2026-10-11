package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/Register")
public class Register extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(name==null || email==null || password==null ||
                name.isBlank() || email.isBlank() || password.isBlank()){

            response.sendRedirect("register.jsp?error=empty");
            return;
        }

        Connection con=null;
        PreparedStatement psUser=null;
        PreparedStatement psActivity=null;
        ResultSet rs=null;

        try{

            Class.forName("com.mysql.cj.jdbc.Driver");

            con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/gym_management",
                    "root",
                    "123456");

            String sql="INSERT INTO users(name,email,password) VALUES(?,?,?)";

            psUser=con.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);

            psUser.setString(1,name);
            psUser.setString(2,email);
            psUser.setString(3,password);

            int rows=psUser.executeUpdate();

            if(rows>0){

                rs=psUser.getGeneratedKeys();

                int userId=0;

                if(rs.next()){
                    userId=rs.getInt(1);
                }

                String activitySql=
                        "INSERT INTO recent_activity(user_id,action) VALUES(?,?)";

                psActivity=con.prepareStatement(activitySql);

                psActivity.setInt(1,userId);
                psActivity.setString(2,"User Registered");

                psActivity.executeUpdate();

                HttpSession session=request.getSession();

                session.setAttribute("userId",userId);
                session.setAttribute("userName",name);
                session.setAttribute("userEmail",email);

                response.sendRedirect("UserDashboard");
            }

        }
        catch(Exception e){

            e.printStackTrace();
            response.sendRedirect("register.jsp?error=db");

        }
        finally{

            try{ if(rs!=null) rs.close(); }catch(Exception e){}
            try{ if(psActivity!=null) psActivity.close(); }catch(Exception e){}
            try{ if(psUser!=null) psUser.close(); }catch(Exception e){}
            try{ if(con!=null) con.close(); }catch(Exception e){}

        }
    }
}