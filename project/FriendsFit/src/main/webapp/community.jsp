<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.communityDTO"%>
<%@page import="com.model.dbDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FriendsFit</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/slideStyle.css">
<link rel="stylesheet" href="css/community.css">

</head>
<body>
	<%
	int pageNum = 0;
	if (request.getParameter("pageNum") == null) {
		pageNum = 1;
	} else {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	// category get
	String category = request.getParameter("category");
	
	dbDAO dbdao = new dbDAO();
	ArrayList<communityDTO> cdto = new ArrayList<communityDTO>();
	if (category == null) {
		cdto = dbdao.getCommunities_pagingUpdated(pageNum);
	} else {
		cdto = dbdao.getCommunities_pagingUpdated_categoryUpdated(pageNum, category);
	}

	
	
	// 로그인
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
							<button class="GlobalHeader__StyledButton">
								<img src="img/userimage.png" alt="user profile"
									class="userprofile" style="cursor: pointer"
									onclick="location.href='mypage.jsp'">
							</button>
						</div>
						<%
						}
						%>
					</div>
				</div>

				<div data-testid="category-list"
					class="CommunityListTemplate__StyledCategoryList-sc-1n95qdm-2 iiYVWr">
					<div role="listitem"
						class="CommunityListTemplate__StyledCategoryListItem-sc-1n95qdm-3 ZKAsw">
						
						<div
							class="CommunityListTemplate__StyledCategoryItemIconWrapper-sc-1n95qdm-1 eEEovz">
							<a href="community.jsp?category=헬스장">
							<img src="img/fitness.png" width="36" height="36"
								viewBox="0 0 32 32" fill="none"></a>
							<g clip-path="url(#clip0_6980_61942)"> <g
								clip-path="url(#clip1_6980_61942)"> <path
								d="M8.28711 13.78L9.14044 10.5267C9.16229 10.4418 9.20607 10.3641 9.26739 10.3015C9.32872 10.2388 9.40543 10.1934 9.48985 10.1698C9.57426 10.1462 9.66342 10.1451 9.74835 10.1668C9.83329 10.1885 9.91102 10.2321 9.97377 10.2933L13.3071 13.5333L10.8071 15.7733L8.28711 13.78Z"
								fill="#DB9F44"></path> <path
								d="M23.7065 13.78L22.8532 10.5267C22.8313 10.4418 22.7876 10.3641 22.7262 10.3015C22.6649 10.2388 22.5882 10.1934 22.5038 10.1698C22.4194 10.1462 22.3302 10.1451 22.2453 10.1668C22.1603 10.1885 22.0826 10.2321 22.0199 10.2933L18.6865 13.5333L21.1865 15.7733L23.7065 13.78Z"
								fill="#DB9F44"></path> <path
								d="M25.9998 22.6267L27.6998 10.18L20.8931 14.0867L15.9998 6.42667L11.1065 14.0867L4.2998 10.18L6.00647 22.6267C9.15041 24.0416 12.5588 24.7732 16.0065 24.7732C19.4541 24.7732 22.8625 24.0416 26.0065 22.6267H25.9998Z"
								fill="#FFDA82"></path> <path
								d="M16.0004 21.6333C17.2449 21.6333 18.2537 20.6245 18.2537 19.38C18.2537 18.1355 17.2449 17.1267 16.0004 17.1267C14.7559 17.1267 13.7471 18.1355 13.7471 19.38C13.7471 20.6245 14.7559 21.6333 16.0004 21.6333Z"
								fill="#FF8952"></path> <path
								d="M4.29962 11.5267C5.04705 11.5267 5.65296 10.9208 5.65296 10.1733C5.65296 9.42592 5.04705 8.82001 4.29962 8.82001C3.5522 8.82001 2.94629 9.42592 2.94629 10.1733C2.94629 10.9208 3.5522 11.5267 4.29962 11.5267Z"
								fill="#FCC963"></path> <path
								d="M27.7002 11.5333C28.4439 11.5333 29.0469 10.9304 29.0469 10.1867C29.0469 9.44292 28.4439 8.84 27.7002 8.84C26.9564 8.84 26.3535 9.44292 26.3535 10.1867C26.3535 10.9304 26.9564 11.5333 27.7002 11.5333Z"
								fill="#FCC963"></path> <path
								d="M15.9998 7.78C16.7472 7.78 17.3532 7.17409 17.3532 6.42667C17.3532 5.67924 16.7472 5.07333 15.9998 5.07333C15.2524 5.07333 14.6465 5.67924 14.6465 6.42667C14.6465 7.17409 15.2524 7.78 15.9998 7.78Z"
								fill="#FCC963"></path> <path
								d="M25.7064 24.8933C22.6376 26.229 19.3266 26.9183 15.9797 26.9183C12.6328 26.9183 9.32185 26.229 6.25304 24.8933C6.17249 24.8569 6.10432 24.7978 6.05694 24.7232C6.00956 24.6486 5.98504 24.5617 5.98638 24.4733V22.6267C9.13032 24.0416 12.5387 24.7732 15.9864 24.7732C19.434 24.7732 22.8424 24.0416 25.9864 22.6267V24.4733C25.9857 24.563 25.9589 24.6506 25.9091 24.7252C25.8594 24.7998 25.7889 24.8582 25.7064 24.8933V24.8933Z"
								fill="#FCC963"></path> <path
								d="M9.24689 19.8333C9.99431 19.8333 10.6002 19.2274 10.6002 18.48C10.6002 17.7326 9.99431 17.1267 9.24689 17.1267C8.49946 17.1267 7.89355 17.7326 7.89355 18.48C7.89355 19.2274 8.49946 19.8333 9.24689 19.8333Z"
								fill="#FF9E6E"></path> <path
								d="M22.7537 19.8333C23.5012 19.8333 24.1071 19.2274 24.1071 18.48C24.1071 17.7326 23.5012 17.1267 22.7537 17.1267C22.0063 17.1267 21.4004 17.7326 21.4004 18.48C21.4004 19.2274 22.0063 19.8333 22.7537 19.8333Z"
								fill="#FF9E6E"></path></g></g>
							<defs> <clipPath id="clip0_6980_61942"> <rect
								width="32" height="32" fill="white"></rect></clipPath> <clipPath
								id="clip1_6980_61942"> <rect width="32" height="32"
								fill="white"></rect></clipPath></defs>
						</div>
						<p
							class="CommunityListTemplate__StyledCategoryItemLabel-sc-1n95qdm-4 hwgbOK">헬스장</p>
					</div>
					<div role="listitem"
						class="CommunityListTemplate__StyledCategoryListItem-sc-1n95qdm-3 ZKAsw">
						<div
							class="CommunityListTemplate__StyledCategoryItemIconWrapper-sc-1n95qdm-1 eEEovz">
							<a href="community.jsp?category=수영">
							<img src="img/swim.png" width="36" height="36"
								viewBox="0 0 32 32" fill="none"></a>
							<g clip-path="url(#clip0_2959_48320)"> <path
								d="M33 9H15C11.6863 9 9 11.6863 9 15V33C9 36.3137 11.6863 39 15 39H33C36.3137 39 39 36.3137 39 33V15C39 11.6863 36.3137 9 33 9Z"
								fill="#80C4A5"></path> <path
								d="M33 21.5H26.5V15H21.5V21.5H15V26.5H21.5V33H26.5V26.5H33V21.5Z"
								fill="white"></path></g>
							<defs> <clipPath id="clip0_2959_48320"> <rect
								width="48" height="48" fill="white"></rect></clipPath></defs>
							</svg>
						</div>
						<p
							class="CommunityListTemplate__StyledCategoryItemLabel-sc-1n95qdm-4 hwgbOK">수영</p>
					</div>
					<div role="listitem"
						class="CommunityListTemplate__StyledCategoryListItem-sc-1n95qdm-3 ZKAsw">
						<div
							class="CommunityListTemplate__StyledCategoryItemIconWrapper-sc-1n95qdm-1 eEEovz">
							<a href="community.jsp?category=자세교정">
							<img src="img/flexibility.png" width="36" height="36"
								viewBox="0 0 32 32" fill="none"></a>
							<g clip-path="url(#clip0_2959_48323)"> <path
								d="M12.7794 36.2831L11.7188 35.2224L6.0619 40.8793L7.12256 41.9399L12.7794 36.2831Z"
								fill="#666666"></path> <path
								d="M36.6377 20.552L27.4453 11.3596L10.4748 28.3302L19.6671 37.5226L36.6377 20.552Z"
								fill="#ACDAE6"></path> <path
								d="M41.9464 15.9537L32.0469 6.0542L30.6327 7.46841L40.5322 17.3679L41.9464 15.9537Z"
								fill="#ACDAE6"></path> <path
								d="M38.4108 15.2518L32.7539 9.59497L29.2184 13.1305L34.8752 18.7874L38.4108 15.2518Z"
								fill="#85BECC"></path> <path
								d="M12.25 30.095L17.9069 35.7518L17.1997 36.4589C15.637 38.0216 13.1056 38.0216 11.5429 36.4589C9.98019 34.8962 9.98019 32.3648 11.5429 30.8021L12.25 30.095Z"
								fill="#85BECC"></path> <path
								d="M15.5997 23.2089L14.5391 24.2695L18.7817 28.5122L19.8424 27.4515L15.5997 23.2089Z"
								fill="white"></path> <path
								d="M19.4903 19.3178L18.4297 20.3784L22.6723 24.6211L23.733 23.5604L19.4903 19.3178Z"
								fill="white"></path> <path
								d="M23.381 15.4264L22.3203 16.4871L26.563 20.7297L27.6236 19.669L23.381 15.4264Z"
								fill="white"></path></g>
							<defs> <clipPath id="clip0_2959_48323"> <rect
								width="48" height="48" fill="white"></rect></clipPath></defs>
							</svg>
						</div>
						<p
							class="CommunityListTemplate__StyledCategoryItemLabel-sc-1n95qdm-4 hwgbOK">자세교정</p>
					</div>
					<div role="listitem"
						class="CommunityListTemplate__StyledCategoryListItem-sc-1n95qdm-3 ZKAsw">
						<div
							class="CommunityListTemplate__StyledCategoryItemIconWrapper-sc-1n95qdm-1 eEEovz">
							<a href="community.jsp?category=크로스핏">
							<img src="img/crossfit.png" width="36" height="36"
								viewBox="0 0 32 32" fill="none"></a>
							<g clip-path="url(#clip0_6987_62630)"> <g
								clip-path="url(#clip1_6987_62630)"> <path
								d="M19.1396 17.3467C20.7339 17.3467 22.0263 16.0543 22.0263 14.46C22.0263 12.8658 20.7339 11.5734 19.1396 11.5734C17.5453 11.5734 16.2529 12.8658 16.2529 14.46C16.2529 16.0543 17.5453 17.3467 19.1396 17.3467Z"
								fill="#666666"></path> <path
								d="M22.2636 11.2275C22.4393 10.3991 22.0385 9.61235 21.3686 9.47032C20.6987 9.32829 20.0132 9.88472 19.8375 10.7131C19.6619 11.5416 20.0626 12.3283 20.7326 12.4703C21.4025 12.6123 22.088 12.0559 22.2636 11.2275Z"
								fill="#FFDBC7"></path> <path
								d="M11.2612 12.481C11.9311 12.3389 12.3318 11.5522 12.1562 10.7238C11.9806 9.89538 11.2951 9.33895 10.6251 9.48098C9.95521 9.62302 9.55449 10.4097 9.73012 11.2382C9.90576 12.0666 10.5912 12.623 11.2612 12.481Z"
								fill="#FFDBC7"></path> <path
								d="M27.1337 28.2467H4.86035V25.5801C4.86035 24.6348 5.04663 23.6989 5.40855 22.8257C5.77046 21.9526 6.30092 21.1593 6.96958 20.4912C7.63825 19.8232 8.43203 19.2935 9.30553 18.9324C10.179 18.5713 11.1151 18.3858 12.0603 18.3867H13.7737L16.0003 24.0067L18.227 18.44H19.9404C21.8447 18.44 23.6713 19.1952 25.0197 20.5398C26.3682 21.8845 27.1284 23.7091 27.1337 25.6134V28.2467Z"
								fill="#A6DEC5"></path> <path
								d="M18.2268 15.3H13.7734V18.6667H18.2268V15.3Z" fill="#FFDBC7"></path>
							<path
								d="M18.2268 18.6666H13.7734L16.0001 23.9866L18.2268 18.6666Z"
								fill="#FFDBC7"></path> <path
								d="M23.1396 24.0867H21.973V22.92H20.3063V24.0867H19.1396V25.7534H20.3063V26.92H21.973V25.7534H23.1396V24.0867Z"
								fill="#66AF8C"></path> <path
								d="M20.46 11.34C20.9058 10.3034 21.0647 9.16587 20.92 8.0467C20.7574 6.85669 20.1696 5.76572 19.2653 4.97533C18.3609 4.18494 17.2011 3.74853 16 3.7467C14.7996 3.7469 13.6398 4.18189 12.7353 4.97118C11.8308 5.76048 11.2428 6.85066 11.08 8.04004C10.928 9.14634 11.0306 10.2728 11.38 11.3334"
								fill="#666666"></path> <path
								d="M15.9199 4.85339C14.7159 4.85339 13.5611 5.33171 12.7097 6.18313C11.8583 7.03454 11.3799 8.18931 11.3799 9.39339V11.5801C11.3757 12.5429 11.5852 13.4947 11.9933 14.3667C12.2962 15.1597 12.8351 15.8406 13.5373 16.3175C14.2395 16.7943 15.0712 17.0442 15.9199 17.0334C16.7687 17.0442 17.6004 16.7943 18.3026 16.3175C19.0048 15.8406 19.5437 15.1597 19.8466 14.3667C20.2547 13.4947 20.4642 12.5429 20.4599 11.5801V9.39339C20.4599 8.18931 19.9816 7.03454 19.1302 6.18313C18.2788 5.33171 17.124 4.85339 15.9199 4.85339Z"
								fill="#FFDBC7"></path> <path
								d="M11.0663 9.90671C10.9807 9.29707 10.9673 8.67948 11.0263 8.0667C11.2016 6.87088 11.7998 5.77752 12.7123 4.98493C13.6247 4.19235 14.791 3.75305 15.9996 3.7467C17.1997 3.7483 18.3587 4.18378 19.2629 4.97282C20.1671 5.76186 20.7555 6.85124 20.9196 8.04004C20.977 8.56737 20.977 9.09937 20.9196 9.6267L20.4463 10.0667C18.0539 9.01986 15.7808 7.71907 13.6663 6.18671C13.6663 6.18671 13.1529 8.91337 11.3663 9.90004L11.0663 9.90671Z"
								fill="#666666"></path></g></g>
							<defs> <clipPath id="clip0_6987_62630"> <rect
								width="32" height="32" fill="white"></rect></clipPath> <clipPath
								id="clip1_6987_62630"> <rect width="32" height="32"
								fill="white"></rect></clipPath></defs>
							</svg>
						</div>
						<p
							class="CommunityListTemplate__StyledCategoryItemLabel-sc-1n95qdm-4 hwgbOK">크로스핏</p>
					</div>
					<div role="listitem"
						class="CommunityListTemplate__StyledCategoryListItem-sc-1n95qdm-3 ZKAsw">
						<div
							class="CommunityListTemplate__StyledCategoryItemIconWrapper-sc-1n95qdm-1 eEEovz">
							<a href="community.jsp?category=라켓스포츠">
							<img src="img/racket.png" width="36" height="36"
								viewBox="0 0 32 32" fill="none"></a>
							<g clip-path="url(#clip0_6987_62638)"> <g
								clip-path="url(#clip1_6987_62638)"> <path
								d="M11.4002 14.1867C13.359 14.1867 14.9468 12.5988 14.9468 10.6401C14.9468 8.68128 13.359 7.09338 11.4002 7.09338C9.44141 7.09338 7.85352 8.68128 7.85352 10.6401C7.85352 12.5988 9.44141 14.1867 11.4002 14.1867Z"
								fill="#FF8952"></path> <path
								d="M4.33342 22.6733C4.26775 22.6735 4.20274 22.6601 4.14254 22.6338C4.08234 22.6076 4.02827 22.5691 3.98375 22.5208C3.93923 22.4725 3.90525 22.4155 3.88396 22.3534C3.86267 22.2913 3.85454 22.2254 3.86009 22.1599C3.99017 20.2486 4.84102 18.458 6.24067 17.1499C7.64031 15.8418 9.48436 15.1139 11.4001 15.1133C13.317 15.1122 15.1627 15.8394 16.5637 17.1476C17.9648 18.4559 18.8166 20.2475 18.9467 22.1599C18.9503 22.225 18.9408 22.29 18.9188 22.3513C18.8968 22.4126 18.8627 22.4688 18.8186 22.5167C18.7745 22.5645 18.7212 22.6031 18.6619 22.63C18.6026 22.6569 18.5385 22.6716 18.4734 22.6733H4.33342Z"
								fill="#FF8952"></path> <path
								d="M20.6004 16.4C22.5591 16.4 24.147 14.8121 24.147 12.8533C24.147 10.8945 22.5591 9.30664 20.6004 9.30664C18.6416 9.30664 17.0537 10.8945 17.0537 12.8533C17.0537 14.8121 18.6416 16.4 20.6004 16.4Z"
								fill="#FFDA82"></path> <path
								d="M13.5329 24.9066C13.4667 24.9059 13.4013 24.8916 13.3407 24.8647C13.2802 24.8378 13.2258 24.7988 13.1808 24.7501C13.1359 24.7014 13.1014 24.6441 13.0794 24.5816C13.0574 24.5191 13.0484 24.4527 13.0529 24.3866C13.1846 22.4747 14.0369 20.684 15.4376 19.3761C16.8383 18.0682 18.6831 17.3405 20.5996 17.34C22.5142 17.3405 24.3574 18.0675 25.7569 19.3742C27.1563 20.6808 28.0079 22.4698 28.1396 24.38C28.1451 24.4457 28.137 24.5119 28.1157 24.5744C28.0945 24.6369 28.0606 24.6943 28.0162 24.7431C27.9718 24.7919 27.9178 24.831 27.8576 24.858C27.7974 24.885 27.7322 24.8993 27.6662 24.9L13.5329 24.9066Z"
								fill="#FFDA82"></path></g></g>
							<defs> <clipPath id="clip0_6987_62638"> <rect
								width="32" height="32" fill="white"></rect></clipPath> <clipPath
								id="clip1_6987_62638"> <rect width="32" height="32"
								fill="white"></rect></clipPath></defs>
							</svg>
						</div>
						<p
							class="CommunityListTemplate__StyledCategoryItemLabel-sc-1n95qdm-4 hwgbOK">라켓스포츠</p>
					</div>
					<div role="listitem"
						class="CommunityListTemplate__StyledCategoryListItem-sc-1n95qdm-3 ZKAsw">
						<div
							class="CommunityListTemplate__StyledCategoryItemIconWrapper-sc-1n95qdm-1 eEEovz">
							<a href="community.jsp?category=클라이밍">
							<img src="img/climb.png" width="36" height="36"
								viewBox="0 0 32 32" fill="none"></a>
							<g clip-path="url(#clip0_6987_62642)"> <g
								clip-path="url(#clip1_6987_62642)"> <path
								d="M26.2894 14.015L5.60742 23.6592L6.44702 25.4597L27.129 15.8156L26.2894 14.015Z"
								fill="#666666"></path> <path
								d="M22.9138 7.92666L15.9738 11.16L10.6071 8.57333C10.4902 8.51457 10.3549 8.50399 10.2302 8.54388C10.1056 8.58376 10.0015 8.67092 9.94043 8.78665L8.6071 11.2667L11.9404 12.8733L11.5071 13.7667L8.1271 12.14L7.18044 13.9133L10.5138 15.52L10.0804 16.4133L6.7471 14.7933L5.80709 16.5533C5.22638 17.6407 4.90662 18.8483 4.87306 20.0805C4.83951 21.3128 5.09309 22.536 5.61376 23.6533L26.2804 14.0067L23.5604 8.16666C23.5054 8.0501 23.4069 7.95971 23.286 7.91486C23.1652 7.87 23.0315 7.87424 22.9138 7.92666Z"
								fill="#ACBAE6"></path></g></g>
							<defs> <clipPath id="clip0_6987_62642"> <rect
								width="32" height="32" fill="white"></rect></clipPath> <clipPath
								id="clip1_6987_62642"> <rect width="32" height="32"
								fill="white"></rect></clipPath></defs>
							</svg>
						</div>
						<p
							class="CommunityListTemplate__StyledCategoryItemLabel-sc-1n95qdm-4 hwgbOK">클라이밍</p>
					</div>
					<div role="listitem"
						class="CommunityListTemplate__StyledCategoryListItem-sc-1n95qdm-3 ZKAsw">
						<div
							class="CommunityListTemplate__StyledCategoryItemIconWrapper-sc-1n95qdm-1 eEEovz">
							<a href="community.jsp?category=무도장">
							<img src="img/mudo.png" width="36" height="36"
								viewBox="0 0 32 32" fill="none"></a>
							<path
								d="M15.9999 23.3333C21.3387 23.3333 25.6666 19.0054 25.6666 13.6667C25.6666 8.32791 21.3387 4 15.9999 4C10.6612 4 6.33325 8.32791 6.33325 13.6667C6.33325 19.0054 10.6612 23.3333 15.9999 23.3333Z"
								fill="#FFDA82"></path>
							<path d="M20.6666 20.6667H11.3333V23.3334H20.6666V20.6667Z"
								fill="#FFDA82"></path>
							<path d="M20.6666 23.3333H11.3333V25.3333H20.6666V23.3333Z"
								fill="#666666"></path>
							<path
								d="M11.3333 25.3333H20.6666C20.6666 26.8066 19.4733 28 17.9999 28H13.9999C12.5266 28 11.3333 26.8066 11.3333 25.3333Z"
								fill="#999999"></path>
							<path
								d="M20.1333 11.88C19.8066 11.5533 19.2799 11.5533 18.9532 11.88L16.0132 14.82L13.0466 11.8533C12.7199 11.5267 12.1932 11.5267 11.8666 11.8533C11.5399 12.18 11.5399 12.7067 11.8666 13.0333L15.1666 16.3333V23.3333H16.8332V16.36L20.1333 13.06C20.4599 12.7333 20.4599 12.2067 20.1333 11.88Z"
								fill="#FF8952"></path>
							</svg>
						</div>
						<p
							class="CommunityListTemplate__StyledCategoryItemLabel-sc-1n95qdm-4 hwgbOK">무도장</p>
					</div>
					<div role="listitem"
						class="CommunityListTemplate__StyledCategoryListItem-sc-1n95qdm-3 ZKAsw">
						<div
							class="CommunityListTemplate__StyledCategoryItemIconWrapper-sc-1n95qdm-1 eEEovz">
							<a href="community.jsp?category=골프">
							<img src="img/golf.png" width="36" height="36"
								viewBox="0 0 32 32" fill="none"></a>
							<g clip-path="url(#clip0_6987_62646)"> <g
								clip-path="url(#clip1_6987_62646)"> <path
								d="M8.66667 27.2466C8.22465 27.2466 7.80072 27.071 7.48816 26.7585C7.1756 26.4459 7.00001 26.022 7.00001 25.58V8.12662C6.99913 7.7426 7.07401 7.36218 7.22036 7.00714C7.36672 6.6521 7.58166 6.32941 7.8529 6.05756C8.12413 5.7857 8.44632 5.57002 8.80103 5.42286C9.15573 5.2757 9.53598 5.19995 9.92001 5.19995H22.3C22.4768 5.19995 22.6464 5.27019 22.7714 5.39521C22.8964 5.52024 22.9667 5.68981 22.9667 5.86662C22.9667 6.04343 22.8964 6.213 22.7714 6.33802C22.6464 6.46305 22.4768 6.53328 22.3 6.53328H10C9.64842 6.52665 9.30444 6.63603 9.02125 6.8445C8.73807 7.05298 8.53145 7.34894 8.43334 7.68663C8.36746 7.92047 8.35662 8.16639 8.40169 8.40512C8.44675 8.64385 8.54648 8.8689 8.69308 9.06263C8.83967 9.25637 9.02914 9.41352 9.24663 9.52178C9.46412 9.63004 9.70373 9.68646 9.94667 9.68663H24.6133C24.7318 9.68663 24.8454 9.73368 24.9292 9.81744C25.0129 9.90121 25.06 10.0148 25.06 10.1333V26.8C25.06 26.9184 25.0129 27.032 24.9292 27.1158C24.8454 27.1996 24.7318 27.2466 24.6133 27.2466H8.66667Z"
								fill="#FF8952"></path> <path
								d="M24.5533 9.69996H9.88664C9.65193 9.69909 9.42035 9.64594 9.20875 9.54436C8.99715 9.44278 8.81084 9.29535 8.66336 9.11275C8.51587 8.93015 8.41092 8.71699 8.35614 8.48876C8.30136 8.26052 8.29811 8.02294 8.34664 7.79329C8.43219 7.42455 8.64467 7.09762 8.94692 6.86972C9.24916 6.64182 9.62192 6.52745 9.99998 6.54663H22.3333L24.5533 9.69996Z"
								fill="#ECECEC"></path> <path
								d="M20.7338 9.03337H18.9338C18.8746 9.03249 18.8158 9.0434 18.7608 9.06545C18.7059 9.0875 18.6558 9.12026 18.6136 9.16182C18.5715 9.20339 18.538 9.25293 18.5151 9.30757C18.4922 9.3622 18.4805 9.42083 18.4805 9.48005V15.3734C18.4815 15.4133 18.493 15.4523 18.5139 15.4864C18.5348 15.5205 18.5644 15.5484 18.5996 15.5674C18.6348 15.5863 18.6744 15.5956 18.7144 15.5943C18.7543 15.5931 18.7932 15.5812 18.8271 15.56L20.7338 14.6267L22.6338 15.56C22.6677 15.5812 22.7066 15.5931 22.7466 15.5943C22.7865 15.5956 22.8261 15.5863 22.8613 15.5674C22.8965 15.5484 22.9261 15.5205 22.947 15.4864C22.9679 15.4523 22.9795 15.4133 22.9805 15.3734V9.48005C22.9805 9.42139 22.9689 9.3633 22.9465 9.30911C22.924 9.25492 22.8911 9.20568 22.8496 9.1642C22.8082 9.12273 22.7589 9.08983 22.7047 9.06738C22.6505 9.04493 22.5925 9.03337 22.5338 9.03337H20.7338Z"
								fill="#FFDA82"></path></g></g>
							<defs> <clipPath id="clip0_6987_62646"> <rect
								width="32" height="32" fill="white"></rect></clipPath> <clipPath
								id="clip1_6987_62646"> <rect width="32" height="32"
								fill="white"></rect></clipPath></defs>
							</svg>
						</div>
						<p
							class="CommunityListTemplate__StyledCategoryItemLabel-sc-1n95qdm-4 hwgbOK">골프</p>
					</div>

				</div>
				<div id="wrap">
					<div id="container" style="min-height: 955px; position: inherit;" >
						<div class="community-writebox" style="padding: 16px 26px 8px">

						</div>

						<div
							class="xans-element- xans-board xans-board-buttonlist btn_write">
							<a href="communityWrite.jsp" style="margin-right: 20px;">Write</a>
						</div>
						<div id="contents">
							<div class="contents_inner">

								<div id="boardtitleArea"
									class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
									<p>COMMUNITY</p>
								</div>

								<div
									class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 ">
									<div class="boardSort">
										<span
											class="xans-element- xans-board xans-board-replysort-4 xans-board-replysort xans-board-4 "></span>
									</div>
									<table class="board-table" border="1" summary="">
										<caption>게시판 목록</caption>
										<colgroup
											class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
											<col style="width: 12%;">
											<col style="width: 15%;">
											<col style="width: 20%;" class="displaynone">
											<col style="width: auto;">
										</colgroup>
										<tbody
											class="xans-element- xans-board xans-board-list-4 xans-board-list xans-board-4">
											<%
											for (int i = 0; i < cdto.size(); i++) {
											%>
											<tr class="xans-record-">
												<td class="number">
													<p></p><%=cdto.get(i).getCommuNum()%>
												</td>
												<td class="prd_img"><a
													href="communityView.jsp?commuNum=<%=cdto.get(i).getCommuNum()%>">
														<img src="img/userimage.png" border="0" alt="">
												</a></td>
												<td class="displaynone"></td>
												<td class="subject">
													<p></p>
													<p>
														<a
															href="communityView.jsp?commuNum=<%=cdto.get(i).getCommuNum()%>"
															class="sub"><%=cdto.get(i).getCommuTitle()%></a>
													</p>
													<div class="board_footer">
														<li><%=cdto.get(i).getMemberID()%></li>
														<li class=""><%=cdto.get(i).getCommuDay()%></li>
														<li class="">HIT : 23</li>
														<li class="displaynone">VOTE : 0</li>
													</div>
												</td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
									<p
										class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 empty displaynone ">등록된
										게시물이 없습니다.</p>
								</div>



								<div
									class="xans-element- xans-board xans-board-paging-4 xans-board-paging xans-board-4 ec-base-paginate typeList">

									<p class="prev">
										<a href="?board_no=4&amp;page=1"><span>PREV</span></a>
									</p>
									<ol style="padding: 0;">
										<li class="xans-record-"><a
											href="community.jsp?board_no=4&page=1" class="this">1</a></li>
										<li class="xans-record-"><a
											href="community.jsp?pageNum=2#11" class="other">2</a></li>
										<li class="xans-record-"><a
											href="community.jsp?pageNum=3#21" class="other">3</a></li>
										<li class="xans-record-"><a
											href="community.jsp?pageNum=4#31" class="other">4</a></li>
										<li class="xans-record-"><a
											href="community.jsp?pageNum=5#41" class="other">5</a></li>
									</ol>
									<p class="next">
										<a
											href="community.jsp?pageNum=<%=pageNum + 1%>#<%=pageNum * 10 + 1%>"><span>NEXT</span></a>
									</p>
								</div>



							</div>

						</div>
					</div>
				</div>




				<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
				<script src="js/bootstrap.js"></script>



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