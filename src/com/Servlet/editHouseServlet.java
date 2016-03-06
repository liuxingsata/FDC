package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaBean.houseBean;
import com.javaBean.newOperation;

/**
 * 编辑房产信息
 */
@WebServlet(urlPatterns={"/admin/editHouseServlet","/editHouseServlet"})
public class editHouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editHouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	      newOperation nop=new newOperation();
	      HttpSession session=request.getSession();
	      houseBean ub=new houseBean();
	      request.setCharacterEncoding("utf-8");
	      String id=request.getParameter("id");
	      ub.setHousetype(request.getParameter("housetype"));
	      ub.setHousearea(request.getParameter("housearea"));
	      ub.setHousefloor(request.getParameter("housefloor"));
	      ub.setHouseadd(request.getParameter("houseadd"));
	      ub.setHouseowner(request.getParameter("houseowner"));
	      ub.setHousephoto(request.getParameter("housephoto"));
	      String houseall=ub.getHousetype()+ub.getHousearea()+ub.getHousefloor()+ub.getHouseadd()+ub.getHouseowner();
	      ub.setHouseall(houseall);
	      String sql="update house t set t.house_type='"+ub.getHousetype()+"',t.house_area='"+ub.getHousearea()+"',t.house_floor='"+ub.getHousefloor()+"',t.house_add='"+ub.getHouseadd()+"',t.house_owner='"+ub.getHouseowner()+"',t.house_p='"+ub.getHousephoto()+"',t.house_all='"+ub.getHouseall()+"' where user_id='"+id+"'";
	      System.out.println(sql);
	      nop.update(sql);
	      if(session.getAttribute("admin")=="true"){
	  		response.sendRedirect("housem.jsp");}
	  		else{
	  			response.sendRedirect("houseinfo.jsp");
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
