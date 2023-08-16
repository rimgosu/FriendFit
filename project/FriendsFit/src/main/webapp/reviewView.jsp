<%@page import="file.model.fileDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.reviewComment_memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.reviewSelectDTO"%>
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

				<div id="main" style="background-color: white;">

					<div class="reviewWrite">
						<a href="reviewWrite.jsp">리뷰쓰기</a>
					</div>


					<div class="reviewcontainer">


						<%
						request.setCharacterEncoding("UTF-8");
						response.setCharacterEncoding("UTF-8");
						String reviewNum = request.getParameter("reviewNum");
						int intReviewNum = Integer.parseInt(reviewNum);
						System.out.println(reviewNum);
						System.out.println(intReviewNum);

						dbDAO dbdao = new dbDAO();
						reviewSelectDTO review = dbdao.getReview(intReviewNum);
						request.setAttribute("review", review);
						fileDAO filedao = new fileDAO();
						String fileRealName = filedao.getFileRealName(review.getFileNum());
						%>

						<div class="community-list-item">
							<div class="CommunityListItem__StyledListItemContent">
								<div class="CommunityListItem__bill">영수증후기</div>
								<div class="CommunityListItem__id">${review.memberID}</div>
								<div class="CommunityListItem__point">(포인트)</div>
								<div class="CommunityListItem__registerDate">${review.reviewDay}</div>
								<div class="Community-image"><img style="width:420px; padding-right: 10px; padding-left: 10px" src="upload/<%= fileRealName %>"></div>
								
								<div class="CommunityListItem__content">${review.reviewContent}</div>
							</div>
							<section class="CommunityListItem__StyledCommunityActionBar">
								<button class="like-button">
									<img src="img/like-icon.svg">
									<div>좋아요</div>
									<div>${review.reviewLike}</div>
								</button>
								<button class="like-button">
									<img src="img/comment-icon.svg">
									<div>댓글</div>
									<div>(댓글수)</div>
								</button>
								<button class="like-button">
									<img src="img/views-icon.svg">
									<div>조회수</div>
									<div>${review.reviewView}</div>
								</button>
							</section>
						</div>


					</div>

					<!-- 리뷰댓글쓰기 -->
					<form action="reviewCommentAction" method="post">
						<%=reviewNum%>
						<div class="review-comment-textarea">
							<input name="rNum" value="<%=reviewNum%>" style="display: none;">
							<textarea name="reviewComment" maxlength="440"
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
					ArrayList<reviewComment_memberDTO> rcmdto = dbdao.getReviewComment(intReviewNum);
					for (int i = 0; i < rcmdto.size(); i++) {
					%>

					<div class="review-wrapper">
						<div class="comment-list-item">
							<div class="comment-list-item-content">
								<div class="comment-user-profile">
									<div class="comment-user"></div>
									<div class="user-tag"><%=rcmdto.get(i).getId()%></div>
									<div class="create-time-wrapper">
										<%=rcmdto.get(i).getPoint()%></div>
								</div>
								<div class="comment-contents">
									<%=rcmdto.get(i).getContent()%>
								</div>
								<div class="comment-action-area">
									<div class="community-detail">
										<button class="comment-like-button">
											<img data-testid="thumbs-up-off-icon"
												src="/imag/black-thumb-up-icon.svg" alt="thumb up off icon">
											<div>
												<%=rcmdto.get(i).getRegisterDate()%>
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