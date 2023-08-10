<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%
    session.invalidate(); /* 이 페이지에 접속하면 session을 빼앗김 */
   %>
   <script>
       location.href = 'index.jsp';
   </script>
</body>
</html>