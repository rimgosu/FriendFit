package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/joinAction")
public class joinAction extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("EUC-KR");
      
    
      
      String member_id = request.getParameter("member_id");
      String passwd = request.getParameter("passwd");
      String name = request.getParameter("name");
      int age = Integer.parseInt(request.getParameter("age"));
      String mobile1 = request.getParameter("mobile1");
      String mobile2 = request.getParameter("mobile2");
      String mobile3 = request.getParameter("mobile3");
      String member_tel=mobile1+"-"+mobile2+"-"+mobile3;
      
      String year = request.getParameter("year");
      String addr1 = request.getParameter("addr1");
      String addr2 = request.getParameter("addr2");
      String addr3 = request.getParameter("addr3");
      String member_addr=addr1;
      
      //int point = 0;
      //String day = "yyyy-MM-dd";
      
      System.out.println(member_id);
      System.out.println(passwd);
      System.out.println(name);
      System.out.println(age);
      System.out.println(member_tel);
      System.out.println(year);
      System.out.println(member_addr);
      //System.out.println(0);
      //System.out.println(day);
      
     MemberDAO dao = new MemberDAO();
     dao.join(new MemberDTO(member_id, passwd, name, age, member_tel, year, member_addr));

      
      
      response.sendRedirect("index.jsp");
   }

}