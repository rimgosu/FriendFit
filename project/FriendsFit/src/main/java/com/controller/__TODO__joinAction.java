package com.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/joinAction")
public class joinAction extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("EUC-KR");
      
      String id = request.getParameter("member_id");
      String pw = request.getParameter("passwd");
      String name = request.getParameter("name_id");
      String addr = request.getParameter("form1");
      int age = Integer.parseInt(request.getParameter("age"));      
      String[] phone = request.getParameterValues("mobile[]");
      String year = request.getParameter("career");
      int point = 0;
      String day = "yyyy-MM-dd";
      
      MemberDAO dao = new MemberDAO();
      response.sendRedirect("index.jsp");
   }

}