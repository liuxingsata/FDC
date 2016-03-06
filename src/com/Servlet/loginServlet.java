package com.Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaBean.codeExchange;
import com.javaBean.newOperation;

/**
 * 登录验证
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		codeExchange ce = new codeExchange();
		String user_name = ce.ChineseCoding(request.getParameter("username"));
		
		String pass_word = request.getParameter("password");
		System.out.println(user_name+"--"+pass_word);
		if (user_name != null && !user_name.equals("")) {
			newOperation nop = new newOperation();
			HttpSession session = request.getSession();
			
			String sql = "select * from USERS where USER_NAME='" + user_name + "'";
			sql += "and PASSWORD='" + pass_word + "'";
			ResultSet rs = nop.select(sql);
			try {
				if (rs.next()) {

					session.setAttribute("login", "ok");
					session.setAttribute("admin", "false");
					session.setAttribute("uname", user_name);
					response.sendRedirect("index_home.jsp");
					
				} else {
					response.sendRedirect("denglushibai.jsp");
				}rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			nop.close();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
