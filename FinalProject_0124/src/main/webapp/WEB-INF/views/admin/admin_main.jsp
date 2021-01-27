<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./css/admin/admin_main.css" />
<link rel="stylesheet" href="./css/tapmenu.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/base/jquery-ui.css" /> 
<title>모두의 레시피</title>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script> 
<script type="text/javascript" src="./js/jquery-ui.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
	//해야할 내용기술
	
		$('#dialog').dialog();
	/*
	 */
});
</script>
</head>
<body>

<div id=wrapper>
	<div id="main">
		<div class="inner">

			<!-- 상단 -->
 			<header id="header">
 				<div class="logo_wrap">
 					<p class="logo_p" >
						<a href="./main.do" class="logo"><img src="./images/logo/modoo_logo07.svg" alt="logo"/></a>
					</p>
				</div>
				
				<!-- <section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="재료명, 요리명" />
					</form>
				</section> -->
				
				<ul class="icons">
					<li><a href="./login.do"><span class="label">로그인</span></a></li>
					<li><a href="./recipe_write.do"><span class="label">레시피 등록</span></a></li>
					<li><a href="./admin_main.do"><span class="label">관리자</span></a></li>
					<li><a href="#" class="icon"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon"><span class="label">Medium</span></a></li>
				</ul>
			</header>
			<!-- 상단 끝 -->
			
		
			<!-- 컨텐츠 -->
			
			<div id="dialog" tittle="관리자 입장">
				<p>관리자 페이지입니다</p>
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</div>
	
	
	<!-- 사이드바/푸터 -->
	<div id="sidebar_1">
		<div class="inner">

		
			<!-- 카테고리(Menu) -->
			<nav id="menu" style="border-bottom:0;">
				<header class="major">
					<h2>관리자 모드</h2>
				</header>
				
				<ul>	
					<li><a href="./admin_main.do">관리자 메인</a></li>					
									
					<li><a href="./admin_member.do">회원관리</a></li>
				
					<li><a href="./admin_recipe.do">레시피 관리</a></li>
					
					<li><a href="./admin_review.do">후기관리 </a></li>
				</ul>
				
			</nav>
			<!-- 카테고리 끝 -->

			

			<!-- 푸터 -->
			<footer id="footer">
				<p class="copyright">&copy; Copyright 모두의 레시피. All Rights Reserved </p>
			</footer>
			<!-- 푸터 끝 -->
		</div>
	</div>
	
	
</div>
</body>

<!-- 자바스크립트 -->
<!-- <script src="./js/jquery.min.js"></script> -->
<script src="./js/skel.min.js"></script>
<script src="./js/util.js"></script>
<script src="./js/main.js"></script>
<script src="./js/bootstrap.min.js"></script>
<!-- 자바스크립트 -->

</html>