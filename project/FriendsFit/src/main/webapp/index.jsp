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
                    
                    <div class="searchsection">
                        <form action="search.html" class="searchbar-box-window">
                            <div class="searchbar">
                                <div>
                                    <input type="text" name="query" value="">
                                    <div class="Searchbutton" style="cursor:pointer" onclick="location.href='search.html'">
                                        <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect width="30" height="30" rx="15" fill="rgb(240, 223, 72)"></rect>
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M16.8715 16.1645L22 21.293L21.293 22L16.1645 16.8715C15.274 17.6025 14.1675 18 13 18C11.6645 18 10.409 17.48 9.4645 16.5355C8.52 15.591 8 14.3355 8 13C8 11.6645 8.52 10.409 9.4645 9.4645C10.409 8.52 11.6645 8 13 8C14.3355 8 15.591 8.52 16.5355 9.4645C17.48 10.409 18 11.6645 18 13C18 14.167 17.6025 15.2735 16.8715 16.1645ZM10.1715 15.8285C10.927 16.584 11.9315 17 13 17C14.0685 17 15.073 16.584 15.8285 15.8285C16.584 15.073 17 14.0685 17 13C17 11.9315 16.584 10.927 15.8285 10.1715C15.073 9.416 14.0685 9 13 9C11.9315 9 10.927 9.416 10.1715 10.1715C9.416 10.927 9 11.9315 9 13C9 14.0685 9.416 15.073 10.1715 15.8285Z" fill="white"></path>
                                            <path d="M22 21.293L22.3536 21.6466L22.7071 21.293L22.3536 20.9394L22 21.293ZM16.8715 16.1645L16.4849 15.8474L16.1976 16.1977L16.5179 16.5181L16.8715 16.1645ZM21.293 22L20.9394 22.3536L21.293 22.7071L21.6466 22.3536L21.293 22ZM16.1645 16.8715L16.5181 16.5179L16.1976 16.1975L15.8473 16.485L16.1645 16.8715ZM10.1715 15.8285L10.5251 15.4749H10.5251L10.1715 15.8285ZM15.8285 15.8285L15.4749 15.4749L15.8285 15.8285ZM15.8285 10.1715L15.4749 10.5251V10.5251L15.8285 10.1715ZM10.1715 10.1715L9.81795 9.81795L10.1715 10.1715ZM22.3536 20.9394L17.2251 15.8109L16.5179 16.5181L21.6464 21.6466L22.3536 20.9394ZM21.6466 22.3536L22.3536 21.6466L21.6464 20.9394L20.9394 21.6464L21.6466 22.3536ZM15.8109 17.2251L20.9394 22.3536L21.6466 21.6464L16.5181 16.5179L15.8109 17.2251ZM13 18.5C14.2828 18.5 15.5015 18.0626 16.4817 17.258L15.8473 16.485C15.0465 17.1424 14.0522 17.5 13 17.5V18.5ZM9.11095 16.8891C10.1492 17.9273 11.5319 18.5 13 18.5V17.5C11.7971 17.5 10.6688 17.0327 9.81805 16.1819L9.11095 16.8891ZM7.5 13C7.5 14.4681 8.07268 15.8508 9.11095 16.8891L9.81805 16.1819C8.96732 15.3312 8.5 14.2029 8.5 13H7.5ZM9.11095 9.11095C8.07268 10.1492 7.5 11.5319 7.5 13H8.5C8.5 11.7971 8.96732 10.6688 9.81805 9.81805L9.11095 9.11095ZM13 7.5C11.5319 7.5 10.1492 8.07268 9.11095 9.11095L9.81805 9.81805C10.6688 8.96732 11.7971 8.5 13 8.5V7.5ZM16.8891 9.11095C15.8508 8.07268 14.4681 7.5 13 7.5V8.5C14.2029 8.5 15.3312 8.96732 16.1819 9.81805L16.8891 9.11095ZM18.5 13C18.5 11.5319 17.9273 10.1492 16.8891 9.11095L16.1819 9.81805C17.0327 10.6688 17.5 11.7971 17.5 13H18.5ZM17.2581 16.4816C18.0626 15.501 18.5 14.2824 18.5 13H17.5C17.5 14.0516 17.1424 15.046 16.4849 15.8474L17.2581 16.4816ZM13 16.5C12.0641 16.5 11.1868 16.1367 10.5251 15.4749L9.81795 16.1821C10.6672 17.0313 11.7989 17.5 13 17.5V16.5ZM15.4749 15.4749C14.8132 16.1367 13.9359 16.5 13 16.5V17.5C14.2011 17.5 15.3328 17.0313 16.1821 16.1821L15.4749 15.4749ZM16.5 13C16.5 13.9359 16.1367 14.8132 15.4749 15.4749L16.1821 16.1821C17.0313 15.3328 17.5 14.2011 17.5 13H16.5ZM15.4749 10.5251C16.1367 11.1868 16.5 12.0641 16.5 13H17.5C17.5 11.7989 17.0313 10.6672 16.1821 9.81795L15.4749 10.5251ZM13 9.5C13.9359 9.5 14.8132 9.86334 15.4749 10.5251L16.1821 9.81795C15.3328 8.96866 14.2011 8.5 13 8.5V9.5ZM10.5251 10.5251C11.1868 9.86334 12.0641 9.5 13 9.5V8.5C11.7989 8.5 10.6672 8.96866 9.81795 9.81795L10.5251 10.5251ZM9.5 13C9.5 12.0641 9.86334 11.1868 10.5251 10.5251L9.81795 9.81795C8.96866 10.6672 8.5 11.7989 8.5 13H9.5ZM10.5251 15.4749C9.86334 14.8132 9.5 13.9359 9.5 13H8.5C8.5 14.2011 8.96866 15.3328 9.81795 16.1821L10.5251 15.4749Z" fill="white"></path>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    
                    	<div class="slideshow-container">

							<div class="mySlides fade">
							  <img src="img/mainBanner1.png" style="width:100%">
							</div>
							
							<div class="mySlides fade">
							  <img src="img/mainBanner2.png" style="width:100%">
							</div>
							
							<div class="mySlides fade">
							  <img src="img/mainBanner3.png" style="width:100%">
							</div>
							
							</div>
							<br>
							
							<div style="text-align:center">
							  <span class="dot"></span> 
							  <span class="dot"></span> 
							  <span class="dot"></span> 
							</div>
							
							
					
					
                    <div class="category-info">
                        <h1 style="width: 388px; height: 28px; font-size: 20px;">관심있는 운동을 선택해보세요.</h1>

                    </div>

                    <div class="category-box">

                        <nav display: block>
                            <ol class="category-box-ol">
                                <li class="category-item">
                                    <div>
                                        <a href=""></a>
                                            <img src="img/fitness.png" alt="헬스장" width="40" class="menu-category">
                                            <span type="caption2" color="#000000" class="menu-text">헬스장</span>
                                    </div>
                                </li>    
                                <li class="category-item">
                                    <div>
                                        <a href=""></a>
                                            <img src="img/swim.png" alt="수영" width="40" class="menu-category">
                                            <span type="caption2" color="#000000" class="menu-text">수영</span>
                                    </div>
                                </li>    
                                <li class="category-item">
                                    <div>
                                        <a href=""></a>
                                            <img src="img/flexibility.png" alt="필라테스" width="40" class="menu-category">
                                            <span type="caption2" color="#000000" class="menu-text">자세교정</span>
                                    </div>
                                </li>   
                                <li class="category-item">
                                    <div>
                                        <a href=""></a>
                                            <img src="img/crossfit.png" alt="크로스핏" width="40" class="menu-category">
                                            <span type="caption2" color="#000000" class="menu-text">크로스핏</span>
                                    </div>
                                </li>   
                                <li class="category-item">
                                    <div>
                                        <a href=""></a>
                                            <img src="img/racket.png" alt="라켓스포츠" width="40" class="menu-category">
                                            <span type="caption2" color="#000000" class="menu-text">라켓스포츠</span>
                                    </div>
                                </li> 
                                <li class="category-item">
                                    <div>
                                        <a href=""></a>
                                            <img src="img/climb.png" alt="클라이밍" width="40" class="menu-category">
                                            <span type="caption2" color="#000000" class="menu-text">클라이밍</span>
                                    </div>
                                </li> 
                                <li class="category-item">
                                    <div>
                                        <a href=""></a>
                                            <img src="img/mudo.png" alt="무도장" width="40" class="menu-category">
                                            <span type="caption2" color="#000000" class="menu-text">무도장</span>
                                    </div>
                                </li> 
                                <li class="category-item">
                                    <div>
                                        <a href=""></a>
                                            <img src="img/golf.png" alt="골프" width="40" class="menu-category">
                                            <span type="caption2" color="#000000" class="menu-text">골프</span>
                                    </div>
                                </li> 

                            </ol>

                        </nav>

                    </div>


                    <div class="mapbox">
                        <div class="map"></div>
                    </div>


                    <div class="communityframe">
                        <div class="communitybox">
                            <div class="communitybox-intro">

                                <h2 style="float: left;">커뮤니티</h2>
                                <div class="seeall-arrow">

                                </div>
                                <div class="seeall">
                                    <a href="">전체보기</a>
                                </div>

                            </div>
                            <ul class="communitybox-contents">
                                <li class="communitybox-content">
                                    <img src="" alt="" class="communitybox-content-img">
                                    <p class="communitybox-content-title">헬스장 추천</p>
                                    <h3 class="communitybox-content-detail">지역 헬스장 추천 받아가세요</h3>
                                </li>
                                <li class="communitybox-content"></li>
                                <li class="communitybox-content"></li>
                                <li class="communitybox-content"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div id="footer">
                    <h1>FriendsFit</h1>
                    피트니스크루<br>
                    팀장 김대현: ysm691611@naver.com<br>
                    변지협 오주현 류혜림 염다영<br>
                    인공지능사관학교<br>
                    @all rights reserved
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
    
    <script type="text/javascript" src="js/mainBanner.js"></script>
</body>
</html>