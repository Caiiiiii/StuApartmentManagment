package com.Login;import java.io.IOException;import java.io.PrintWriter;import javax.servlet.ServletException;import javax.servlet.http.HttpServlet;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;import MySql.DbControl;public class LoginVerification extends HttpServlet {	/**		 * Destruction of the servlet. <br>		 */	public void destroy() {		super.destroy(); // Just puts "destroy" string in log		// Put your code here	}	/**		 * The doGet method of the servlet. <br>		 *		 * This method is called when a form has its tag value method equals to get.		 * 		 * @param request the request send by the client to the server		 * @param response the response send by the server to the client		 * @throws ServletException if an error occurred		 * @throws IOException if an error occurred		 */	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		doPost(request,response);	}	/**		 * The doPost method of the servlet. <br>		 *		 * This method is called when a form has its tag value method equals to post.		 * 		 * @param request the request send by the client to the server		 * @param response the response send by the server to the client		 * @throws ServletException if an error occurred		 * @throws IOException if an error occurred		 */	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		request.setCharacterEncoding("utf-8");          response.setContentType("text/html; charset=utf-8");          PrintWriter out = response.getWriter();         		String mUserName = request.getParameter("managerUserName");		String mPassWord = request.getParameter("managerPassWord");				if(mUserName==null||mPassWord==null){			return ;		}		 // System.out.print( mUserName+","+mPassWord);		DbControl db = new DbControl();		if(db.Login(mUserName,mPassWord)){				if(db.Identity(mUserName)==1){						out.print(3);					           response.sendRedirect("managerMain.jsp"); //此处写跳转链接											}else{								out.print(2);             // 2为账号没有权限							}				}			else{					out.print(1);				}							}	/**		 * Initialization of the servlet. <br>		 *		 * @throws ServletException if an error occurs		 */	public void init() throws ServletException {		// Put your code here	}}