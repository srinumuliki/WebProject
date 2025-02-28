package com.user.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import com.dao.UserDaoImpl;
import com.db.DBConnect;
import com.entity.User;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			// String confirmPassword = req.getParameter("cpassword");
			String check = req.getParameter("check");
			// System.out.println(name+" "+email+" "+phno+" "+password+" "+confirmPassword+"
			// "+check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password); // us.setPassword(confirmPassword);

			HttpSession session = req.getSession();

			if (check != null) {

				UserDaoImpl dao = new UserDaoImpl(DBConnect.getConn());
				boolean f1 = dao.checkUser(email);
				if(f1) {
					
					boolean f2 = dao.userRegister(us);
					if (f2) {
						// System.out.println("User Regiser Success....");
						session.setAttribute("succMsg", "Registration Successfully....");
						resp.sendRedirect("register.jsp");
					} else {
						// System.out.println("Somthing on server...");
						session.setAttribute("failedMsg", "Somthing on server...");
						resp.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failedMsg", "User Already Exit & Try Another Email");
					resp.sendRedirect("register.jsp");
				}
			} else {
				// System.out.println("Please check agree terms & conditions");
				session.setAttribute("failedMsg", "Please check agree terms & conditions");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
