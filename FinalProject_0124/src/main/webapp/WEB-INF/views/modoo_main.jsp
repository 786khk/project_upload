<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String login_id = "";
 	String login_state = "";
 	String mypage = "";
 	StringBuffer login_user = new StringBuffer();
	   
	if(session.getAttribute("id")!=null && !session.getAttribute("id").equals(request.getRemoteAddr())){
		 String id = (String) session.getAttribute("id");
		 login_user.append("<li id='drop_nav' class='wrapper-dropdown-5'><a style='padding-right:20px'>" + id + "님</a>");
		 login_user.append("	<ul class='dropdown'>");
		 login_user.append("		<li><a href='./mypage_public.do'><span class='label'>마이페이지</span></a></li>");	
		 login_user.append("		<li><a href='./user_modify.do'><i class='icon-remove'></i>회원정보수정</a></li>");
		 login_user.append(login_state = "<li><a href='./logout.do'><span class='label'>로그아웃</span></a></li>");
		 login_user.append("	</ul>");
		 login_user.append("</li>");
		 login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
		/*  login_user.append("<li><a href='./admin_main.do'><span class='label'>관리자</span></a></li>"); */
	//관리자 세션
	}else{
		 login_user.append("<li><a href='./login.do'><span class='label'>로그인</span></a></li>");
		 login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
		 login_user.append("<li><a href='./admin_main.do'><span class='label'>관리자</span></a></li>");
		//login_state = "<a href='./login.do'><span class='label'>로그인</span></a>";
	}
 
	String isFirst = "false";

	if (session.getAttribute("rcList") == null) {
		isFirst = "true";
	
	
	
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>모두의 레시피</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/modoo/top_button.css" />
<link rel="stylesheet" href="./css/modoo/drop_nav.css" />
<style type="text/css">
.jb-box { width: 100%; height: 400px; overflow: hidden;margin: 0px auto; position: relative; }
video { width: 100%; vertical-align: middle;}
.jb-text { position: absolute; top: 30%; width: 100%; }
.jb-text p { margin-top: -24px; text-align: center; font-size: 43px; color: #ffffff; }

/* .modoo_thumbnail{width:100%;} */
</style>

</head>
<body>
<!-- Wrapper -->
<div id="wrapper">

	<!-- 메인 -->
	<div id="main">
		<div class="inner">
			<!-- 상단 -->
 			<header id="header">
 				<div class="logo_wrap">
 					<p class="logo_p" >
						<a href="./main.do" class="logo"><img src="./images/logo/modoo_logo07.svg" alt="logo"/></a>
					</p>
				</div>
				
				<!-- 검색 -->
				<section id="search" class="alt">
					<form method="post" action="#"><input type="text" name="query" id="query" placeholder="재료명, 요리명" /></form>
				</section>
				<!-- 검색 -->
				
				<ul class="icons">
					<%=login_user %>
					<%-- <li id="drop_nav" class="wrapper-dropdown-5"><%=login_id %>
						<ul class="dropdown">
							<li><a href="./mypage_public.do"><span class="label">마이페이지</span></a></li>
							<li><%=login_state %></li>
							<li><a href="#"><i class="icon-remove"></i>메뉴</a></li>
						</ul>
					</li>
					<li><a href="./recipe_write.do"><span class="label">레시피 등록</span></a></li>
					<li><a href="./admin.do"><span class="label">관리자</span></a></li> --%>
				</ul>
			</header>
			<!-- 상단 끝 -->
			
			<!-- Banner -->
			<section style="border-bottom:none;padding-top:0em;">
				<div class="jb-box">
					<span class="image main">
					<video autoplay controls loop muted poster="aaa" preload="bbb">
						<source src="./video/video.mp4" type="video/mp4">
					</video>
					<div class="jb-text">
						<p>세상의 모든 레시피, 모두의레시피</p>
					</div>
					</span>
				</div>
			</section>
			
			<!-- 한 주간 가장 사랑받은 레시피 -->
			<section>
				<header class="major">
					<h2>한 주간 가장 사랑받은 레시피</h2>
				</header>
				<div class="posts" id="posts">
						<!--<article>
					 <a href="#" class="image"><img src="./images/food/food1.jpeg" alt="" /></a>
						<h3>백종원의 돈가스</h3>
						<p class="target_name">든든한 혼밥메뉴로 제격!</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article> -->
				<!-- 	<article>
						<a href="#" class="image"><img src="./images/food/food2.jpeg" alt="" /></a>
						<h3>손님 초대용 스테이크</h3>
						<p class="target_name">술 안주로도 좋고 밥 반찬으로도 좋은 맛있는 스테이크 요리</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food3.jpg" alt="" /></a>
						<h3>아들아이 점심으로 후루룩~</h3>
						<p class="target_name">맛있는 만두국 간편하게 끌히는 방법</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food4.jpg" alt="" /></a>
						<h3>백종원의 돈가스</h3>
						<p class="target_name">든든한 혼밥메뉴로 제격!</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food5.jpg" alt="" /></a>
						<h3>손님 초대용 스테이크</h3>
						<p class="target_name">술 안주로도 좋고 밥 반찬으로도 좋은 맛있는 스테이크 요리</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food6.jpg" alt="" /></a>
						<h3>아들아이 점심으로 후루룩~</h3>
						<p class="target_name">맛있는 만두국 간편하게 끌히는 방법</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>  -->
				</div>
			</section>

			
			
		<!-- 	<!-- 최신 동영상 레시피 -->
			<!-- <section>
				<header class="major">
					<h2>최신 동영상 레시피</h2>
				</header>
				<div class="posts">
					<article>
						<a href="#" class="image re_img"><img src="./images/food/food1.jpeg" alt="" /></a>
						<span class="re_vod"><img src="https://recipe1.ezmember.co.kr/img/icon_vod.png"></span>
						<h3>백종원의 돈가스</h3>
						<p class="target_name">든든한 혼밥메뉴로 제격!</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food2.jpeg" alt="" /></a>
						<span class="re_vod"><img src="https://recipe1.ezmember.co.kr/img/icon_vod.png"></span>
						<h3>손님 초대용 스테이크</h3>
						<p class="target_name">술 안주로도 좋고 밥 반찬으로도 좋은 맛있는 스테이크 요리</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food3.jpg" alt="" /></a>
						<span class="re_vod"><img src="https://recipe1.ezmember.co.kr/img/icon_vod.png"></span>
						<h3>아들아이 점심으로 후루룩~</h3>
						<p class="target_name">맛있는 만두국 간편하게 끌히는 방법</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food4.jpg" alt="" /></a>
						<span class="re_vod"><img src="https://recipe1.ezmember.co.kr/img/icon_vod.png"></span>
						<h3>백종원의 돈가스</h3>
						<p class="target_name">든든한 혼밥메뉴로 제격!</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food5.jpg" alt="" /></a>
						<span class="re_vod"><img src="https://recipe1.ezmember.co.kr/img/icon_vod.png"></span>
						<h3>손님 초대용 스테이크</h3>
						<p class="target_name">술 안주로도 좋고 밥 반찬으로도 좋은 맛있는 스테이크 요리</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food6.jpg" alt="" /></a>
						<span class="re_vod"><img src="https://recipe1.ezmember.co.kr/img/icon_vod.png"></span>
						<h3>아들아이 점심으로 후루룩~</h3>
						<p class="target_name">맛있는 만두국 간편하게 끌히는 방법</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
				</div>
			</section> -->
			
			
			<!-- 추천 레시피 -->
			<!-- <section>
				<header class="major">
					<h2>추천 레시피</h2>
				</header>
				<div class="posts">
					<article>
						<a href="#" class="image"><img src="./images/food/food1.jpeg" alt="" /></a>
						<h3>백종원의 돈가스</h3>
						<p class="target_name">든든한 혼밥메뉴로 제격!</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food2.jpeg" alt="" /></a>
						<h3>손님 초대용 스테이크</h3>
						<p class="target_name">술 안주로도 좋고 밥 반찬으로도 좋은 맛있는 스테이크 요리</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food3.jpg" alt="" /></a>
						<h3>아들아이 점심으로 후루룩~</h3>
						<p class="target_name">맛있는 만두국 간편하게 끌히는 방법</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food4.jpg" alt="" /></a>
						<h3>백종원의 돈가스</h3>
						<p class="target_name">든든한 혼밥메뉴로 제격!</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food5.jpg" alt="" /></a>
						<h3>손님 초대용 스테이크</h3>
						<p class="target_name">술 안주로도 좋고 밥 반찬으로도 좋은 맛있는 스테이크 요리</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="./images/food/food6.jpg" alt="" /></a>
						<h3>아들아이 점심으로 후루룩~</h3>
						<p class="target_name">맛있는 만두국 간편하게 끌히는 방법</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
				</div>
			</section> -->
				
			<section style="border-bottom:none;margin-bottom:30px;">
				<div class="container_md">
			        <ul class="btm_stats">
			            <li><span class="btm_stats_3"></span>총 레시피수<b></b></li>
			            <li><span class="btm_stats_4"></span>월 방문자수<b>5,140,000</b></li>
			            <li><span class="btm_stats_5"></span>총 레시피 조회수<b>1,898,128,988</b></li>
			            <li class="btm_mail"><a href="mailto:modoorecipe@google.com">
			            	<img src="./images/icon/mail.png"></a></li>
			        </ul>
			    </div>
		    </section>	
		</div>
	</div>
	
	
	<!-- 지우지 마세요 -->
	<div class="wrap_default">
    	<a href="#none" id="on_top" style="display:none">
    	<img src="http://skin-skin110.jyeon89.cafe24.com/web/upload/category/editor/2020/03/26/ed3c9f3ebbcebd49e47031acad6287a9.png" alt="맨 위로" /></a>
   	</div>	
	<!-- 지우지 마세요 -->
	
	<!-- 사이드바/푸터 -->
	<div id="sidebar">
		<div class="inner">

			<!-- 검색 -->
			<section id="search" class="alt">
				<form method="post" action="#">
					<input type="text" name="query" id="query" placeholder="재료명, 요리명" />
				</form>
			</section>
			<!-- 검색 끝-->
				<%-- <h2><%= login_id %></h2> --%>
			<!-- 카테고리(Menu) -->
			<nav id="menu" style="border-bottom:0;">
		
				<header class="major">
					<h2>카테고리</h2>
				</header>
				<ul>
				<!--  -->
				
				<!--  -->
					<li class='nav_title_text'><a href="./main.do">Home</a></li>
					<li class='nav_title_text'><a href="./division.do">Recipe</a></li>
					<li class='nav_title_text'><a href="./review.do">Review</a></li>
					<li class='nav_title_text'><a href="./ranking.do">Ranking</a></li>
				</ul>
			</nav>
			<!-- 카테고리 끝 -->
			
			<!-- 최근에 본 레시피 -->
			<section>
				<header class="major">
					<h2>내가 본 레시피</h2>
					
					<ul class="seen_thumbnail" id="seen_List"></ul>
					
				</header>
			</section>
			<!-- 최근에 본 레시피 끝-->
			
			<!-- 스크랩한 레시피 -->
			<section>
				<header class="major">
					<h2>스크랩한 레시피</h2>
					<ul class="recipestore">
						<li class=""><a href="">스크랩한 레시피<span> (15)</span></a></li>
					</ul>
				</header>
			</section>
			<!-- 스크랩한 레시피-->
			
			

			<!-- 인기순 레시피 -->
			<section>
				<header class="major">
					<h2>모두의 레시피 랭킹</h2>
				</header>
				<ul id="rankingSide" class="recipestore" style="height:160px;"></ul>
			</section>
			<!-- 인기순 레시피 끝 -->

			<!-- 추천 레시피 -->
			<section>
				<header class="major">
					<h2>추천 키워드</h2>
				</header>
				<ul class="recipe10m">
					<li class=""><a href="#">두부조림</a></li>
					<li class=""><a href="#">간장불고기</a></li>
					<li class=""><a href="#">멸치볶음</a></li>
					<li class=""><a href="#">크로와상샌드위치</a></li>
					<li class=""><a href="#">가지볶음</a></li>
				</ul>
			</section>
			<!-- 추천 레시피 끝 -->

			<!-- 푸터 -->
			<footer id="footer"><p class="copyright">&copy; Copyright 모두의 레시피. All Rights Reserved</p></footer>
			<!-- 푸터 끝 -->
		</div>
	</div>
	<!-- 사이드바 -->
	
</div>
<!-- script -->
<script src="./js/jquery.min.js"></script>
<script src="./js/skel.min.js"></script>
<script src="./js/util.js"></script>
<script src="./js/main.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/modoo/top_button.js"></script>
<script src="./js/modoo/modernizr.custom.79639.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	sideRanking();
	
	var isFirst = "<%=isFirst%>";
	if(isFirst !=="true"){
		seenRecipe();	
	}
	 mainRank();
});

