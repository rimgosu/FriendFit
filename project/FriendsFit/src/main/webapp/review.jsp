<%@page import="file.model.fileDAO"%>
<%@page import="com.model.MemberDTO"%>
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
<link rel="stylesheet" href="css/review.css">

</head>
<body>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>

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
							<form action="mypage.jsp">
								<button class="GlobalHeader__StyledButton" type="submit"
									formaction="mypage.jsp">
									<img src="img/userimage.png" alt="user profile"
										class="userprofile" style="cursor: pointer"
										onclick="location.href='mypage.jsp'">
								</button>
							</form>
						</div>
						<%
						}
						%>
					</div>
				</div>

				<div id="main" style="background-color: white;">

					<div class="reviewWrite">
						<div class="reviewWrite_Box">
							<div class="reviewInner">
								<span style="cursor: pointer"
									onclick="location.href='reviewWrite.jsp'"><b>리뷰쓰기</b></span> <img
									src="img/writeIcon.png" width="16" height="16"
									viewBox="0 0 24 24" fill="none" class="writeIcon">
							</div>
						</div>
					</div>

					<div type="line" class="sc-imWYAI dYnKUH"></div>

					<div class="reviewcontainer">


						<%
						request.setCharacterEncoding("UTF-8");

						String reviewHTML = "";

						dbDAO dbdao = new dbDAO();
						ArrayList<reviewSelectDTO> reviewList = new ArrayList<reviewSelectDTO>();

						reviewList = dbdao.getReviews();
						fileDAO filedao = new fileDAO();

						for (int i = 0; i < reviewList.size(); i++) {
							String fileRealName = filedao.getFileRealName(reviewList.get(i).getFileNum());

							reviewHTML += "<div class=\"community-list-item\">";
							reviewHTML += "<div class=\"CommunityListItem__StyledListItemContent\">";
							//영수증
							reviewHTML += "<div class=\"CommunityListItem__bill\">";
							reviewHTML += "<img src=\"img/billsIcon.png\" style=\"width:16px; height:16px; viewBox:0 0 32 32; fill:none;\">";
							reviewHTML += "<span class=\"CommunityListItem__StyledCategoryLabel\">";
							reviewHTML += "영수증후기";
							reviewHTML += "</span>";
							reviewHTML += "</div>";
							// 아이디, 포인트
							reviewHTML += "<div class=\"UserProfileInCommunity__StyledUserProfileInCommunity\">";
							reviewHTML += "<img src=\"img/userimage.png\" class=\"UserProfileInCommunity__StyledImg\" alt=\"profile image\">";
							reviewHTML += "<div class=\"CommunityListItem__id\">";
							reviewHTML += reviewList.get(i).getMemberID();
							reviewHTML += "</div>";
							reviewHTML += "<div class=\"UserProfileInCommunity__StyledDot\">";
							reviewHTML += "·";
							reviewHTML += "</div>";
							reviewHTML += "<div class=\"CommunityListItem__point\">";
							reviewHTML += "(포인트)";
							reviewHTML += "</div>";
							reviewHTML += "<div class=\"UserProfileInCommunity__StyledDot\">";
							reviewHTML += "·";
							reviewHTML += "</div>";
							// 리뷰등록일자
							reviewHTML += "<div class=\"CommunityListItem__registerDate\">";
							reviewHTML += reviewList.get(i).getReviewDay();
							reviewHTML += "</div>";
							reviewHTML += "</div>";
							// 리뷰내용
							reviewHTML += "<div class=\"CommunityListItem__content\">";
							reviewHTML += "<span class=\"CommunityListItem__content__span\">";
							reviewHTML += "<div class=\"review-image\">"
							+ "<img style=\"width: 368px; padding-right: 10px; padding-left: 10px\"" + "src=\"upload/" + fileRealName
							+ "\">";

							reviewHTML += reviewList.get(i).getReviewContent();
							// 더보기
							reviewHTML += "<span class=\"CommunityListItem__showMoreText\">";

							reviewHTML += "<a href='reviewView.jsp?reviewNum=" + reviewList.get(i).getReviewNum() + "'>..더 보기</a>";

							reviewHTML += "</span>";
							reviewHTML += "</span></div>";

							reviewHTML += "</div>";
							reviewHTML += "<div class=\"CommunityListItem__StyledDivider\">";
							reviewHTML += "</div>";
							reviewHTML += "<section class=\"CommunityListItem__StyledCommunityActionBar\">";
							// 좋아요 버튼
							reviewHTML += "<button class=\"like-button\">";
							reviewHTML += "<img src=\"img/like-icon.svg\">";
							reviewHTML += "<div>좋아요</div>";
							reviewHTML += "<div>";
							reviewHTML += reviewList.get(i).getReviewLike();
							reviewHTML += "</div>";
							reviewHTML += "</button>";

							// 댓글 버튼
							reviewHTML += "<button class=\"comment-button\">";
							reviewHTML += "<img src=\"img/reply-icon.svg\">";
							reviewHTML += "<div>댓글</div>";
							reviewHTML += "<div>";
							reviewHTML += "(댓글수)";
							reviewHTML += "</div>";
							reviewHTML += "</button>";
							// 조회수 버튼
							reviewHTML += "<button class=\"views-button\">";
							reviewHTML += "<img src=\"img/view-icon.svg\">";
							reviewHTML += "<div>조회</div>";
							reviewHTML += "<div>";
							reviewHTML += reviewList.get(i).getReviewView();
							reviewHTML += "</div>";
							reviewHTML += "</button>";

							reviewHTML += "</section>";
							reviewHTML += "</div>";
						}

						out.print(reviewHTML);
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