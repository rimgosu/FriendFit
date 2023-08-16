package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.dbDAO;

/**
 * Servlet implementation class communityLikeService
 */
@WebServlet("/reviewLikeService")
public class reviewLikeService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reviewNum = request.getParameter("reviewNum");
		int intreviewNum = Integer.parseInt(reviewNum);
		HttpSession session = request.getSession(); // 세션 객체 얻기
		MemberDTO info = (MemberDTO) session.getAttribute("info"); // 세션 데이터 받기
		
		if (info.getMember_id() == null) {
			response.sendRedirect("review.jsp");
		} else {
			dbDAO dbdao = new dbDAO();
			dbdao.updateReviewLike(intreviewNum, info.getMember_id());
			response.sendRedirect("review.jsp");
		}
	
	
	}
}