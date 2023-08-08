<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="css/style.css">
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
                </div>
                <main id="screenmain" class="screen-main">
                    <div class="SignInPageTemplate">
                        <h1 class="SignInPageTemplate-1">여러분을 위한 운동 메이트! 프렌즈핏에 오신 것을 <br>환영합니다!
                        </h1>
                    </div>
                    
                                <script src="https://developers.kakao.com/sdk/js/kakao.js" class="kakao"></script>
                            
                                <ul>
                                    <li onclick="kakaoLogin();">
                                      <a href="javascript:void(0)">
                                          <span>카카오 로그인</span>
                                      </a>
                                    </li>
                                    <li onclick="kakaoLogout();">
                                      <a href="javascript:void(0)">
                                          <span>카카오 로그아웃</span>
                                      </a>
                                    </li>
                                </ul>

                                <script>
                                    window.Kakao.init("4c4893e98bd1cc08244a52feeaf116cf");

                                    function kakaoLogin(){
                                        window.Kakao.Auth.login({
                                            scope:'profile_nickname, profile_image, account_email, gender',
                                            success: function(authObj){
                                                console.log(authObj);
                                                window.Kakao.API.request({
                                                    url:'/v2/user/me',
                                                    success: res => {
                                                        const kakao_account = res.kakao_account;
                                                        console.log(kakao_account);
                                                        
                                                    }
                                                });
                                            }
                                        });

                                    }

                                    function kakaoLogout() {
                                        if (Kakao.Auth.getAccessToken()) {
                                        Kakao.API.request({
                                            url: '/v1/user/unlink',
                                            success: function (authObj) {
                                                console.log(authObj)
                                            },
                                            fail: function (error) {
                                            console.log(error)
                                            },
                                        })
                                        Kakao.Auth.setAccessToken(undefined)
                                        }
                                    }
                                    
                                </script>
                        </main>
                        </div>
                        
                    </div>
                
            </div>
    
    
    
</body>
</html>