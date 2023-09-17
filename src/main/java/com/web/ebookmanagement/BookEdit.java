package com.web.ebookmanagement;

import ConnectDB.ConnectDB;
import Dao.Dao;

import Model.Book;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/edit_book")
public class BookEdit extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        	int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String auth = req.getParameter("auth");
            String description = req.getParameter("description");
            String price = req.getParameter("price");
            String category = req.getParameter("category");
            String status = req.getParameter("status");
          
            Book book = new Book();
            book.setId(id);
            book.setName(name);
            book.setAuth(auth);
            book.setDescription(description);
            book.setPrice(price);
            book.setCategory(category);
            book.setStatus(status);

            HttpSession session = req.getSession();

            if (name == "" || auth == "") {
                session.setAttribute("empted", "Fill out the form here");
                resp.sendRedirect("admin/edit_book.jsp");
                System.out.println("Fill out the form here");
            } else {
                Dao dao = new Dao(ConnectDB.getConnection());
                boolean isEditBook = dao.editBook(book);
                if (isEditBook) {
                    session.setAttribute("success", "Update Book Success");
                    resp.sendRedirect("admin/show_book.jsp");
                } else {
                    session.setAttribute("fail", "Update Book Wrong");
                    resp.sendRedirect("admin/edit_book.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
