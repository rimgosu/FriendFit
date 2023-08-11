package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import file.model.fileDTO;

public class dbDAO {

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

	public int fileUpload(String fileName, String fileRealName) {
		getConnection();

		try {
			String sql = "INSERT INTO TB_FILE VALUES (FILE_NUM.NEXTVAL, ?, ?, 0, 'Y', SYSDATE )";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, fileName);
			psmt.setString(2, fileRealName);
			psmt.executeUpdate();

			sql = "SELECT FILE_NUM.CURRVAL FROM dual";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			int fileNum = 0;
			if (rs.next()) {
				fileNum = rs.getInt(1);
			}

			return fileNum;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public int reviewUpload(reviewDTO reviewdto, int fileNum) {
		getConnection();

		try {
			String sql = "INSERT INTO TB_REVIEW VALUES (REVIEW_NUM.NEXTVAL, ?, ?, ?, ?, ?, 0, 0, ?, SYSDATE)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, reviewdto.getReviewTitle());
			psmt.setString(2, reviewdto.getReviewContent());
			psmt.setString(3, reviewdto.getMemberID());
			psmt.setInt(4, fileNum);
			psmt.setInt(5, reviewdto.getFacilityNum());
			psmt.setInt(6, reviewdto.getReviewGrade());

			cnt = psmt.executeUpdate();

			return cnt;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public ArrayList<reviewSelectDTO> getReviews() {
		ArrayList<reviewSelectDTO> list = new ArrayList<reviewSelectDTO>();
		getConnection();
		try {
			String sql = "SELECT * FROM (SELECT * FROM tb_review ORDER BY review_num DESC ) WHERE ROWNUM <= 5";
			psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				reviewSelectDTO reviews = new reviewSelectDTO(
						rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getString(10)
						);
				list.add(reviews);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public reviewSelectDTO getReview(int reviewNum) {
		ArrayList<reviewSelectDTO> list = new ArrayList<reviewSelectDTO>();
		getConnection();
		try {
			String sql = "select * from tb_review where review_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNum);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				reviewSelectDTO reviews = new reviewSelectDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6),
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(9),
						rs.getString(10)
						);
				list.add(reviews);
			}
			return list.get(0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}
	
	public ArrayList<reviewSelectDTO> getReviewsInFacility(int facilityNum) {
		ArrayList<reviewSelectDTO> list = new ArrayList<reviewSelectDTO>();
		getConnection();
		try {
			String sql = "select * from tb_review where facilityNum=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, facilityNum);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				reviewSelectDTO reviews = new reviewSelectDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6),
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(9),
						rs.getString(10)
						);
				list.add(reviews);
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

	public int reviewCommentUpload(reviewCommentDTO rcommentdto) {
		getConnection();

		try {
			String sql = "INSERT INTO TB_REVIEW_COMMENT VALUES (REVIEW_COMMENT_NUM.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, rcommentdto.getReviewCommentContent());
			psmt.setString(2, rcommentdto.getMemberID());
			psmt.setInt(3, rcommentdto.getReviewNum());
			psmt.setInt(4, rcommentdto.getReviewCommentLike());

			cnt = psmt.executeUpdate();

			return cnt;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public ArrayList<reviewComment_memberDTO> getReviewComment(int reviewNum) {
		ArrayList<reviewComment_memberDTO> list = new ArrayList<reviewComment_memberDTO>();
		getConnection();
		try {
			String sql = "select a.member_id, MEMBER_POINT, a.REVIEW_COMMENT_DAY, REVIEW_COMMENT_CONTENT, REVIEW_COMMENT_LIKE from tb_review_comment a, tb_member b where a.member_id = b.member_id and review_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reviewNum);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				reviewComment_memberDTO reviews = new reviewComment_memberDTO(rs.getString(1), rs.getInt(2),
						rs.getString(3), rs.getString(4), rs.getInt(5));
				list.add(reviews);
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

	public ArrayList<String> facilitySearch(String query) {
		ArrayList<String> list = new ArrayList<String>();
		getConnection();
		try {
			String sql = "select FACILITY_NUM,FACILITY_NAME from tb_facility where FACILITY_NAME like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+query+"%");
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				list.add(Integer.toString(rs.getInt(1))+ " "  +rs.getString(2));
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
	

	public facilityClickDTO getFacility(double x, double y) {
		/*
		 * System.out.println("computing in getFacility" ); System.out.println(x);
		 * System.out.println(y);
		 */
		
		facilityClickDTO fcdto = new facilityClickDTO();
		getConnection();
		try {
			String sql = "select * from tb_facility "
					+ "where abs(facility_x - ?) < 0.001\r\n"
					+ "  and abs(facility_y - ?) < 0.001";
			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, x);
			psmt.setDouble(2, y);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				fcdto.setFacilityNum(rs.getInt(1));
				fcdto.setFacilityName(rs.getString(2));
				fcdto.setFacilityCategoy(rs.getString(3));
				fcdto.setFacilityMainFacility(rs.getString(4));
				fcdto.setFacilityTime(rs.getString(5));
				fcdto.setFacilityTel(rs.getString(6));
				fcdto.setFacilityPrice(rs.getString(7));
				fcdto.setFacilityPayment(rs.getString(8));
				fcdto.setFacilityAmenities(rs.getString(9));
				fcdto.setFacilityHomepage(rs.getString(10));
				fcdto.setFacilityTag(rs.getString(11));
				fcdto.setFacilityInfo(rs.getString(12));
				fcdto.setFacilityYear(rs.getString(13)); // 문자열로 저장되어 있는 경우
				fcdto.setFacilitySize(rs.getInt(14));
				fcdto.setFacilityAddr(rs.getString(15));
				fcdto.setFacilityX(rs.getDouble(16));
				fcdto.setFacilityY(rs.getDouble(17));
				fcdto.setFacilityDay(rs.getString(18));
				fcdto.setFileNum(rs.getInt(19));
				fcdto.setFacilityImageSrc(rs.getString(20));


				
			}
			return fcdto;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	public void communityUpload(communityDTO cdto) {
		getConnection();

		try {
			String sql = "INSERT INTO tb_community VALUES (commu_num.NEXTVAL, ?, ?, ?, ?, 0, 0, SYSDATE, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cdto.getCommuTitle());
			psmt.setString(2, cdto.getCommuContent());
			psmt.setInt(3, cdto.getFileNum());
			psmt.setString(4, cdto.getMemberID());
			psmt.setString(5, cdto.getFacilityCategory());

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public ArrayList<communityDTO> getCommunities() {
		ArrayList<communityDTO> list = new ArrayList<communityDTO>();
		getConnection();
		try {
			String sql = "select * from tb_community";
			psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				communityDTO reviews = new communityDTO(
						rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9)
						);
				list.add(reviews);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public communityDTO getCommunity(int commuNum) {
		ArrayList<communityDTO> list = new ArrayList<communityDTO>();
		getConnection();
		try {
			String sql = "select * from tb_community where commu_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commuNum);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				communityDTO reviews = new communityDTO(
						rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9)
						);
				list.add(reviews);
			}
			return list.get(0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	public int communityCommentUpload(communityCommentDTO ccdto) {
		getConnection();
		/*
		 * 	private int commentNum;
			private String commentContent;
			private String memberID;
			private int commuNum;
			private int commentLike;
			private String commentDay;
		 */
		System.out.println(ccdto.getCommentContent());
		System.out.println(ccdto.getMemberID());
		System.out.println(ccdto.getCommuNum());
		System.out.println(ccdto.getCommentLike());

		try {
			String sql = "INSERT INTO tb_comment VALUES (COMMENT_NUM.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ccdto.getCommentContent());
			psmt.setString(2, ccdto.getMemberID());
			psmt.setInt(3, ccdto.getCommuNum());
			psmt.setInt(4, ccdto.getCommentLike());

			cnt = psmt.executeUpdate();

			return cnt;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public ArrayList<communityComment_memberDTO> getCommunityComment(int commuNum) {
		/*
		 *  private String id;
			private int point;
			private String registerDate;
			private String content;
			private int like;
		 */
		ArrayList<communityComment_memberDTO> list = new ArrayList<communityComment_memberDTO>();
		getConnection();
		try {
			String sql = "select a.member_id, MEMBER_POINT, a.comment_day, comment_content, comment_like from tb_comment a, tb_member b where a.member_id = b.member_id and commu_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commuNum);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				communityComment_memberDTO reviews = new communityComment_memberDTO(rs.getString(1), rs.getInt(2),
						rs.getString(3), rs.getString(4), rs.getInt(5));
				list.add(reviews);
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

	public void columnUpload(columnDTO cldto) {
		// TODO Auto-generated method stub
		getConnection();

		try {
			String sql = "INSERT INTO tb_column VALUES (column_num.nextval, ?, ?, ?, sysdate, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cldto.getColumnTitle());
			psmt.setString(2, cldto.getColumnContent());
			psmt.setInt(3, cldto.getFileNum());
			psmt.setString(4, cldto.getColumnWriter());

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
	}
	
	public ArrayList<columnDTO> getColumns() {
		ArrayList<columnDTO> list = new ArrayList<columnDTO>();
		getConnection();
		try {
			String sql = "select * from tb_column order by column_num desc";
			psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				columnDTO column = new columnDTO(
						rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6)
						);
				list.add(column);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public columnDTO getColumn(int columnNum) {
		ArrayList<columnDTO> list = new ArrayList<columnDTO>();
		getConnection();
		try {
			String sql = "select * from tb_column where column_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, columnNum);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				columnDTO column = new columnDTO(
						rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6)
						);
				list.add(column);
			}
			return list.get(0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}
	
	public ArrayList<facilityClickDTO> getFacilities() {
	    ArrayList<facilityClickDTO> list = new ArrayList<facilityClickDTO>();
	    getConnection();
	    try {
	        String sql = "select * from tb_facility";
	        psmt = conn.prepareStatement(sql);
	        ResultSet rs = psmt.executeQuery();
	        while (rs.next()) {
	            facilityClickDTO facility = new facilityClickDTO(
	                    rs.getInt(1),                // facilityNum
	                    rs.getString(2),             // facilityName
	                    rs.getString(3),             // facilityCategory
	                    rs.getString(4),             // facilityMainFacility
	                    rs.getString(5),             // facilityTime
	                    rs.getString(6),             // facilityTel
	                    rs.getString(7),             // facilityPrice
	                    rs.getString(8),             // facilityPayment
	                    rs.getString(9),             // facilityAmenities
	                    rs.getString(10),            // facilityHomepage
	                    rs.getString(11),            // facilityTag
	                    rs.getString(12),            // facilityInfo
	                    rs.getString(13),            // facilityYear
	                    rs.getInt(14),               // facilitySize
	                    rs.getString(15),            // facilityAddr
	                    rs.getDouble(16),               // facilityX
	                    rs.getDouble(17),               // facilityY
	                    rs.getString(18),            // facilityDay
	                    rs.getInt(19),               // fileNum
	                    rs.getString(20)             // facilityImageSrc
	            );
	            list.add(facility);
	        }
	        return list;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return null;
	}
	
	public void updateCommunityLike(int commuNum, String sessionMemberID ) {
		getConnection();

		try {
			String sql = "INSERT INTO TB_community_like VALUES (?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commuNum);
			psmt.setString(2, sessionMemberID);

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}

	public int getCommunityLike(int commuNum) {
		getConnection();
		System.out.println(commuNum);
		int like = 0;
		try {
			String sql = "SELECT COUNT(DISTINCT session_member_id)\r\n"
					+ "FROM tb_community_like\r\n"
					+ "WHERE commu_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commuNum);
			ResultSet rs = psmt.executeQuery();
			
			while (rs.next()) {
				like = rs.getInt(1);
			}
			return like;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return like;
	}
	
	
	
}

