package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dbDAO;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/searchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        // DB 연결 및 검색 로직 (예: JDBC 사용)
        // 결과를 response에 작성
        dbDAO dbdao = new dbDAO();
        ArrayList<String> lst = new ArrayList<String>();
        lst = dbdao.facilitySearch(query);
        

        // 예제 코드:
        String result = ""; // 이 부분에 DB 검색 결과를 추가
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().write(lst.toString());
    }
}