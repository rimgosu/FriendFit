package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		
		// System.out.println(id + "/" + pw);
		
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(id, pw);
		
		if(info != null) {
		    HttpSession session = request.getSession();
		    session.setAttribute("info", info);
		    session.setMaxInactiveInterval(3600); // 30분 (30 * 60초)
		}

		
		response.sendRedirect("index.jsp");
		
		
	}

}
