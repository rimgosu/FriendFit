<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JoinPage</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/join.css">
</head>
<body>
	<!-- whole body -->
	
	<div id="whole">
	   	 <div id="mainframe">
	            <div id="main-content">
	                <div id="header">
	                    <div class="top-header">
	                        <img src="img/FFlogo.png" alt="friendsfit-logo" style="cursor:pointer" onclick="location.href='main.jsp'">
	                    </div>
	                </div>
	                
	                <!-- join form -->
	                <div class="joinwrap">
	                	<form id="joinForm" name="joinForm" action="" method="post" target="_self" enctype="multipart/form-data">
		                <div class="titleArea">
	    					<h2>회원 가입</h2>
						</div>
						<hr class="line">
						
						<!-- NOT NULL  -->
						
						<h3 class="basic">기본정보</h3>
						<p class="required ">
							<img src="img/ico_required_red.jpg" alt="필수"> 필수입력사항
						</p>
						
						<div class="ec-base-table typeWrite">
					        <table border="1" summary="">
								<caption>회원 기본정보</caption>
					        <colgroup>
								<col style="width:150px;">
								<col style="width:auto;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">
									아이디 
									<img src="img/ico_required_red.jpg" alt="필수">
									</th>
					                <td>
					                	<input id="member_id" name="member_id" fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> 
					                	<span id="idMsg"></span> 
					                	(영문소문자/숫자, 4~16자)
					                </td>
					            </tr>
								<tr>
									<th scope="row">
										비밀번호 
										<img src="img/ico_required_red.jpg" alt="필수">
									</th>
					                <td>
					                    <div class="eTooltip">
					                        <input id="passwd" name="passwd" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16" 0="disabled" value="" type="password">                        
					                        <div class="ec-base-tooltip typeUpper">
					                            <div class="content">
					                                <strong class="txtWarn">※ 비밀번호 입력 조건</strong>
					                                <ul class="ec-base-help typeDash gBlank10 txtWarn">
					                					- 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자<br>
					                					- 입력 가능 특수문자 <br>
					                					&nbsp;&nbsp;&nbsp;  ~ ` ! @ # $ % ^ ( ) * _ - = { } [ ] | ; : &lt; &gt; , . ? /<br>
										                - 공백 입력 불가능 <br>
										                - 연속된 문자, 숫자 사용 불가능 <br>
										                - 동일한 문자, 숫자를 반복해서 사용 불가능 <br>
										                - 아이디 포함 불가능                                
										            </ul>
												</div>
					                            <a href="#none" class="btnClose" tabindex="-1">
					                            	<img src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif" alt="닫기">
					                            </a>
					                            <span class="edge"></span>
					                        </div>
					                    </div>
					                    (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)                
					                 </td>
					            </tr>
								<tr>
									<th scope="row">
										비밀번호 확인 
										<img src="img/ico_required_red.jpg" alt="필수">
									</th>
					                <td>
					                	<input id="user_passwd_confirm" name="user_passwd_confirm" fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" 0="disabled" value="" type="password"> 
					                	<span id="pwConfirmMsg"></span> 
					                </td>
					            </tr>
								<tr>
									<th scope="row" id="nameTitle">
										이름 
										<img src="img/ico_required_red.jpg" alt="필수">
									</th>
					                <td>
					                	<input id="name_id" name="name_id" fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity" fw-label="이름" fw-msg="" class="inputTypeText" placeholder="" value="" type="text">
					                    <span id="nameContents"></span>
					                </td>
					            </tr>
					
								<tr class="">
									<th scope="row">
									주소 
									<img src="img/ico_required_red.jpg" alt="필수">
									</th>
					                <td>
					                    <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="" type="text">                    
					                    <a href="#none" class="btnNormal" onclick="" id="postBtn">우편번호
					                    </a>
					                    <br>
					                    <input id="addr1" name="addr1" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"> 
					                    기본주소
					                    <br>
					                    <input id="addr2" name="addr2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> 
					                    나머지주소 (선택입력가능)                
					                </td>
					            </tr>
					           </tbody>
					          </table>
					</div>
					<h3 class=" ">추가정보</h3>
					<div class="ec-base-table typeWrite ">
						<table border="1" summary>
							<caption>회원 추가정보</caption>
							<colgroup>
								<col style="width:150px;">
								<col style="width:auto;">
							</colgroup>
							<tbody>
								<tr class="">
									<th scope="row">
										나이
									</th>
									<td>
									<input id="birth" name="birth" fw-filter="" fw-label="나이" fw-msg="" class="inputTypeNum" placeholder="" maxlength="4" value="" type="number">
										세
									</td>
								</tr>
								<tr class="">
									<th scope="row">
										연락처
									</th>
									<td>
										<select id="mobile1" name="mobile[]" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="044">044</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
											<option value="0502">0502</option>
											<option value="0503">0503</option>
											<option value="0504">0504</option>
											<option value="0505">0505</option>
											<option value="0506">0506</option>
											<option value="0507">0507</option>
											<option value="0508">0508</option>
											<option value="070">070</option>
										</select>
											-
											<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text">
											-
											<input id="mobile3" name="mobile[]" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text">
									</td>
								</tr>
								<tr class="">
									<th scope="row">
										운동경력
									</th>
									<td>
										<select id="career" name="career" fw-filter fw-label="운동경력" fw-msg>
											<option value selected="selected">선택</option>
											<option value="career_01">입문</option>
											<option value="career_02">초급</option>
											<option value="career_03">중급</option>
											<option value="career_04">고급</option>
											<option value="career_05">전문가</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="ec-base-button">
        				<a href="#none" class="btnSubmitFix sizeM" onclick="memberJoinAction()">회원가입</a>
    				</div>
					</form>
				</div>
		</div>
	</div>	               
	</div>
	
</body>
</html>