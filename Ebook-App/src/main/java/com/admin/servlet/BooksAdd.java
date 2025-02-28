package com.admin.servlet;

import java.io.File;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.dao.BookDaoImpl;
import com.db.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("bstatus");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			BookDtls b = new BookDtls(bookName, author, price, categories, status, fileName, "admin");
			
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
			
			boolean f = dao.addBooks(b);
			HttpSession session = req.getSession();
			
			if(f) {
				
				String path = getServletContext().getRealPath("") + "img";
				File file = new File(path);
				part.write(path + File.separator + fileName);
				
				session.setAttribute("succMsg", "Book Add Successfully");
				resp.sendRedirect("admin/add_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Somthing wrong on server");
				resp.sendRedirect("admin/add_books.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
