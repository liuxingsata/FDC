package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.javaBean.IPTimeStamp;
import com.javaBean.houseBean;
import com.javaBean.newOperation;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

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
		 SmartUpload su = new SmartUpload();
	      newOperation nop=new newOperation();
	      HttpSession session=request.getSession();
	      houseBean ub=new houseBean();
	      request.setCharacterEncoding("utf-8");
	      
	      
		 
		  String filename = null;
	      request.setCharacterEncoding("utf-8");

	      
	      JspFactory _jspxFactory = null;
		  PageContext pageContext = null;
		  _jspxFactory = JspFactory.getDefaultFactory();
		  pageContext = _jspxFactory.getPageContext(this,request,response,"",true,8192,true);
			// 上传初始化
		  su.initialize(pageContext);
		  su.setAllowedFilesList("doc,txt,java,jpg,png,bmp");
		  try {
				su.upload();
				
				
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String ip = request.getHeader("x-forwarded-for");      

	        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     

	            ip = request.getHeader("Proxy-Client-IP");      

	        }     

	        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     

	            ip = request.getHeader("WL-Proxy-Client-IP");     

	        }     

	        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     

	            ip = request.getRemoteAddr();      

	        }   
	        	
			 IPTimeStamp its = new IPTimeStamp(ip) ;
			
			File file = su.getFiles().getFile(0);
				
			String ext = file.getFileExt() ;    // 扩展名称
		    filename = its.getIPTimeRand() + "." + ext ;
		    try {
					// 将文件另存
						file.saveAs("F:\\java_workspace\\FDCsystem3.0\\WebContent\\assets\\upload\\" + filename);
					} catch (SmartUploadException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		      ub.setHousetype(su.getRequest().getParameter("housetype"));// 利用Request对象获取参数之值
		      ub.setHousearea(su.getRequest().getParameter("housearea"));
		      ub.setHousefloor(su.getRequest().getParameter("housefloor"));
		      ub.setHouseadd(su.getRequest().getParameter("houseadd"));
		      ub.setHouseowner(su.getRequest().getParameter("houseowner"));
		  String id=su.getRequest().getParameter("id");
	      String hp="assets/upload/"+filename;
	      ub.setHousephoto(hp);
	      String houseall=ub.getHousetype()+ub.getHousearea()+ub.getHousefloor()+ub.getHouseadd()+ub.getHouseowner();
	      ub.setHouseall(houseall);
	      String sql="update house t set t.house_type='"+ub.getHousetype()+"',t.house_area='"+ub.getHousearea()+"',t.house_floor='"+ub.getHousefloor()+"',t.house_add='"+ub.getHouseadd()+"',t.house_owner='"+ub.getHouseowner()+"',t.house_p='"+ub.getHousephoto()+"',t.house_all='"+ub.getHouseall()+"' where user_id='"+id+"'";
	      System.out.println(sql);
	      nop.update(sql);
	      if(session.getAttribute("admin").equals("true")){
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
