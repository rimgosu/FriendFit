package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.columnDTO;
import com.model.communityDTO;
import com.model.dbDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class columnAction
 */
@WebServlet("/columnAction")
public class columnAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String directory = this.getServletContext().getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";

		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
		String columnTitle = multipartRequest.getParameter("columnTitle");
		String columnWriter = multipartRequest.getParameter("columnWriter");
		String columnContent = multipartRequest.getParameter("columnContent");

		columnDTO cldto = new columnDTO();
		cldto.setColumnTitle(columnTitle);
		cldto.setColumnContent(columnContent);
		cldto.setColumnWriter(columnWriter);

		Enumeration fileNames = multipartRequest.getFileNames();
		while (fileNames.hasMoreElements()) {

			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);

			if (fileName == null)
				continue;
			// 보안코딩 적용
			// 해당 확장자가 아니면 파일 지워버림
			// 레이스 컨디션에는 좀 취약함 - 하드 코딩으로 안쪽 폴더가 아닌 아예 다른 경로를 업로드 경로로 지정하면 좀 보안에 ㄱㅊ
			if (!fileName.endsWith(".png") && !fileName.endsWith(".jpg")) {
				File file = new File(directory + fileRealName);
				file.delete();
			} else {

				dbDAO dbdao = new dbDAO();
				int fileNum = 0;
				fileNum = dbdao.fileUpload(fileName, fileRealName);
				cldto.setFileNum(fileNum);

				dbdao.columnUpload(cldto);

			}

		}

		response.sendRedirect("column.jsp");

	}

}
