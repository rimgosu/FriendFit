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
<link rel="stylesheet" href="css/__reviewWrite.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('#searchInput').on('keyup', function() {
       const recommendBox = document.querySelector("#results-wrapper");
        
        // invisible 클래스를 제거하여 추천 박스를 표시합니다.
        recommendBox.classList.remove('invisible');
        recommendBox.classList.remove('select-results');
        var query = $(this).val();
        if (query.length > 1) { // 검색어가 2자 이상일 때만 요청
            $.ajax({
                url: 'searchServlet',
                method: 'GET',
                data: {
                    query: query
                },
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function(dataStr) {
                    // 문자열을 파싱하여 배열로 변환
                    var data = dataStr.replace(/^\[|\]$/g, '').split(', ').map(item => item.trim());

                    var formattedData = '';
                    for (var i = 0; i < data.length; i++) {
                        formattedData += '<a href="#" class="search-item" data-value="' + data[i].split(' ')[0] + '">' + data[i] + '</a><br class="break-line">';
                    }
                    $('#results').html(formattedData);
                    
                    // 검색 결과에 클릭 이벤트 추가
                    $('#results').find('.search-item').on('click', function(event) {
                        event.preventDefault(); // 기본 링크 동작 방지
                        
                        var selectedValue = $(this).attr('data-value'); // 번호만 가져옴

                        // 모든 항목과 줄바꿈 태그를 숨김
                        $('.search-item, .break-line').hide();
                        
                        // 선택된 항목만 보여줌
                        $(this).show();
                        
                        // 선택된 값으로 input 태그 추가
                        var inputElement = $('<input>')
                            .attr('name', 'facilityNum')
                            .attr('value', selectedValue)
                            .attr('type', 'text')
                            .attr('style', 'display: none;')
                            .insertAfter($(this)); // 선택된 항목 바로 뒤에 추가
                       
                            
                           recommendBox.classList.add('select-results');
                    });
                }
            });
        }
    });
});

</script>

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

				<h2 class="page-title">리뷰 글쓰기</h2>
				<br>


				<div class="form-container">

					<form class="review-form" action="reviewAction" method="post"
						enctype="multipart/form-data">
						<div class="search-wrapper">
							<div class="search-bar">
								<input type="text" id="searchInput" class="search-input"
									placeholder="시설 검색...">
							</div>
							<div class="invisible" id="results-wrapper">
								<div class="results-box">
									<div id="results" class="search-results"></div>
								</div>
							</div>
						</div>

						<div class="title-section">
							<input type="text" name="reviewTitle" class="review-title"
								placeholder="제목을 입력해 주세요.">
						</div>

						<div class="file-section">
							<input type="file" name="file" class="file-input">
						</div>

						<section class="review-star-section">
							<label class="review-star">이 시설의 만족도는 어떤가요?</label>
							<div class="star-rating space-x-4 mx-auto" style="margin-top: 5px;">
								<input type="radio" id="5-stars" name="reviewGrade" value="5"
									v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
								<input type="radio" id="4-stars" name="reviewGrade" value="4"
									v-model="ratings" /> <label for="4-stars" class="star">★</label>
								<input type="radio" id="3-stars" name="reviewGrade" value="3"
									v-model="ratings" /> <label for="3-stars" class="star">★</label>
								<input type="radio" id="2-stars" name="reviewGrade" value="2"
									v-model="ratings" /> <label for="2-stars" class="star">★</label>
								<input type="radio" id="1-star" name="reviewGrade" value="1"
									v-model="ratings" /> <label for="1-star" class="star">★</label>
							</div>
						</section>

						<div class="content-section">
							<textarea name="reviewContent" rows="15" cols="51"
								class="content-textarea"></textarea>
							<br>
						</div>


						<div class="submit-button">
							<input class="submit-button-input" type="submit" value="등록">
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