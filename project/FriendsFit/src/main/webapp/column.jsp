<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FriendsFit</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/slideStyle.css">

</head>
<body>
	<div id="whole">
        <div id="mainframe">
            <div id="main-content">
                <div id="header">
                    <div class="top-header">
                        <img src="img/FFlogo.png" alt="friendsfit-logo" style="cursor:pointer" onclick="location.href='index.jsp'">
                         <!-- <h1>Our fit</h1> -->
                    </div>
                    <div class="button-group">
                        <form action="login.html">
                            <button type="submit" class="sign-in-button" formaction="login.jsp">
                                로그인
                                /
                                가입
                            </button>
                    </form>
                    </div>
                </div>
                
                <div id="main" style="background-color: white;">
                
                </div>
                
                <div id="footer">
                    <h1>FriendsFit</h1>
                    피트니스크루<br>
                    팀장 김대현: ysm691611@naver.com<br>
                    변지협 오주현 류혜림 염다영<br>
                    인공지능사관학교<br>
                    @all rights reserved+
                </div>
            </div>
            
            <div id="main-navbar" class="navbar">
                <ul class="navbar-ul">
                    <li class="navbar-li1 navbar-li">
                    		<img src="img/nav_home.svg" alt="home icon" width="24" height="24" style="cursor:pointer" onclick="location.href='index.jsp'">
                    	<br>홈
                    </li>
                    <li class="navbar-li2 navbar-li">                    	
                    		<img src="img/nav_map.svg" alt="map icon" width="24" height="24" style="cursor:pointer" onclick="location.href='map.jsp'">
                            <br>지도
                     </li>
                    <li class="navbar-li3 navbar-li">
                    		<img src="img/nav_commu.svg" alt="community icon" width="24" height="24" style="cursor:pointer" onclick="location.href='community.jsp'">
                    		<br>커뮤니티
                    </li>
                    <li class="navbar-li4 navbar-li">
	                    	<img src="img/nav_col.svg" alt="column icon" width="24" height="24" style="cursor:pointer" onclick="location.href='column.jsp'">
                    		<br>컬럼
                    </li>
                    <li class="navbar-li5 navbar-li">
                    		<img src="img/nav_review.svg" alt="review icon" width="24" height="24" style="cursor:pointer" onclick="location.href='review.jsp'">
                        <br>ocr리뷰
                    </li>
				</ul>
            </div>
        </div>
    </div>
</body>
</html>