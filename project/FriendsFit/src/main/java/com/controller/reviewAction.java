package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.dbDAO;
import com.model.reviewDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import file.model.fileDAO;
import ocr.model.KeyDAO;
import ocr.model.gpt3DAO;
import ocr.model.ocrDAO;

/**
 * Servlet implementation class reviewAction
 */
@WebServlet("/reviewAction")
public class reviewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String directory = this.getServletContext().getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
	
		MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		String reviewTitle= multipartRequest.getParameter("reviewTitle");
		String reviewContent = multipartRequest.getParameter("reviewContent");
		String reviewGrade = multipartRequest.getParameter("reviewGrade");
		String facilityNum = multipartRequest.getParameter("facilityNum");
		int facilityNumInt = Integer.parseInt(facilityNum);
		
		int reviewGradeInt = 0; // default value
		if (reviewGrade != null && !reviewGrade.isEmpty()) {
		    reviewGradeInt = Integer.parseInt(reviewGrade);
		}
		
		System.out.println(reviewTitle);
		System.out.println(reviewContent);
		System.out.println(reviewGrade);
		
		reviewDTO reviewdto = new reviewDTO();
		reviewdto.setReviewTitle(reviewTitle);
		reviewdto.setReviewContent(reviewContent);
		reviewdto.setReviewGrade(reviewGradeInt);
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String memberId = info.getMember_id();
		reviewdto.setMemberID(memberId);
		reviewdto.setFacilityNum(facilityNumInt);
		
		
		
		// String directory = application.getRealPath("/upload/");
		
		
		Enumeration fileNames = multipartRequest.getFileNames();
		while(fileNames.hasMoreElements()) {
		
			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);
			
			if(fileName == null) continue;
			// 보안코딩 적용
			// 해당 확장자가 아니면 파일 지워버림
			// 레이스 컨디션에는 좀 취약함 - 하드 코딩으로 안쪽 폴더가 아닌 아예 다른 경로를 업로드 경로로 지정하면 좀 보안에 ㄱㅊ
			if(!fileName.endsWith(".png") && !fileName.endsWith(".jpg")) {
				File file = new File(directory + fileRealName);
				file.delete();
			} else {
				
				dbDAO dbdao = new dbDAO();
				int fileNum = 0;
				fileNum = dbdao.fileUpload(fileName, fileRealName);
				dbdao.reviewUpload(reviewdto, fileNum);
				
				KeyDAO keyDAO = new KeyDAO("C://keys/keys.json");
				// TODO Auto-generated method stub
				String API_KEY = keyDAO.getKeyValue("gptPrivateKey");
				String invokeUrl = keyDAO.getKeyValue("clovaOCRInvokeURL"); 
		        String secretKey = keyDAO.getKeyValue("clovaOCRPrivateKey");
		        
		        
		        String format = "png";
		        String uploadDirectory = this.getServletContext().getRealPath("/upload/");
		        String url = uploadDirectory + fileRealName ;
				ocrDAO ocrdao = new ocrDAO(invokeUrl, secretKey, format, url);
				
				String prompt; 
				System.out.println("in reviewAction..");
				try {
					prompt = ocrdao.callOcrApi();
					System.out.println(prompt);
					prompt += "'주소 : ?"
							+ "총금액 : ?"
							+ "상호명 : ?'"
							+ "물음표에 각각 값을 넣어 줘"
							+ "그 외 다른 어떤 말도 덧붙이지마.";
			        gpt3DAO gptdao = new gpt3DAO(API_KEY, prompt);
			        System.out.println(gptdao.getAiResponse());
			        
			        ArrayList<String> parsedValues = ocrdao.parseInformation(gptdao.getAiResponse());
			        int reviewNum = ocrdao.getLastReviewNum();
			        ocrdao.OCRUpload(parsedValues.get(0), parsedValues.get(1), parsedValues.get(2), reviewNum);
			        
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
		}
		
		
		response.sendRedirect("review.jsp");
		
		
		
		
		
		
		
	}

}
