package com.model;

public class MemberDTO {
   
   private String member_id;
   private String passwd;
   private String user_passwd_confirm;
   private String name;
   private int age;
   private String mobile;
   private String year;
   private String addr;
   private int point;
   private String day;
   
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public String getPasswd() {
      return passwd;
   }
   public void setPasswd(String passwd) {
      this.passwd = passwd;
   }
   public String getUser_passwd_confirm() {
      return user_passwd_confirm;
   }
   public void setUser_passwd_confirm(String user_passwd_confirm) {
      this.user_passwd_confirm = user_passwd_confirm;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public int getAge() {
      return age;
   }
   public void setAge(int age) {
      this.age = age;
   }
   public String getMobile() {
      return mobile;
   }
   public void setMobile(String mobile) {
      this.mobile = mobile;
   }
   public String getYear() {
      return year;
   }
   public void setYear(String year) {
      this.year = year;
   }
   public String getAddr() {
      return addr;
   }
   public void setAddr(String addr) {
      this.addr = addr;
   }
   public int getPoint() {
      return point;
   }
   public void setPoint(int point) {
      this.point = point;
   }
   public String getDay() {
      return day;
   }
   public void setDay(String day) {
      this.day = day;
   }
   public MemberDTO(String member_id, String passwd, String name, int age, String mobile, String year, String addr,
         int point, String day) {
      super();
      this.member_id = member_id;
      this.passwd = passwd;
      this.name = name;
      this.age = age;
      this.mobile = mobile;
      this.year = year;
      this.addr = addr;
      this.point = point;
      this.day = day;
   }
      
   @Override
   public String toString() {
      return "MemberDTO [member_id=" + member_id + ", passwd=" + passwd + ", user_passwd_confirm="
            + user_passwd_confirm + ", name=" + name + ", age=" + age + ", mobile=" + mobile + ", year=" + year
            + ", addr=" + addr + ", point=" + point + ", day=" + day + "]";
   }
   
   
   
   
}