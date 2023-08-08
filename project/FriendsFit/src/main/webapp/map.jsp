<%@page import="com.model.dbDAO"%>
<%@page import="com.model.facilityClickDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<div id="whole">
		<div id="mainframe">

			<div id="main-content">
				<div id="header">
					<div class="top-header">
						<img src="img/FFlogo.png" alt="friendsfit-logo"
							style="cursor: pointer" onclick="location.href='index.jsp'">
						<!-- <h1>Our fit</h1> -->
					</div>
					<div class="button-group">
						<form action="login.html">
							<button type="submit" class="sign-in-button"
								formaction="login.jsp">로그인 / 가입</button>
						</form>
					</div>
				</div>

				<div id="main" style="background-color: white;">

					<div id="map" style="width: 440px; height: 900px;"></div>


				</div>


				<div id="footer">
					<h1>Ourfit</h1>
					피트니스크루<br> 팀장 김대현: ysm691611@naver.com<br> 변지협 오주현 류혜림
					염다영<br> 인공지능사관학교<br> @all rights reserved

				</div>

			</div>


			<div id="main-navbar" class="navbar">
				<ul class="navbar-ul">
					<li class="navbar-li1 navbar-li"><img src="img/nav_home.svg"
						alt="home icon" width="24" height="24" style="cursor: pointer"
						onclick="location.href='index.jsp'"> <br>홈</li>
					<li class="navbar-li2 navbar-li"><img src="img/nav_map.svg"
						alt="map icon" width="24" height="24" style="cursor: pointer"
						onclick="location.href='map.jsp'"> <br>지도</li>
					<li class="navbar-li3 navbar-li"><img src="img/nav_commu.svg"
						alt="community icon" width="24" height="24"
						style="cursor: pointer" onclick="location.href='community.jsp'">
						<br>커뮤니티</li>
					<li class="navbar-li4 navbar-li"><img src="img/nav_col.svg"
						alt="column icon" width="24" height="24" style="cursor: pointer"
						onclick="location.href='column.jsp'"> <br>컬럼</li>
					<li class="navbar-li5 navbar-li"><img src="img/nav_review.svg"
						alt="review icon" width="24" height="24" style="cursor: pointer"
						onclick="location.href='review.jsp'"> <br>ocr리뷰</li>
				</ul>
			</div>


		</div>
		<%
		String x = request.getParameter("x");
		String y = request.getParameter("y");

		if (x != null) {
			facilityClickDTO fcdto = new facilityClickDTO();
			dbDAO dbdao = new dbDAO();
			fcdto = dbdao.getFacility(Double.parseDouble(x), Double.parseDouble(y));
		%>

		<div id="aside" style="display: block;">
			<div class="fileNum"><%=fcdto.getFileNum()%></div>
			<div class="facilityNum"><%=fcdto.getFacilityNum()%></div>
			<div class="name"><%=fcdto.getFacilityName() %></div>
			<div class="type"><%=fcdto.getFacilityCategoy() %></div>
			<div class="time"><%=fcdto.getFacilityTime() %></div>
			<div class="tel"><%=fcdto.getFacilityTel()%></div>
			<div class="address"><%=fcdto.getFacilityAddr()%></div>
			<div class="registerDate"><%=fcdto.getFacilityDay()%></div>
			<div class="mainFacility dp-none"></div>
			<div class="price dp-none"></div>
			<div class="payType dp-none"></div>
			<div class="convinienceFacility dp-none"></div>
			<div class="homePage dp-none"></div>
			<div class="tag dp-none"></div>
			<div class="content dp-none"></div>
			<div class="yearOfInstall dp-none"></div>
			<div class="area dp-none"></div>
			<div class="x-coord dp-none"></div>
			<div class="y-coord dp-none"></div>
			<div class="reviewNum dp-none"></div>
		</div>
		<%
		}
		%>

	</div>

	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79769e254f2328cac41473351ff2b861"></script>
	<script src="js/_map.js"></script>

</body>
</html>
