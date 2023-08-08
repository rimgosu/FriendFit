package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dbDAO;
import com.model.reviewCommentDTO;

/**
 * Servlet implementation class reviewCommentAction
 */
@WebServlet("/reviewCommentAction")
public class reviewCommentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String commentContent = request.getParameter("reviewComment");
		String reviewNum = request.getParameter("rNum");
		int reviewNumInt = Integer.parseInt(reviewNum);
		System.out.println(reviewNum + " reviewNum in reviewCommentAction Servlet");
		
		reviewCommentDTO commentdto = new reviewCommentDTO(0, commentContent, "TEST4", reviewNumInt, 0, "REGISTER_DATE");
		
		dbDAO dbdao = new dbDAO();
		dbdao.reviewCommentUpload(commentdto);
		
		response.sendRedirect("reviewView.jsp?reviewNum="+reviewNum);
		
		
		
	}

}
