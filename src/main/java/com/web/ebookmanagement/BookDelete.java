package com.web.ebookmanagement;

import ConnectDB.ConnectDB;
import Dao.Dao;

import Model.Book;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/delete_book")
public class BookDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        	int id = Integer.parseInt(req.getParameter("id"));
           Dao dao = new Dao(ConnectDB.getConnection());
           boolean isDeleteBook = dao.deleteBook(id);
           HttpSession session = req.getSession();

               if (isDeleteBook) {
                   session.setAttribute("success", "Delete Book Success");
                   resp.sendRedirect("admin/show_book.jsp");
               } else {
                   session.setAttribute("fail", "Delete Book Wrong");
                   resp.sendRedirect("admin/edit_book.jsp");
               }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
