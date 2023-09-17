package com.web.ebookmanagement;

import ConnectDB.ConnectDB;
import Dao.Dao;

import Model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

@WebServlet("/add_book")
@MultipartConfig
public class BookAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String auth = req.getParameter("auth");
            String description = req.getParameter("description");
            String price = req.getParameter("price");
            String category = req.getParameter("category");
            String status = req.getParameter("status");
            Part part = req.getPart("image");
            String fileName = part.getSubmittedFileName();

            Book book = new Book(name, auth, description, price, category, status, fileName);
            String path = getServletContext().getRealPath("") + "Image";

            File file = new File(path);
            part.write(path + file.separator + fileName);			
            System.out.print(path);
            
            HttpSession session = req.getSession();

            if (name == "" || auth == "" || description == "" || price == "") {
                session.setAttribute("empted", "Fill out the form here");
                resp.sendRedirect("admin/add_book.jsp");
            } else {
                Dao dao = new Dao(ConnectDB.getConnection());
                boolean isAddBook = dao.addBook(book);
                if (isAddBook) {
                    session.setAttribute("success", "Add Book Success");
                    resp.sendRedirect("admin/show_book.jsp");
                } else {
                    session.setAttribute("fail", "Add Book Wrong");
                    resp.sendRedirect("admin/add_book.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
