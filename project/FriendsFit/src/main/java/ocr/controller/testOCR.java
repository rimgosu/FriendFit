package ocr.controller;

import ocr.model.ocrDAO;

public class testOCR {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String invokeUrl = "input invokeurl"; // OCR Invoke URL 입력
        String secretKey = "input secretKey"; // OCR Secret Key 입력
        String format = "png";
        String url = "https://help.jobis.co/hc/article_attachments/115014257148/c.PNG";
		ocrDAO dao = new ocrDAO(invokeUrl, secretKey, format, url);
		
		try {
			System.out.println(dao.callOcrApi());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
