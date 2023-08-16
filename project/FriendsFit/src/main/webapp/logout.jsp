<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- font-start -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<style type="text/css">
* {
	font-family: 'Nanum Gothic Coding', monospace;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<!-- font-end -->
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