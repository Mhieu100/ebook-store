package com.web.ebookmanagement;

import java.io.IOException;

import ConnectDB.ConnectDB;
import Dao.Dao;
import Model.Book;
import Model.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartAdd extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				int book_id = Integer.parseInt(req.getParameter("book_id"));
				int user_id = Integer.parseInt(req.getParameter("user_id"));
		        
				Dao dao = new Dao(ConnectDB.getConnection());
				Book book = dao.getBookId(book_id);
				
				Cart cart = new Cart();
				cart.setBook_id(book_id);
				cart.setBook_name(book.getName());
				cart.setAuth(book.getAuth());
				cart.setPrice(book.getPrice());
				cart.setUser_id(user_id);
				cart.setTotal_price(book.getPrice());
				cart.setImage(book.getImage());
				boolean isAddCart = dao.addCart(cart);
				HttpSession session = req.getSession();
				if (isAddCart) {
                    session.setAttribute("success", "Add Cart Success");
                    resp.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("fail", "Add Cart Wrong");
                    resp.sendRedirect("index.jsp");
                }
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}
