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


@WebServlet("/register")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(password);
            HttpSession session = req.getSession();
            if (name == "" || email == "" || phone == "" || password == "") {

                session.setAttribute("empted", "Fill out the form here");
                resp.sendRedirect("register.jsp");
            } else {

            Dao dao = new Dao(ConnectDB.getConnection());
            boolean isRegister = dao.registerUser(user);


                 if (isRegister) {

                    session.setAttribute("success", "Register Success");
                    resp.sendRedirect("login.jsp");
                } else {

                    session.setAttribute("fail", "Register Wrong");
                    resp.sendRedirect("register.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
