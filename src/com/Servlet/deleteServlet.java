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

import com.javaBean.newOperation;

/**
 * 删除行为
 */
@WebServlet(urlPatterns={"/admin/deleteServlet","/deleteServlet"})
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		newOperation nop=new newOperation();
		HttpSession session=request.getSession();
		String isadmin=(String)session.getAttribute("admin");
		String tablename=request.getParameter("tablename");
		String id=request.getParameter("id");
		if(tablename=="messageboard"){
			String sql="delete from "+tablename+" where message_id="+id;
			System.out.println(sql);
			nop.update(sql);
			if(isadmin=="true"){
			response.sendRedirect("bbsm.jsp");}
			else{response.sendRedirect("bbsinfo.jsp");}
		}else if(tablename=="house"){
			String sql1="delete from "+tablename+" where house_id="+id;
			String sql="select house_all from "+tablename+" where house_id="+id;
			ResultSet rs=nop.select(sql);
			String all = null;
			try {
				all = rs.getString(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql2="delete from oldhouse where house_all='"+all+"'";
			String sql3="delete from renthouse where house_all='"+all+"'";
			System.out.println(sql1);
			nop.update(sql1);
			nop.update(sql2);
			nop.update(sql3);
			if(isadmin=="true"){
				response.sendRedirect("housem.jsp");}
				else{response.sendRedirect("houseinfo.jsp");}
			
		}else{
			String sql="delete from "+tablename+" where user_id="+id;
			System.out.println(sql);
			nop.update(sql);
			if(isadmin=="true"){
				response.sendRedirect("userm.jsp");}
				else{response.sendRedirect("personinfo.jsp");}
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
