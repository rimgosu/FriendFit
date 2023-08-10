package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.communityDTO;
import com.model.dbDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/communityAction")
public class communityAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String directory = this.getServletContext().getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";

		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
		String commuTitle = multipartRequest.getParameter("commuTitle");
		String facilityCategory = multipartRequest.getParameter("facilityCategory");
		String commuContent = multipartRequest.getParameter("commuContent");

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		String memberId = info.getMember_id();

		communityDTO cdto = new communityDTO();
		cdto.setCommuTitle(commuTitle);
		cdto.setCommuContent(commuContent);
		cdto.setMemberID(memberId);
		cdto.setFacilityCategory(facilityCategory);

		Enumeration fileNames = multipartRequest.getFileNames();
		while (fileNames.hasMoreElements()) {

			String parameter = (String) fileNames.nextElement();
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);

			if (fileName == null)
				continue;

			if (!fileName.endsWith(".png") && !fileName.endsWith(".jpg")) {
				File file = new File(directory + fileRealName);
				file.delete();
			} else {

				dbDAO dbdao = new dbDAO();
				int fileNum = 0;
				fileNum = dbdao.fileUpload(fileName, fileRealName);
				cdto.setFileNum(fileNum);

				dbdao.communityUpload(cdto);

			}

		}

		response.sendRedirect("community.jsp");

	}

}
