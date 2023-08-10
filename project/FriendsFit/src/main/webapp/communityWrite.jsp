<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FriendsFit</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/slideStyle.css">
<link rel="stylesheet" href="css/communityWrite.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
	<div id="whole">
		<div id="mainframe">
			<div id="main-content">
				<% MemberDTO info = (MemberDTO)session.getAttribute("info"); %>
				<div id="header">
					<div class="top-header">
						<img src="img/FFlogo.png" alt="friendsfit-logo"
							style="cursor: pointer" onclick="location.href='index.jsp'">
						<!-- <h1>Our fit</h1> -->
					</div>
					<div class="button-group">

						<% if(info == null){ %>
						<form action="login.jsp">
							<button type="submit" class="sign-in-button"
								formaction="login.jsp">로그인 / 가입</button>
						</form>
						<% }else{ %>
						<div class="GlobalHeader__StyledRightButtonGroup">
							<button class="GlobalHeader__StyledButton">
								<img src="img/userimage.png" alt="user profile"
									class="userprofile" style="cursor: pointer"
									onclick="location.href='mypage.jsp'">
							</button>
						</div>
						<% } %>
					</div>
				</div>

				<h2 class="page-title">커뮤니티 글쓰기</h2>
				<br>
				<div class="divider"></div>

				<div class="form-container">
					<form class="community-form" action="communityAction" method="post"
						enctype="multipart/form-data">
						<div class="category-selection">
							<div class="category-label">카테고리를 선택해주세요.
							<select class="category-select" name="facilityCategory">
								<option>헬스장</option>
								<option>수영</option>
								<option>자세교정</option>
								<option>크로스핏</option>
								<option>라켓스포츠</option>
								<option>클라이밍</option>
								<option>무도장</option>
								<option>골프</option>
								<option>기타시설</option>
							</select>
							</div>
						</div>
						<div class="title-input">
							<input class="title-field" placeholder="제목을 입력해 주세요." type="text"
								name="commuTitle">
						</div>
						<div class="file-input">
							<input class="file-field" type="file" name="file">
						</div>
						<div class="content-input">
							<textarea class="content-field" name="commuContent" rows="30"
								cols="55"></textarea>
							<br>
						</div>
						<div class="submit-button">
							<input id="submit-click" type="submit" value="등록">
						</div>
					</form>
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