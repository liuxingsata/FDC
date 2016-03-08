package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.javaBean.IPTimeStamp;
import com.jspsmart.upload.*;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
		// TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//@SuppressWarnings("unused")
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<html>");out.println("<body>");
		out.println("000000000000000000000000000000000000000");
		
		// 新建一个SmartUpload对象
		SmartUpload su = new SmartUpload();
		
		JspFactory _jspxFactory = null;
	    PageContext pageContext = null;
	    _jspxFactory = JspFactory.getDefaultFactory();
	    pageContext = _jspxFactory.getPageContext(this,request,response,"",true,8192,true);
		// 上传初始化
		su.initialize(pageContext);
		// 设定上传限制
		// 1.限制每个上传文件的最大长度。
		//su.setMaxFileSize(10000);
		// 2.限制总上传数据的长度。
		// su.setTotalMaxFileSize(20000);
		// 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
		 su.setAllowedFilesList("doc,txt,java,jpg,png,bmp");
		// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
		// su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
		// 上传文件
		 
		try {
			su.upload();
			out.println("文件上传成功！<br>");
			
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 将上传文件全部保存到指定目录
		// 利用Request对象获取参数之值
		//out.println("TEST="+su.getRequest().getParameter("TEST")+"<BR><BR>");
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
        	out.println(ip);
		 IPTimeStamp its = new IPTimeStamp(ip) ;
		// 逐一提取上传文件信息，同时可保存文件。
			File file = su.getFiles().getFile(0);
			
			String ext = file.getFileExt() ;    // 扩展名称
	        String filename = its.getIPTimeRand() + "." + ext ;
	        
	/*		// 显示当前文件信息
			out.println("<TABLE BORDER=1>");
			out.println("<TR><TD>表单项名（FieldName）</TD><TD>"
			+ file.getFieldName() + "</TD></TR>");
			out.println("<TR><TD>文件长度（Size）</TD><TD>" + 
			file.getSize() + "</TD></TR>");
			out.println("<TR><TD>文件名（FileName）</TD><TD>" 
			+ file.getFileName() + "</TD></TR>");
			out.println("<TR><TD>文件扩展名（FileExt）</TD><TD>" 
			+ file.getFileExt() + "</TD></TR>");
			out.println("<TR><TD>文件全名（FilePathName）</TD><TD>"
			+ file.getFilePathName() + "</TD></TR>");
			out.println("</TABLE><BR>");
*/			try {
			// 将文件另存
				file.saveAs("F:\\java_workspace\\FDCsystem3.0\\WebContent\\assets\\upload\\" + filename);
			// 另存到以WEB应用程序的根目录为文件根目录的目录下
			
				//file.saveAs("/assets/upload/" + file.getFileName(), su.SAVE_VIRTUAL);
				out.println("文件上传成功！222<br>");
				out.println(filename);
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 另存到操作系统的根目录为文件根目录的目录下
			// file.saveAs("c:	emp" + myFile.getFileName(), su.SAVE_PHYSICAL);

		
		out.println("</body>");
		out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
