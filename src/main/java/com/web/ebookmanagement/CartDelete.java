package com.web.ebookmanagement;

import java.io.IOException;

import ConnectDB.ConnectDB;
import Dao.Dao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_cart")
public class CartDelete extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			 try {
		        	int book_id = Integer.parseInt(req.getParameter("book_id"));
		           Dao dao = new Dao(ConnectDB.getConnection());
		           boolean isDeleteBookFromCart = dao.deleteBookFromCart(book_id);
		           HttpSession session = req.getSession();

		               if (isDeleteBookFromCart) {
		                   session.setAttribute("success", "Delete Book Success");
		                   resp.sendRedirect("cart.jsp");
		               } else {
		                   session.setAttribute("fail", "Delete Book Wrong");
		                   resp.sendRedirect("cart.jsp");
		               }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		}
}
