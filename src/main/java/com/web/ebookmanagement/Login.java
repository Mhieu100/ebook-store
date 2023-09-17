package com.web.ebookmanagement;

import ConnectDB.ConnectDB;
import Dao.Dao;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();
            Dao dao = new Dao(ConnectDB.getConnection());
       
           User user = dao.loginUser(email, password);
           if(user.getRole() == 1) {
               session.setAttribute("userObj", user);
               resp.sendRedirect("admin/index.jsp");
           
           } else if(user.getRole() == 0) {
               session.setAttribute("userObj", user);
               resp.sendRedirect("index.jsp");
           
           } else {
               session.setAttribute("fail", "Email or Password is valid");
               resp.sendRedirect("login.jsp");
           }
     
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
