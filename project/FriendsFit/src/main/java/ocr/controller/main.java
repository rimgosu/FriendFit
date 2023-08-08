package ocr.controller;

import ocr.model.KeyDAO;
import ocr.model.gpt3DAO;
import ocr.model.ocrDAO;

public class main {
	
	public static void main(String[] args) {
		KeyDAO keyDAO = new KeyDAO("C://keys/keys.json");
		// TODO Auto-generated method stub
		String API_KEY = keyDAO.getKeyValue("gptPrivateKey");
		String invokeUrl = keyDAO.getKeyValue("clovaOCRInvokeURL"); 
        String secretKey = keyDAO.getKeyValue("clovaOCRPrivateKey");
        
        
        String format = "png";
        String url = "https://blog.kakaocdn.net/dn/by79KZ/btqFHbaHAWd/ymCPJQOETF4WyFEocKpIfK/img.jpg";
		ocrDAO ocrdao = new ocrDAO(invokeUrl, secretKey, format, url);
		
		String prompt; 
		try {
			prompt = ocrdao.callOcrApi();
			prompt += " '주소'컬럼, '총금액'컬럼, '상호명'컬럼에 각각 값을 넣어줘";
	        gpt3DAO gptdao = new gpt3DAO(API_KEY, prompt);
	        System.out.println(gptdao.getAiResponse());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
