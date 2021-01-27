<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	String login_id = (String)session.getAttribute("id");
	String login_state = "";
	StringBuffer login_user = new StringBuffer();
	 
	if(session.getAttribute("id")!=null){
		 
		String id = (String)session.getAttribute("id");
		//login_id = "<a>" + id + "님</a>";
		//login_state = "<a href='./logout.do'><span class='label'>로그아웃</span></a>";
		 
		login_user.append("<li id='drop_nav' class='wrapper-dropdown-5'><a style='padding-right:20px'>" + id + "님</a>");
		login_user.append("	<ul class='dropdown'>");
		login_user.append("		<li><a href='./mypage_public.do'><span class='label'>마이페이지</span></a></li>");	
		login_user.append("		<li><a href='./user_modify.do'><i class='icon-remove'></i>회원정보수정</a></li>");
		login_user.append(login_state = "<li><a href='./logout.do'><span class='label'>로그아웃</span></a></li>");
		login_user.append("	</ul>");
		login_user.append("</li>");
		login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
		login_user.append("<li><a href='./admin_main.do'><span class='label'>관리자</span></a></li>");
	
	}else{
		login_user.append("<li><a href='./login.do'><span class='label'>로그인</span></a></li>");
		login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
		login_user.append("<li><a href='./admin_main.do'><span class='label'>관리자</span></a></li>");
		//login_state = "<a href='./login.do'><span class='label'>로그인</span></a>";
	}
	
	int rankPage = 1;
	if(request.getAttribute("rankPage")!=null){
		rankPage = (int) request.getAttribute("rankPage");
	}
	
	String rankKind = "hit";
	if(request.getAttribute("rankKind")!=null){
		rankKind = (String )request.getAttribute("rankKind");
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
<link rel="stylesheet" href="./css/modoo/ranking.css" />
</head>

<body>

<div id="wrapper">

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
           
            <!-- 랭킹 -->
            <content>
            	<div id="contents_area_full">
            		<div class="s_list_ea tit">
            			레시피 랭킹 <span>따라하고 싶은 레시피!</span>
            		</div>
            		<div class="rcp_m_list2">
            			<ul class="nav1 nav-tabs3" style="position: relative;">
	            			<ul class="nav1 nav-tabs2 pull-right" style="position: relative;">
	            				<li id="rankHit" role="presentation" class="active">
	            					<a href="javascript:void(0);" onclick="btnHit()">조회순</a>
	            				</li>
	            				<li id="rankStar" role="presentation">
	            					<a href="javascript:void(0);" onclick="btnStar()">평점순</a>
	            				</li>
	            			</ul>
	            		</ul>
	            		
	            		<ul id="rankingListUl" class="common_sp_list_ul ea4" style="padding: 40px 0 0 8px;">
	            		
	            		</ul>
	            	</div>
	            <nav class="text-center">	
	            	<ul class="pagination" id="rank_paging"></ul>
	            </nav>
	            </div>
			</content>
			<!-- 랭킹 -->
			 <section style="border-bottom:none;margin-bottom:30px;">
				<div class="container_md">
			        <ul class="btm_stats">
			            <li><span class="btm_stats_3"></span>총 레시피수<b>143,288</b></li>
			            <li><span class="btm_stats_4"></span>월 방문자수<b>5,140,000</b></li>
			            <li><span class="btm_stats_5"></span>총 레시피 조회수<b>1,898,128,988</b></li>
			            <li class="btm_mail"><a href="mailto:modoorecipe@google.com">
			            	<img src="./images/icon/mail.png"></a></li>
			        </ul>
			    </div>
		    </section>	
		    <br/><br/><br/><br/><br/>
		</div>
	</div>
	
	<!-- 탑 버튼-->
	<div class="wrap_default">
    	<a href="#none" id="on_top" style="display:none">
    	<img src="http://skin-skin110.jyeon89.cafe24.com/web/upload/category/editor/2020/03/26/ed3c9f3ebbcebd49e47031acad6287a9.png" alt="맨 위로" /></a>
   	</div>
   	
   	<!-- 사이드바/푸터 -->
	<div id="sidebar">
		<div class="inner">

			<!-- 검색 -->
			<section id="search" class="alt">
				<form method="post" action="#">
					<input type="text" name="query" id="query" placeholder="재료명, 요리명" />
				</form>
			</section>
			
			<!-- 카테고리(Menu) -->
			<nav id="menu" style="border-bottom:0;">
		
				<header class="major">
					<h2>카테고리</h2>
				</header>
				<ul>
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
				<ul id="rankingSide" class="recipestore" style="height:160px;">
					<!-- <li class="">
						<p>1</p>
						<a href="#">꿀떡꿀떡 넘어가는 꿀떡버거</a>
					</li>
					<li class="">
						<p>2</p>
						<a href="#">오지는 조합 오지치즈후라이~!</a>
					</li>
					<li class="">
						<p>3</p>
						<a href="#">건강냄새 물씬~ 쌍화탕 한방닭죽</a>
					</li>
					<li class="">
						<p>4</p>
						<a href="#">카아악~! 맵다매워! 불닭치면</a>
					</li>
					<li class="">
						<p>5</p>
						<a href="#">막창? 떡뽂이? 이건 꿀조합일세!</a>
					</li> -->
				</ul>
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
var rankKind = "hit";
var rankPage = <%=rankPage%>;

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

$(document).ready(function() {
	rankPaging(rankPage); 
	
	var isFirst = "<%=isFirst%>";
	if(isFirst !=="true"){
		seenRecipe();	
	}	
	
	sideRanking();
     
});
  
var btnHit = function() {
	rankKind = "hit";
	$('#rankHit').addClass('active');
    $('#rankStar').removeClass();
    $('#rankingListUl').empty();
    
    rankPaging(1);
    
}


var btnStar = function() {
	rankKind = "star";			
	$('#rankStar').addClass('active');
    $('#rankHit').removeClass();
    $('#rankingListUl').empty();
    $('#totalRecord').empty();
    
    rankPaging(1);
    
}


var rankingList = function(listKind, rankPage) {
	$.ajax({
		type:"POST",
		data:{			
			rankPage : rankPage,
			listKind : listKind
		},
		url: "ranking_view.do",
		success : function(json) {
			for(var i = 1; i <= 8; i++){
				var result = "";
				var rankNum = i+(8*(rankPage-1));
				var url = json.array[i-1]["url"];
				var picture = json.array[i-1]["picture"];
				/* var allstar = new Number(json.array[i-1]["allstar"]);
				var rev = new Number(json.array[i-1]["rev"]);
				var ever = new Number (allstar/rev);
				console.log(ever); */
				
				
				result += "<li id='rankingList" + i+(8*(rankPage)) + "' class='common_sp_list_li'>";
				result += "<p class='ranking_num st1'>"; 
				result += "<b>"+rankNum+"</b>";
				result += "</p>";
				result += "<div class='common_sp_thumb'>";
				result += "<a href='./recipe_view.do?rcseq=" + json.array[i-1]["rcseq"] + "' class='common_sp_link'>";
				
				if( url != ""){
					result += "<span class='common_vod_label'><img src='https://recipe1.ezmember.co.kr/img/icon_vod.png'></span>";
				}
				result += "<div class='rankThumb_Img'>";
				result += "<img src='./picture/" + json.array[i-1]["rcseq"] + "/Thumb/"+ json.array[i-1]["rcseq"] +"_thumb_1.jpg'>";
				result += "</div>";
				result += "</a>";
                result += "</div>";
                result += "<div class='common_sp_caption'>";
                result += "<div class='common_sp_caption_tit line2'>";
                result += "<a href='./recipe_view.do?rcseq=" + json.array[i-1]["rcseq"] + "'>";
                result += json.array[i-1]["subject"];
                result += "</div>";
                result += "<div class='common_sp_caption_rv_name' style='display: inline-block; vertical-align: bottom;'>";
            	result += "<a href='/profile/recipe.html?uid=faces7'>";     
                
             if(picture == "" ){
               	result += "<img src='./images/profile_default.jpg'>";
	         }else{
	             result += "<img src='" + picture + "'>";	                	
	         }         
		
				
				result += json.array[i-1]["nickname"];
				result += "</a>";				
				result += "</div>";		
				
				if(listKind==='hit'){
					result += "<div class='common_sp_caption_buyer' style='vertical-align: middle;'> 조회수 " + json.array[i-1]["hit"] + " &nbsp;&nbsp; ";
				}else{
					result += "<div class='common_sp_caption_buyer' style='vertical-align: middle;'> 평점 " + json.array[i-1]["allstar"] + " &nbsp;&nbsp; ";
				}
				
				result += "후기  " + json.array[i-1]["rev"];
				result += "</div>";
				result += "</div>";
				
				result += "</li>";
				
				$('#rankingListUl').append(result);
				$('.rankThumb_Img img').bind('load', fitRankImgToFrameSize);
			}
		}
	});
}
    
var sideRanking = function() {
	
	$.ajax({
		type : "POST",
		url : "ranking_side.do",
		success : function(json) {
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

var seenRecipe = function() {
	$.ajax({
		type:"POST",
		url: "seenRecipe.do",
		success : function(json) {
			var result = "";
			for(var i = 0; i < json.length ; i++){
			//	var rcseq = json[i]["rcseq"];
				var filename = json[i]["filename"];
				
				result += "<li class='seen_thum'><div class='seen_thumb_img'><a href='recipe_view.do?rcseq="+  json[i]["rcseq"] +"'><img src='./picture/"+   json[i]["rcseq"] +"/Thumb/"+filename+"'/></a></div></li>";
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

var rankPaging = function(rankPage){		
	 $.ajax({
       type: "POST",         
       data:  {    	   
       	rankPage : rankPage
       },
       url: "ranking_page.do",
       success : function(json) {
       	       	
       	var blockPerPage = json["blockPerPage"];
       	var cpage = json["cpage"];
       	var endBlock = json["endBlock"];
       	var recordPerPage = json["recordPerPage"];
       	var startBlock = json["startBlock"];
       	var totalPage = json["totalPage"];
       	var totalRecord = json["totalRecord"];
       	
       	var pageStr = "";
       	if(startBlock == 1) {
	   			pageStr+="<span class='on'><a>&lt;&lt;</a></span>";
  			} else {
  			pageStr+="<span class='off'><a href='ranking_view.do?rankPage=" + eval("startBlock - blockPerPage") + "'>&lt;&lt;</a></span>"; 
  			}

  			pageStr+="&nbsp;";

  			if(cpage == 1) {
  			pageStr+="<span class='on'><a>&lt;</a></span>";
  			} else {
  			pageStr+="<span class='off'><a href='ranking_view.do?rankPage=" + eval("cpage-1")+ "'>&lt;&nbsp;</a></span>";
  			}

  			pageStr+="&nbsp;&nbsp;";
  			
  			for(var i = startBlock ; i <= endBlock ; i++) {
  			if(cpage == i) {
  			pageStr+="<li class='active'><a href='#' onClick='javascript: rankPaging("+i+")'>"+i+"</a></li>";
  			} else {
  			pageStr+="<li><a href='#' onClick='javascript: rankPaging("+i+")'>"+i+"</a></li>";
  			}
  			}

  			pageStr+="&nbsp;&nbsp;";

  			if(cpage == totalPage) {
  			pageStr+="<span class='on'><a>&gt;</a></span>";
  			} else {
  			pageStr+="<span class='off'><a href='ranking_view.do?rankPage=" + eval("cpage +1")+ "'>&gt;</a></span>";
  			}

  			pageStr+="&nbsp;";

  			if(endBlock == totalPage) {
  			pageStr+="<span class='on'><a>&gt;&gt;</a></span>";
  			} else {
  			pageStr+="<span class='off'><a href='ranking_view.do?rankPage=" + eval(startBlock + blockPerPage) + "'>&gt;&gt;</a></span>";
  			}
       	
  		 	$('#rankingListUl').empty();
  		 	rankingList(rankKind, rankPage);
  			
  			$('#rank_paging').empty();
  			$('#rank_paging').append(pageStr);
       	
       },
       error : function(request,status,error){
       	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
    });
}
	
function fitRankImgToFrameSize(e){
	var frWidth = $(this).closest('.rankThumb_Img').width();
	var frHeight = $(this).closest('.rankThumb_Img').height();
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
	   	$(this).closest('.rankThumb_Img').css({'text-align':'center'});
	   	var vwHeight = frWidth*(ntHeight/ntWidth);
	   	var paddingTop = (vwHeight - frHeight)/2.0*(-1);
	   	$(this).css({'margin-top':paddingTop+'px'});
	}
}
    
</script>

</body>
</html>