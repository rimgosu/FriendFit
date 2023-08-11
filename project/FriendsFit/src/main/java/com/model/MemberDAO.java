package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

   private Connection conn;
   private PreparedStatement psmt;
   private ResultSet rs;

   // 데이터베이스 연결메소드
   public void getConnection() {

      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");

         String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
         String db_id = "Insa4_Spring_hacksim_5";
         String db_pw = "aishcool5";

         conn = DriverManager.getConnection(db_url, db_id, db_pw);

      } catch (ClassNotFoundException e) {
         e.printStackTrace();
         System.err.println("ojdbc6.jar 또는 경로를 체크하세요!");
      } catch (SQLException e) {
         e.printStackTrace();
         System.err.println("DB연결에 필요한 정보가 맞는지 체크하세요!");
      }
   }

   // 데이터 베이스 종료메소드
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
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   public MemberDTO login(String input_id, String input_passwd) {

      getConnection();
       
      MemberDTO info = null;
      
      try {
         String sql = "SELECT * FROM tb_member WHERE  member_id = ? and member_pw = ?";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, input_id);
         psmt.setString(2, input_passwd);

         rs = psmt.executeQuery();

         if (rs.next()) {
            String member_id = rs.getString(1);
            String passwd = rs.getString(2);
            //String user_passwd_confirm = rs.getString(3);
            String name = rs.getString(3);
            int age = rs.getInt(4);
            String mobile = rs.getString(5);
            String year = rs.getString(6);
            String addr = rs.getString(7);
            int point = rs.getInt(8);
            String day = rs.getString(9);
            
            info = new MemberDTO(member_id, passwd, name, age, mobile, year, addr, point, day);
            System.out.println(info.toString());

         }
         return info;

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }

      return info;
   }

   public void join(MemberDTO memberDTO) {
      getConnection();
      
      String sql = "INSERT INTO TB_MEMBER VALUES(?,?,?,?,?,?,?,?,?)";
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, memberDTO.getMember_id());
         psmt.setString(2, memberDTO.getPasswd());
         psmt.setString(3, memberDTO.getName());
         psmt.setString(4, memberDTO.getAddr());
         psmt.setInt(5, memberDTO.getAge());
         psmt.setString(6, memberDTO.getMobile());
         psmt.setString(7, memberDTO.getYear());
         psmt.setInt(8, memberDTO.getPoint());
         psmt.setString(9, memberDTO.getDay());
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
   }

}