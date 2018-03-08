package com.Login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MySql.DbControl;

/**
 * Servlet implementation class LoginVerification1
 */
@WebServlet("/LoginVerification1")
public class LoginVerification1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginVerification1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String supportUserName = request.getParameter("supportUserName");
		String supportPassWord = request.getParameter(" supportPassWord");
		
		DbControl db = new DbControl();
		if(db.Login( supportUserName, supportPassWord)){
				if(db.Identity( supportUserName)==2){
					//此处写跳转链接
				}else{
					System.out.print("你没有该权限");
				}
		}else{
			System.out.print("密码错误");
		}
	}

}