var mainRank = function() {
	$.ajax({
		url : "ranking_top3.do",
		type : "POST",
		dataType : "json",
		success : function(json1) {
			console.log(json1);
			//var rcseq = json1[i-1]["rcseq"];
			//var rfilename = json1[i-1]["rfilename"];
			//var subject = json1[i-1]["subject"];
			
			for (var i = 0 ; i < json1.length ; i ++){
				var result4 = "";
				result4 += "<article>";
				result4 += "<a href='./recipe_view.do?rcseq="  + json1[i]["rcseq"]  + "' class='image'><img src='./picture/"+ json1[i]["rcseq"] +"/Thumb/"+json1[i]["rfilename"]+"'/></a>";
				result4 += "<h3>"+json1[i]["subject"] +"</h3>";
				result4 += "</article>";
			//$("#posts").empty();
				$("#posts").append(result4);
			}
		},
		error: function(err) {
			console.log('err'+ err.status);
			console.log('err'+ err.responseText);
		}
	});
};



var sideRanking = function() {
	var rankPage = 1;
	var listKind = "hit";
	$.ajax({
		url : "ranking_side.do",
		type : "POST",		
		dataType : 'json',
		success : function(json) {
			console.log(json);
			for (var i = 1 ; i <= 5 ; i++) {
				var result = "";
				result += "<li class=''>";
				result += "<p>" + i + "</p>";
				result += "<a href='./recipe_view.do?rcseq=" + json[i-1]["rcseq"] + "'>" + json[i-1]["subject"] + "</a>";
				result += "</li>";
				$('#rankingSide').append(result);
			}
		}
	});
};

