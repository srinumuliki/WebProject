package com.user.servlet;

import java.io.IOException;

import com.dao.BookDaoImpl;
import com.dao.CartDaoImpl;
import com.db.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {	
	
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
			BookDtls b = dao.getBookId(bid);
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDaoImpl dao1 = new CartDaoImpl(DBConnect.getConn());
			boolean f = dao1.addCart(c);
			
			HttpSession session = req.getSession();
			if(f){
				session.setAttribute("addCart", "Book Added to cart");
				resp.sendRedirect("all_new_books.jsp");
			} else {
				session.setAttribute("failed", "Something wrong on server");
				resp.sendRedirect("all_new_books.jsp");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
