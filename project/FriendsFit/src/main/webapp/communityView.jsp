<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.communityComment_memberDTO"%>
<%@page import="com.model.communityCommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.communityDTO"%>
<%@page import="com.model.dbDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FriendsFit</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/slideStyle.css">
<link rel="stylesheet" href="css/communityClick.css">

<%
	String commuNum = request.getParameter("commuNum");
	int commuNumInt = Integer.parseInt(commuNum);
	dbDAO dbdao = new dbDAO();
	communityDTO cdto = dbdao.getCommunity(commuNumInt);
	
%>


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



				<div class="container">
					<div class="row">

						<div class="bbs-title">
							<%= cdto.getCommuTitle() %>
						</div>

						<div class="user-info">
							<div class="user-id">
								<%= cdto.getMemberID() %>
							</div>
							<div class="user-divider">·</div>
							<div class="community-day">
								<%= cdto.getCommuDay() %>
							</div>
						</div>

						<div class="bbs-content">
							<div class="content-text">
								<%= cdto.getCommuContent() %>
							</div>
						</div>

					</div>
					<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
					<script src="js/bootstrap.js"></script>

					<!-- 리뷰댓글쓰기 -->
					<form action="communityCommentAction" method="post">
						<%= commuNum %>
						<div class="commu-comment-textarea">
							<input name="cNum" value="<%= commuNum %>" style="display: none;">
							<textarea name="commuComment" maxlength="440"
								data-testid="comment-textarea" placeholder="댓글을 입력해주세요."
								class="CommunityDetailTemplate__StyledCommentTextarea-sc-alice7-27"
								style="height: 24px !important;"></textarea>
							<div
								class="CommunityDetailTemplate__StyledTextareaButtonsArea-sc-alice7-28 ljKWyy">
								<button type="reset"
									class="CommunityDetailTemplate__StyledCommentActionButton-sc-alice7-29 eLDXiU">취소</button>
								<button type="submit"
									class="CommunityDetailTemplate__StyledCommentActionButton-sc-alice7-29 jvbKoX">등록</button>
							</div>
						</div>
					</form>






					<!-- 리뷰댓글보기 -->
					<%
					ArrayList<communityComment_memberDTO> ccomentdto = dbdao.getCommunityComment(commuNumInt);
					for (int i = 0; i < ccomentdto.size(); i++) {
					%>

					<div class="commu-wrapper">
						<div class="comment-list-item">
							<div class="comment-list-item-content">
								<div class="comment-user-profile">
									<div class="comment-user"></div>
									<div class="user-tag"><%=ccomentdto.get(i).getId()%></div>
									<div class="create-time-wrapper">
										<%=ccomentdto.get(i).getPoint()%></div>
								</div>
								<div class="comment-contents">
									<%=ccomentdto.get(i).getContent()%>
								</div>
								<div class="comment-action-area">
									<div class="community-detail">
										<button class="comment-like-button">
											<img data-testid="thumbs-up-off-icon"
												src="/imag/black-thumb-up-icon.svg" alt="thumb up off icon">
											<div>
												<%=ccomentdto.get(i).getRegisterDate()%>
											</div>
										</button>
									</div>
								</div>
							</div>

						</div>
					</div>
					<%
					}
					%>

					<div id="main" class="main-content"></div>

					<div id="footer" class="footer-content">
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
						<li class="navbar-li5 navbar-li"><img
							src="img/nav_review.svg" alt="review icon" width="24" height="24"
							style="cursor: pointer" onclick="location.href='review.jsp'">
							<br>ocr리뷰</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