function DropDown(el) {
	this.drop_nav = el;
	this.initEvents();
}

	
DropDown.prototype = {
	initEvents : function() {
		var obj = this;

		obj.drop_nav.on('click', function(event){
			$(this).toggleClass('active');
			event.stopPropagation();
		});	
	}
}


$(function() {

	var drop_nav = new DropDown( $('#drop_nav') );

	$(document).click(function() {
		// all dropdowns
		$('.wrapper-dropdown-5').removeClass('active');
	});

});
	
var seenRecipe = function() {
	$.ajax({
		type:"POST",
		url: "seenRecipe.do",
		success : function(json) {
			var result = "";
			for(var i = 0; i < json.length ; i++){
				var rcseq = json[i]["rcseq"];
				var filename = json[i]["filename"];
				
				result += "<li class='seen_thum'><div class='seen_thumb_img'><a href='recipe_view.do?rcseq="+rcseq+"'><img src='./picture/"+rcseq+"/Thumb/"+filename+"'/></a></div></li>";
			}
			
			$('#seen_List').empty();
			$('#seen_List').append(result);
			$('.seen_thum img').bind('load', fitImgToFrameSize);
		}		
	});
}

function fitImgToFrameSize(e){
	var frWidth = $(this).closest('.seen_thumb_img').width();
	var frHeight = $(this).closest('.seen_thumb_img').height();
	var frRatio = frWidth/frHeight;
	var ntWidth = $(this).get(0).naturalWidth;
	var ntHeight = $(this).get(0).naturalHeight;
	var ntRatio = ntWidth/ntHeight;
	
	if(ntRatio > frRatio){ //더 납작하면
		$(this).css({'width':'auto' , 'height': '100%',}); 
		var vwWidth = frHeight*(ntWidth/ntHeight);
		var marginLeft = (vwWidth - frWidth)/2.0*(-1);
		$(this).css({'margin-left':marginLeft+'px'});
	}else{ //더 길죽하면
		$(this).css({'width':'100%' , 'height':'auto'});
	   	$(this).closest('.seen_thumb_img').css({'text-align':'center'});
	   	var vwHeight = frWidth*(ntHeight/ntWidth);
	   	var paddingTop = (vwHeight - frHeight)/2.0*(-1);
	   	$(this).css({'margin-top':paddingTop+'px'});
	}
}



/* var divisionList = function(divPage) {
	$.ajax({
		type:"POST",
		data:{
			
		},
		url: "division_view.do",
		success : function(json) {
			
		}
	});
} */
	

	
</script>

</body>
</html>