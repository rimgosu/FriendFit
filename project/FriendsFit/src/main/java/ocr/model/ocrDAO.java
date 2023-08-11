package ocr.model;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

public class ocrDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt = 0;

	// db 연결
	public void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			String db_id = "Insa4_Spring_hacksim_5";
			String db_pw = "aishcool5";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);

			System.out.print("conn completed. ");
		}

		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("ojdbc6.jar 또는 경로를 확인하세요"); // syse
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("DB연결에 필요한 정보가 맞는지 체크하세요!");
		}
	}
	// db 종료
	public void close() {
		try {

			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}

			System.out.println("close completed.");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private String invokeUrl;
	private String secretKey;
	private String format;
	private String imagePath;

	public ocrDAO(String invokeUrl, String secretKey, String format, String imagePath) {
		this.invokeUrl = invokeUrl;
		this.secretKey = secretKey;
		this.format = format;
		this.imagePath = imagePath;
	}
	
	public ocrDAO() {
		
	}

	private String parseJson(String jsonString) {
		JSONObject obj = new JSONObject(jsonString);
		JSONArray images = obj.getJSONArray("images");
		StringBuilder result = new StringBuilder();

		for (int i = 0; i < images.length(); i++) {
			JSONObject image = images.getJSONObject(i);
			JSONArray fields = image.getJSONArray("fields");

			for (int j = 0; j < fields.length(); j++) {
				JSONObject field = fields.getJSONObject(j);

				if (field.getDouble("inferConfidence") >= 0.9) {
					result.append(field.getString("inferText"));
					result.append(" ");
				}
			}
		}
		return result.toString();
	}

	private String encodeFileToBase64Binary(String imagePath) throws Exception {
		byte[] fileContent = Files.readAllBytes(Paths.get(imagePath));
		return Base64.getEncoder().encodeToString(fileContent);
	}

	public String callOcrApi() throws Exception {
		CloseableHttpClient httpClient = HttpClients.createDefault();

		HttpPost httpPost = new HttpPost(invokeUrl);
		httpPost.setHeader("Content-Type", "application/json");
		httpPost.setHeader("X-OCR-SECRET", secretKey);

		String imageData = "";
		String body = "";
		if (!imagePath.startsWith("https")) {
			imageData = encodeFileToBase64Binary(imagePath);
			body = "{\n" + "    \"images\": [\n" + "      {\n" + "        \"format\": \"" + format + "\",\n"
					+ "        \"name\": \"medium\",\n" + "        \"data\": \"" + imageData + "\",\n"
					+ "        \"url\": null\n" + "      }\n" + "    ],\n" + "    \"lang\": \"ko\",\n"
					+ "    \"requestId\": \"string\",\n" + "    \"resultType\": \"string\",\n" + "    \"timestamp\": "
					+ System.currentTimeMillis() + ",\n" + "    \"version\": \"V1\"\n" + "}";
		} else {
			imageData = imagePath;
			body = "{\n" + "    \"images\": [\n" + "      {\n" + "        \"format\": \"" + format + "\",\n"
					+ "        \"name\": \"medium\",\n" + "        \"data\": null,\n" + "        \"url\": \""
					+ imageData + "\"\n" + "      }\n" + "    ],\n" + "    \"lang\": \"ko\",\n"
					+ "    \"requestId\": \"string\",\n" + "    \"resultType\": \"string\",\n" + "    \"timestamp\": "
					+ System.currentTimeMillis() + ",\n" + "    \"version\": \"V1\"\n" + "}";
		}

		httpPost.setEntity(new StringEntity(body));

		CloseableHttpResponse response = httpClient.execute(httpPost);

		String converted = "";

		try {
			System.out.println(response.getStatusLine());
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				String result = EntityUtils.toString(entity);
				converted += parseJson(result);
			}
		} finally {
			response.close();
		}

		return converted;
	}
	
	public ArrayList<String> parseInformation(String input) {
        ArrayList<String> values = new ArrayList<>();
        
        String[] lines = input.split("\n");
        for (String line : lines) {
            if (line.startsWith("주소:")) {
                values.add(line.replace("주소: ", ""));
            } else if (line.startsWith("총금액:")) {
                values.add(line.replace("총금액: ", ""));
            } else if (line.startsWith("상호명:")) {
                values.add(line.replace("상호명: ", ""));
            }
        }
        
        return values;
    }
	
	public void OCRUpload(String bussinessName, String price, String address, int reviewNum) {
		getConnection();

		try {
			String sql = "INSERT INTO tb_ocr VALUES ( ?, ? , ? , ? )";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, bussinessName);
			psmt.setString(2, price);
			psmt.setString(3, address);
			psmt.setInt(4, reviewNum);
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}
	
	public ArrayList<String> getOCRInformation(int reviewNum) {
		getConnection();
		ArrayList<String> list = new ArrayList<String>();
		
		try {
			String sql = "SELECT * FROM tb_ocr where review_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNum);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
		
	}
	
	public int getLastReviewNum() {
		getConnection();
		int lastReviewNum = 0;
		
		try {
			String sql = "SELECT review_num\n"
					+ "		FROM tb_Review\n"
					+ "		WHERE ROWNUM <= 1\n"
					+ "		ORDER BY review_num desc";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				lastReviewNum = rs.getInt(1);
			}
			return lastReviewNum;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return lastReviewNum;
		
	}
	
}
