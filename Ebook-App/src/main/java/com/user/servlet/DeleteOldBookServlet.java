package com.user.servlet;

import java.io.IOException;

import com.dao.BookDaoImpl;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_old_book")
public class DeleteOldBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String em = req.getParameter("em");
			int id = Integer.parseInt(req.getParameter("id"));
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
			boolean f = dao.oldBookDelete(em, "Old", id);
			
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Old Book Delete Successfully");
				resp.sendRedirect("old_book.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("old_book.jsp");
			}

		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
