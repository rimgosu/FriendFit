<%@page import="com.model.MemberDTO"%>
<%@page import="file.model.fileDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.columnDTO"%>
<%@page import="com.model.dbDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FriendsFit</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/slideStyle.css">
<link rel="stylesheet" href="css/column.css">
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
<style type="text/css">
textarea {
	white-space: pre-wrap;
}
span {
	font-family: 'Nanum Gothic Coding', monospace;
	font-family: 'Noto Sans KR', sans-serif;
}
b {
	font-size: 17px;
}
.column-user-profile {
	margin-top: 10px;
}
</style>


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

				<div id="main" style="background-color: white;">
					<%
					if (info != null && info.getMember_id() != null && info.getMember_id().equals("admin")) {
					%>
					<div class="reviewWrite">
						<div class="reviewWrite_Box">
							<div class="reviewInner">
								<span style="cursor: pointer"
									onclick="location.href='columnWrite.jsp'"><b>컬럼 쓰기</b></span> <img
									src="img/writeIcon.png" width="16" height="16"
									viewBox="0 0 24 24" fill="none" class="writeIcon">
							</div>
						</div>
					</div>
					<%
					}
					%>

					<!-- 리뷰댓글보기 -->
					<%
					dbDAO dbdao = new dbDAO();
					columnDTO cldto = new columnDTO();
					ArrayList<columnDTO> columnlist = dbdao.getColumns();
					fileDAO filedao = new fileDAO();
					%>

					<div class="column-wrapper">
						<%
						for (int i = 0; i < columnlist.size(); i++) {
							String fileRealName = filedao.getFileRealName(columnlist.get(i).getFileNum());
						%>
						<div class="column-list-item">
							<div class="column-list-item-content">
								<div class="column-img-box">
									<div class="column-img">
										<img src="upload/<%=fileRealName%>">
									</div>
								</div>
								<div class="column-user-profile">
									<img src="img/userimage.png" alt="profile image"
										class="UserProfileInColumn">
									<div class="column-writer">
										<%=columnlist.get(i).getColumnWriter()%></div>
									<div
										class="UserProfileInCommunity__StyledDot-sc-w1vfwl-3 jcThmW">·</div>
									<div class="column-day">
										<%=columnlist.get(i).getColumnDay()%>
									</div>
								</div>
								<div class="column-contents">
									<span class="column-title"><b>[ 🔎 <%=columnlist.get(i).getColumnTitle()%>🔎 ]
									</b></span> <span class="column-contents"><%=columnlist.get(i).getColumnContent()%></span>
								</div>

							</div>
							<div class="CommunityListItem__StyledDivider-sc-e2ofnp-11 hibHiS"></div>

						</div>


						<%
						}
						%>
					</div>


				</div>

				<div id="footer">
					<h1>FriendsFit</h1>
					피트니스크루<br> 팀장 김대현: ysm691611@naver.com<br> 변지협 오주현 류혜림
					염다영<br> 인공지능사관학교<br> @all rights reserved+
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
	</div>
</body>
</html>