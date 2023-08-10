<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/mypage.css">

</head>
<body>
   <%
      MemberDTO info = (MemberDTO)session.getAttribute("info");
   %>
   <div id="whole">
          <div id="mainframe">
            <div id="main-content">
                <div id="header">
                    <div class="top-header">
                        <img src="img/FFlogo.png" alt="friendsfit-logo" style="cursor:pointer" onclick="location.href='index.jsp'">
                         <!-- <h1>Our fit</h1> -->
                    </div>
                    <div class="GlobalHeader__StyledRightButtonGroup">
                          <button class="GlobalHeader__StyledButton">
                             <img src="img/userimage.png" alt="user profile" class="userprofile" style="cursor:pointer" onclick="location.href='mypage.jsp'">
                          </button>
                    </div>
                </div>
                <main id="screenmain" class="screen-main">
                
                   <div role="main" class="MyPageTemplate">
                      <div aria-label="breadcrumb-navigation">
                         <nav class="Breadcrumb__Nav">
                            <ol>
                               <li>
                                  <a href="index.jsp" aria-label="Navigation Link">
                                     <img width="15" height="15" src=img/home_menu.png>
                                  </a>
                               </li>
                               <li data-testid="breadcrumb_li_1">
                                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#bcbcbc">
                                     <g id="999_icon/general/action/arrowsmall/right">
                                        <path id="Fill 1 Copy" d="M9.97131 5.875L16.375 11.9996L9.97131 18.125L9.375 17.4884L15.1133 11.9996L9.375 6.51112L9.97131 5.875Z" fill="#4C4C4C" stroke="#4C4C4C" stroke-linejoin="round">
                                        </path>
                                     </g>
                                  </svg>
                                  <span type="caption2" color="#000000" class="Text__Container">
                                     <a href="/mypage" aria-label="Navigation Link">마이페이지</a>
                                  </span>
                               </li>
                            </ol>
                         </nav>
                      </div>
                      <div class="MyPageTemplate__StyledUserProfileWrapper">
                         <div aria-label="user-profile" class="UserProfile__StyledUserProfile">
                            <div role="grid" class="UserProfile__StyledImageWrapper">
                               <span style="box-sizing: border-box; display: inline-block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative; max-width: 100%;">
                                  <span style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; max-width: 100%;">
                                  <img alt="" aria-hidden="true" src="data:image/svg+xml,%3csvg%20xmlns=%27http://www.w3.org/2000/svg%27%20version=%271.1%27%20width=%2784%27%20height=%2784%27/%3e" style="display: block; max-width: 100%; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px;">
                                  </span>
                                  <img alt="profile image" src="https://image2.gnsister.com/images/member/profile/1513135488959_cf6bcccba43147a889d886411aedf554.png" decoding="async" data-nimg="intrinsic" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;">
                               </span>
                               <span aria-label="user-level" class="UserProfile__StyledLevel">
                               <%if((info.getYear()).equals("입문")) {%>
                                  1
                               <%} else if((info.getYear()).equals("초급")) {%>
                                  2
                               <%} else if((info.getYear()).equals("중급")) {%>   
                                  3
                               <%} else if((info.getYear()).equals("고급")) {%>
                                  4
                               <%} else if((info.getYear()).equals("전문가")) {%>
                                  5
                               <%} %>
                               </span>
                            </div>
                            <b aria-label="user-nickname" class="UserProfile__StyledNickname"><%=info.getName() %>님</b>
                            <button onclick="location.href='logout.jsp'" aria-label="sign-out-button" class="sign-out-button">로그아웃</button>
                         </div>
                         <button role="menuitem" class="MenuButtonWithArrowIcon__StyledButton">
                            <div>
                               <div aria-label="icon-in-menu-button" class="icon-in-menu-button">
                                  <svg width="42" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" role="presentation">
                                     <path d="m12 7.886 2.818-2.818A4.486 4.486 0 0 1 18 3.75H6c1.243 0 2.368.504 3.182 1.318L12 7.886Z" fill="#FFD267"></path>
                                     <path d="M21.182 11.432a4.5 4.5 0 0 0-6.364-6.364L12 7.886 9.182 5.068a4.5 4.5 0 0 0-6.364 6.364L12 20.25l9.182-8.818Z" fill="#FF540F"></path>
                                  </svg>
                               </div>
                            </div>
                            <div aria-label="menu-label" class="MenuButtonWithArrowIcon__StyledLabel">내 게시물</div>
                            <div aria-label="right-icon" class="MenuButtonWithArrowIcon__StyledRightIcon">
                               <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" role="presentation">
                                  <path d="M9.971 5.875 16.375 12l-6.404 6.125-.596-.637L15.113 12 9.375 6.51l.596-.636Z" fill="#4C4C4C" stroke="#4C4C4C" stroke-linejoin="round"></path>
                               </svg>
                            </div>
                         </button>
                      </div>
                      <div role="figure" class="MyPageTemplate__StyledImageBanner">
                         <div radius="8" aria-label="image-banner" class="ImageBanner__StyledContainer">
                            <div class="slick-slider slick-initialized">
                               <div class="slick-list">
                                  <div class="slick-track" style="width: 388px; opacity: 1; transform: translate3d(0px, 0px, 0px); transition: -webkit-transform 500ms ease 0s;">
                                     <div data-index="0" class="slick-slide slick-active slick-current" tabindex="-1" aria-hidden="false" style="outline: none; width: 388px;">
                                        <div>
                                           <div tabindex="-1" class="ImageBanner__StyledSliderItem" style="width: 100%; display: inline-block;">
                                              <img src="img/certified-banner.png" width="100%" height="auto" alt="Friendsfit main banner" class="ImageBanner__StyledImage-sc-1wit5oz-2 kjWgy" style="cursor:pointer" onclick="location.href='column.jsp'">
                                           </div>
                                        </div>
                                     </div>
                                  </div>
                               </div>
                            </div>
                         </div>
                      </div>
                   </div>
                 
                            
                            
                               

                               
                </main>
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