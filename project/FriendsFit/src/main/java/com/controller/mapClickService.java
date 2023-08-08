package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dbDAO;
import com.model.facilityClickDTO;

/**
 * Servlet implementation class mapClickService
 */
@WebServlet("/mapClickService")
public class mapClickService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String data = request.getParameter("data");
		/*
		 * 받아 온 X,Y 좌표를 통해 시설 정보 SELECT
		 */
		System.out.println(data);
		
		Coordinate coord = extractCoordinate(data);
		/*
		 * TODO 시설의 SELECT 정보를 전부 받는 알고리즘을 구현해야함
		 * 		현재 일단 넣을 것: 시설 사진,
		 * 					   시설 번호,
		 * 					   시설 이름,
		 * 					   시설 구분,
		 * 					   영업 시간,
		 * 					   전화번호,
		 * 					   주소,
		 * 					   리뷰,
		 * 					   등록일자
		 * 		일단 리뷰 빼고 먼저 구현 후, 리뷰 추후 구현.
		 */
		
		System.out.println(coord.x );
		System.out.println(coord.y );
		dbDAO dbdao = new dbDAO();
		facilityClickDTO fcdto = new facilityClickDTO();
		fcdto = dbdao.getFacility(coord.x, coord.y);
		response.sendRedirect("map.jsp?x="+coord.x+"&y="+coord.y);
		 
	}
	
    public static Coordinate extractCoordinate(String input) {
        input = input.trim().substring(1, input.length() - 1); // Remove parentheses
        String[] parts = input.split(",");
        double y = Double.parseDouble(parts[0].trim());
        double x = Double.parseDouble(parts[1].trim());
        return new Coordinate(x, y);
    }

    static class Coordinate {
        public double x;
        public double y;

        public Coordinate(double x, double y) {
            this.x = x;
            this.y = y;
        }
    }
    

}
