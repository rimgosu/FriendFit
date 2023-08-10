<%@page import="com.model.reviewSelectDTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDTO"%>
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
<link rel="stylesheet" href="css/map.css">
</head>
<body>

	<div id="whole">
		<div id="mainframe">

			<div id="main-content">
				<%
				MemberDTO info = (MemberDTO) session.getAttribute("info");
				%>
				<div id="header">
					<div class="top-header">
						<img src="img/FFlogo.png" alt="friendsfit-logo"
							style="cursor: pointer" onclick="location.href='index.jsp'">
						<!-- <h1>Our fit</h1> -->
					</div>
					<div class="button-group">

						<%
						if (info == null) {
						%>
						<form action="login.jsp">
							<button type="submit" class="sign-in-button"
								formaction="login.jsp">로그인 / 가입</button>
						</form>
						<%
						} else {
						%>
						<div class="GlobalHeader__StyledRightButtonGroup">
							<button class="GlobalHeader__StyledButton">
								<img src="img/userimage.png" alt="user profile"
									class="userprofile" style="cursor: pointer"
									onclick="location.href='mypage.jsp'">
							</button>
						</div>
						<%
						}
						%>
					</div>
				</div>

				<div id="main">
					<div id="map"></div>
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
						onclick="location.href='index.jsp'"><br> 홈</li>
					<li class="navbar-li2 navbar-li"><img src="img/nav_map.svg"
						alt="map icon" width="24" height="24" style="cursor: pointer"
						onclick="location.href='map.jsp'"><br> 지도</li>
					<li class="navbar-li3 navbar-li"><img src="img/nav_commu.svg"
						alt="community icon" width="24" height="24"
						style="cursor: pointer" onclick="location.href='community.jsp'"><br>
						커뮤니티</li>
					<li class="navbar-li4 navbar-li"><img src="img/nav_col.svg"
						alt="column icon" width="24" height="24" style="cursor: pointer"
						onclick="location.href='column.jsp'"><br> 컬럼</li>
					<li class="navbar-li5 navbar-li"><img src="img/nav_review.svg"
						alt="review icon" width="24" height="24" style="cursor: pointer"
						onclick="location.href='review.jsp'"><br> ocr리뷰</li>
				</ul>
			</div>


		</div>

		<%
		String x = request.getParameter("x");
		String y = request.getParameter("y");

		dbDAO dbdao = new dbDAO();
		facilityClickDTO fcdto = new facilityClickDTO();
		ArrayList<facilityClickDTO> facilityList = dbdao.getFacilities();
		Gson gson = new Gson();
		String jsonArray = gson.toJson(facilityList);
		facilityClickDTO facility = new facilityClickDTO();

		if (x != null) {
			facility = dbdao.getFacility(Double.parseDouble(x), Double.parseDouble(y));

			System.out.println(facility.getFacilityImageSrc());
		%>

		<div id="aside" style="display: block;">

			<div class="facility-image">

				<%
				if (facility.getFacilityImageSrc() != null) {
				%>
				<img
					style="width: 400px; height: 300px; overflow: hidden; border-radius: 15px;"
					alt="" src="<%=facility.getFacilityImageSrc()%>">
				<%
				}
				%>
			</div>

			<div class="place_section OP4V8" data-nclicks-area-code="btp">
				<div class="zD5Nm f7aZ0">
					<div id="_title" class="YouOG">
						<span class="Fc1rA"><%=facility.getFacilityName()%></span> <span
							class="DJJvD"><%=facility.getFacilityCategoy()%></span>
					</div>

				</div>
			</div>

			<div class="info-container">
				<div class="info-address">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18"
							class="DNzQ2" aria-hidden="true">
                      <path
								d="M15 6.97a6.92 6.92 0 01-1.12 3.77l-5.51 7.08a.47.47 0 01-.74 0L2.1 10.71A6.93 6.93 0 011 6.97 7 7 0 018 0v.93V0a7 7 0 017 6.97zm-13 0c0 1.15.4 2.3.99 3.24L8 16.7l5.04-6.5A5.95 5.95 0 008 1C4.66 1 2 3.64 2 6.97zm6-1.54A1.58 1.58 0 008 8.6a1.57 1.57 0 000-3.16zm0-.93a2.51 2.51 0 010 5.02A2.51 2.51 0 118 4.5z"></path>
                     </svg>
					</div>
					<div style="display: flex; flex-direction: column;"
						class="real-address"><%=facility.getFacilityAddr()%></div>
				</div>

				<div class="info-time thin-border">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18"
							class="DNzQ2" aria-hidden="true">
                        <path
								d="M8 16A7 7 0 108 2a7 7 0 000 14zm0 1A8 8 0 118 1a8 8 0 010 16zm.5-7.8l3.02 1.76a.5.5 0 01.19.68.5.5 0 01-.69.19L7.8 9.96a.5.5 0 01-.3-.46v-5a.5.5 0 011 0v4.7z"></path>
                       </svg>
					</div>
					<div style="display: flex; flex-direction: column;"
						class="real-time"><%=facility.getFacilityTime()%></div>
				</div>

				<div class="info-tel thin-border">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18"
							class="DNzQ2" aria-hidden="true">
                         <path
								d="M2.92 1.15L.15 3.93a.5.5 0 00-.14.45 16.09 16.09 0 0012.6 12.61.5.5 0 00.46-.14l2.78-2.78a.5.5 0 000-.71l-4.18-4.18-.07-.06a.5.5 0 00-.64.06l-1.9 1.9-.28-.18a9.53 9.53 0 01-2.65-2.63L5.96 8 7.88 6.1a.5.5 0 000-.71L4.41 1.93l-.78-.78a.5.5 0 00-.7 0zm5.62 10.79l.37.21.09.04a.5.5 0 00.49-.13l1.82-1.82 3.48 3.47-2.24 2.24-.07-.01A15.1 15.1 0 011.14 4.84l-.1-.4 2.24-2.23 3.54 3.53-1.84 1.84a.5.5 0 00-.08.6 10.54 10.54 0 003.64 3.76z"></path>
                     </svg>
					</div>
					<div style="display: flex; flex-direction: column;"
						class="real-tel"><%=facility.getFacilityTel()%></div>
				</div>

				<div class="info-price thin-border">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17 18"
							class="DNzQ2" aria-hidden="true">
                        <path
								d="M8 17A8 8 0 108 1a8 8 0 000 16zm0-1A7 7 0 118 2a7 7 0 010 14zM4.33 9l1.03 3.75h1.08L7.6 9h.86l1.12 3.75h1.08L11.68 9H13V8h-1.04l.54-2h-1.02l-.51 2H9.14l-.6-2H7.6l-.62 2H5.14l-.5-2H3.5l.55 2H3v1h1.33zM5.4 9h1.28L6 11.21h-.04L5.4 9zm4.04 0h1.27l-.58 2.21h-.02L9.44 9zM8.16 8H7.9l.12-.36h.03l.1.36z"></path></svg>
					</div>
					<div style="display: flex; flex-direction: column;"
						class="real-price"><%=facility.getFacilityPrice()%></div>
				</div>

				<div class="info-payment thin-border">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18"
							class="DNzQ2" aria-hidden="true">
							<path
								d="M14 6.5c0 .3.2.5.5.5s.5-.2.5-.5V4c0-.6-.4-1-1-1h-2.5c-.3 0-.5.2-.5.5s.2.5.5.5H14v2.5zm-13 0c0 .3.2.5.5.5s.5-.2.5-.5V4h2.5c.3 0 .5-.2.5-.5S4.8 3 4.5 3H2c-.6 0-1 .4-1 1v2.5zm1 5c0-.3-.2-.5-.5-.5s-.5.2-.5.5V14c0 .6.4 1 1 1h2.5c.3 0 .5-.2.5-.5s-.2-.5-.5-.5H2v-2.5zm13 0c0-.3-.2-.5-.5-.5s-.5.2-.5.5V14h-2.5c-.3 0-.5.2-.5.5s.2.5.5.5H14c.6 0 1-.4 1-1v-2.5zm-10-3c-.3 0-.5.2-.5.5s.2.5.5.5h6c.3 0 .5-.2.5-.5s-.2-.5-.5-.5H5z"></path></svg>
					</div>
					<div style="display: flex; flex-direction: column;"
						class="real-payment"><%=facility.getFacilityPayment()%></div>
				</div>

				<div class="info-amenities thin-border">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18"
							class="DNzQ2" aria-hidden="true">
                        <path
								d="M10.05 15.48h4.45V7.86a3.26 3.26 0 01-2.22.86c-.81 0-1.57-.3-2.15-.81a3.24 3.24 0 01-2.15.81 3.24 3.24 0 01-2.13-.79 3.24 3.24 0 01-2.13.8 3.26 3.26 0 01-2.22-.87v7.62h4.44V11.3a.5.5 0 01.5-.5h3.11a.5.5 0 01.5.5v4.17zm-1 0V11.8h-2.1v3.67h2.1zm6.45-9.79a.5.5 0 010 .04v10.25a.5.5 0 01-.5.5H1a.5.5 0 01-.5-.5V5.73 5.7a3.11 3.11 0 010-.1.5.5 0 01.05-.22L2.3 1.78a.5.5 0 01.45-.28h10.5a.5.5 0 01.45.28l1.75 3.59a.5.5 0 01.05.22v.1zM3.06 2.5L1.5 5.7a2.19 2.19 0 002.22 2.02 2.24 2.24 0 001.74-.82.5.5 0 01.78 0 2.24 2.24 0 001.74.82c.7 0 1.33-.31 1.75-.85a.5.5 0 01.79 0 2.24 2.24 0 001.76.85c1.2 0 2.16-.9 2.22-2.02l-1.56-3.2H3.06z"></path></svg>
					</div>
					<div style="display: flex; flex-direction: column;"
						class="real-amenities"><%=facility.getFacilityAmenities()%></div>
				</div>

				<div class="info-homepage thin-border">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18"
							class="DNzQ2" aria-hidden="true">
                      <path
								d="M2.5 8.38v7.12h-1V9.35l-.79.75L0 9.4 7.99 1.7 16 9.41l-.71.72-.79-.76v6.13h-1V8.4L7.99 3.1 2.5 8.38zm4.2 7.11h-1V10h4.61v5.5h-1V11H6.7v4.5z"></path>
                     </svg>
					</div>
					<div style="display: flex; flex-direction: column;"
						class="real-homepage">
						<%=facility.getFacilityHomepage()%></div>
				</div>

				<div class="info-tag thin-border">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18"
							class="DNzQ2" aria-hidden="true">
                         <path
								d="M8.5 2.05l5.17 4.65a1 1 0 01.33.74V17a1 1 0 01-1 1H3a1 1 0 01-1-1V7.45a1 1 0 01.33-.75L7.5 2.05V0h1v2.05zm4.34 5.44L8.34 3.3a.5.5 0 00-.68 0L3.16 7.5a.5.5 0 00-.16.36v8.65a.5.5 0 00.5.5h9a.5.5 0 00.5-.5V7.86a.5.5 0 00-.16-.37zM8 11a2 2 0 110-4 2 2 0 010 4zm0-1a1 1 0 100-2 1 1 0 000 2z"></path>
                     </svg>
					</div>
					<div style="display: flex; flex-direction: column;"
						class="real-tag"><%=facility.hashCode()%></div>
				</div>

				<div class="info-info thin-border">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18"
							class="DNzQ2" aria-hidden="true">
                      <path
								d="M11 15V3H2v12h9zm1-6h3v6a1 1 0 01-1 1H2a1 1 0 01-1-1V3a1 1 0 011-1h9a1 1 0 011 1v6zm0 1v5h2v-5h-2zM4 5.5h5v1H4v-1zM4 8h5v1H4V8zm0 2.5h3v1H4v-1z"></path>
                     </svg>
					</div>
					<div style="display: flex; flex-direction: column;"
						class="real-info"><%=facility.getFacilityInfo()%></div>
				</div>

				<div class="info-year thin-border">
					<div class="svg-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" class="DNzQ2" aria-hidden="true">
                         <path
								d="M9 11H7v2h2v-2zm4 0h-2v2h2v-2zm4 0h-2v2h2v-2zm2-7h-1V2h-2v2H8V2H6v2H5c-1.11 0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V9h14v11z"></path>
                     </svg>
					</div>
					<div class="real-year"><%=facility.getFacilityYear()%></div>
				</div>

				<div class="info-size thin-border">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" class="DNzQ2" aria-hidden="true">
                  <path
							d="M20.57 14.86L22 13.43 20.57 12 17 15.57 8.43 7 12 3.43 10.57 2 9.14 3.43 7.71 2 5.57 4.14 4.14 2.71 2.71 4.14l1.43 1.43L2 7.71l1.43 1.43L2 10.57 3.43 12 7 8.43 15.57 17 12 20.57 13.43 22l1.43-1.43L16.29 22l2.14-2.14 1.43 1.43 1.43-1.43-1.43-1.43L22 16.29z" /></svg>
					<div class="real-size"><%=facility.getFacilitySize()%></div>
				</div>
			</div>

			<%-- <div class="review-container thin-border">


				<div class="reviews">

					<%
					request.setCharacterEncoding("UTF-8");
					response.setCharacterEncoding("UTF-8");

					ArrayList<reviewSelectDTO> facilityReviews = dbdao.getReviewsInFacility(facility.getFacilityNum());
					
					for (int i=0; i<facilityReviews.size(); i++) {
					%>
					
					<div class="review-item">
					
						<div class="review-"></div>
						<div class="review-id"></div>
						
					</div>

					<% 
					}
					%>


				</div>
			</div> --%>


			<%
			}
			%>

		</div>
	</div>


	<script type="text/javascript">
		// JSON 배열 데이터를 JavaScript 배열로 변환
		var dtoListData =
	<%=jsonArray%>
		;

		var xClick =
	<%=x%>
		;
		var yClick =
	<%=y%>
		;
	</script>

	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79769e254f2328cac41473351ff2b861"></script>
	<script src="js/_map2.js"></script>
</body>
</html>