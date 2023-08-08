package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.communityCommentDTO;
import com.model.dbDAO;
import com.model.reviewCommentDTO;


@WebServlet("/communityCommentAction")
public class communityCommentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String commentContent = request.getParameter("commuComment");
		String commuNum = request.getParameter("cNum");
		int communNumInt = Integer.parseInt(commuNum);
		/*
		 *  private int commentNum;
			private String commentContent;
			private String memberID;
			private int commuNum;
			private int commentLike;
			private String commentDay;
		 */
		communityCommentDTO commentdto = new communityCommentDTO(0, commentContent, "TEST4", communNumInt, 0, "REGISTER_DATE");
		
		dbDAO dbdao = new dbDAO();
		dbdao.communityCommentUpload(commentdto);
		
		response.sendRedirect("communityView.jsp?commuNum="+commuNum);
	}

}
