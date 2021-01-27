<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	int divPage = 1;
	
	if(request.getAttribute("divPage")!=null){
		divPage = (int) request.getAttribute("divPage");
	}
	
	String login_id = (String)session.getAttribute("id");
	String login_state = "";
	StringBuffer login_user = new StringBuffer();
	String admin = "admin";
	 System.out.println("rec_session test1 :" + login_id);
	if(session.getAttribute("id")!=null && !session.getAttribute("id").equals(request.getRemoteAddr())){
		 
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
		/* login_user.append("<li><a href='./admin.do'><span class='label'>관리자</span></a></li>"); */
			 System.out.println("rec_sessiontest2 :" + login_id.equals("admin"));
		//관리자세션
	/* //}else if(login_id.equals("admin") == true ){
	//	String id = (String)session.getAttribute("id");
		
	//	login_user.append("<li id='drop_nav' class='wrapper-dropdown-5'><a style='padding-right:20px'>" + id + "님</a>");
	//	login_user.append("	<ul class='dropdown'>");
	//	login_user.append("		<li><a href='./mypage_public.do'><span class='label'>마이페이지</span></a></li>");	
		//login_user.append("		<li><a href='./user_modify.do'><i class='icon-remove'></i>회원정보수정</a></li>");
		//login_user.append(login_state = "<li><a href='./logout.do'><span class='label'>로그아웃</span></a></li>");
	//	login_user.append("	</ul>");
	//	login_user.append("</li>");
		//login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
		 //login_user.append("<li><a href='./admin_main.do'><span class='label'>관리자</span></a></li>");  */
 
	}else{
		login_user.append("<li><a href='./login.do'><span class='label'>로그인</span></a></li>");
		login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
		//login_user.append("<li><a href='./admin.do'><span class='label'>관리자</span></a></li>");	
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
<link rel="stylesheet" href="./css/modoo/division.css" />
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
			
			
			<!-- 레시피 분류 -->
            <content>
            
            	<!-- 분류 내용 시작-->
            	<div id="contents_area_full" style="clear: both;">
            		<!-- 상단 카테고리 시작 -->
           			<div class="s_list_ea tit">전체레시피 <span>전체 레시피 한번에 모아보기!</span></div>
					<div id="id_search_category" style="" class="rcp_m_cate">
						<table cellspacing="0" cellpadding="0">
							<tbody>
								<!--종류별-->
								<tr>
									<th><span>종류별</span></th>
									<td>
										<!-- toggle 카테고리 -->
										<div class="rcp_cate st3">
											<!-- 종류별 -->
											<div id="cate_kind" class="cate_list">
												<a href="javascript:goSearchRecipe('cat1','')"
													class="active">전체</a> <a
													href="javascript:goSearchRecipe('cat1','밑반찬')">밑반찬</a> <a
													href="javascript:goSearchRecipe('cat1','메인반찬')">메인반찬</a> <a
													href="javascript:goSearchRecipe('cat1','국_탕')">국/탕</a> <a
													href="javascript:goSearchRecipe('cat1','찌개')">찌개</a> <a
													href="javascript:goSearchRecipe('cat1','디저트')">디저트</a> <a
													href="javascript:goSearchRecipe('cat1','밥_죽_떡')">밥/죽/떡</a>
												<a href="javascript:goSearchRecipe('cat1','퓨전')">퓨전</a> <a
													href="javascript:goSearchRecipe('cat1','김치_젓갈_장류')">김치/젓갈/장류</a>
												<a href="javascript:goSearchRecipe('cat1','양념_소스_잼')">양념/소스/잼</a>
												<a href="javascript:goSearchRecipe('cat1','양식')">양식</a> <a
													href="javascript:goSearchRecipe('cat1','샐러드')">샐러드</a> <a
													href="javascript:goSearchRecipe('cat1','스프')">스프</a> <a
													href="javascript:goSearchRecipe('cat1','빵')">빵</a> <a
													href="javascript:goSearchRecipe('cat1','과자')">과자</a> <a
													href="javascript:goSearchRecipe('cat1','차_음료_술')">차/음료/술</a>
												<a href="javascript:goSearchRecipe('cat1','기타')">기타</a>
											</div>
										</div>
									</td>
								</tr>
								<!--재료별-->
								<tr>
									<th><span>재료별</span></th>
									<td>
										<!-- toggle 카테고리 -->
										<div class="rcp_cate st3">
											<!-- 재료별 -->
											<div class="cate_list">
												<a href="javascript:goSearchRecipe('cat2','')"
													class="active">전체</a> <a
													href="javascript:goSearchRecipe('cat2','소고기')">소고기</a> <a
													href="javascript:goSearchRecipe('cat2,'돼지고기')">돼지고기</a> <a
													href="javascript:goSearchRecipe('cat2','닭고기')">닭고기</a> <a
													href="javascript:goSearchRecipe('cat2','육류')">육류</a> <a
													href="javascript:goSearchRecipe('cat2','채소류')">채소류</a> <a
													href="javascript:goSearchRecipe('cat2','해물류')">해물류</a> <a
													href="javascript:goSearchRecipe('cat2','달걀_유제품')">달걀/유제품</a>
												<a href="javascript:goSearchRecipe('cat2','가공식품류')">가공식품류</a>
												<a href="javascript:goSearchRecipe('cat2','쌀')">쌀</a> <a
													href="javascript:goSearchRecipe('cat2','밀가루')">밀가루</a> <a
													href="javascript:goSearchRecipe('cat2','건어물류')">건어물류</a> <a
													href="javascript:goSearchRecipe('cat2','버섯류')">버섯류</a> <a
													href="javascript:goSearchRecipe('cat2','과일류')">과일류</a> <a
													href="javascript:goSearchRecipe('cat2','콩_견과류')">콩/견과류</a>
												<a href="javascript:goSearchRecipe('cat2','곡류')">곡류</a> <a
													href="javascript:goSearchRecipe('cat2','기타')">기타</a>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 상단 카테고리 끝 -->
						
					<!-- 카테고리 버튼 -->
					<div class="rcp_cate_btn">
						<a href="javascript:ToggleCategory()">
							<span id="id_search_category_text">카테고리 닫기</span>
							<span><img id="id_search_category_img" src="./images/icon/icon_arrow9_up.png"></span>
						</a>
					</div>
						
					<form id="srRecipeFrm" name="srRecipeFrm" method="get" action="./division_detail_view.do">
						<input type="hidden" name="q" value="">
						<input type="hidden" id="q_query" name="query" value=""> 
						<input type="hidden" name="cat1" value="">
						<input type="hidden" name="cat2" value="">
						<input type="hidden" name="fct" value="">
						<input type="hidden" name="order" value="reco">
						<input type="hidden" name="lastcate">
						<input type="hidden" name="dsearch">
						<input type="hidden" id="dsf_copyshot" name="copyshot">
						<input type="hidden" id="dsf_scrap" name="scrap">
						<input type="hidden" id="dsf_degree" name="degree">
						<input type="hidden" id="dsf_portion" name="portion">
						<input type="hidden" id="dsf_time" name="time">
						<input type="hidden" name="niresource">
					</form>
						
					<!-- 앨범게시판 시작 -->
					<ul class="rcp_m_list2">
						<div class="m_list_tit">총 <b><span id="totalRecord"></span></b>개의 맛있는 레시피가 있습니다.
							<ul class="nav nav-tabs2 pull-right" style="position: relative;">
								<li id="listByDate" role="presentation" class="active">
									<a href="javascript:void(0);" onclick="divisionListByDate()">최신순</a>
								</li>
								<li id="listByStar" role="presentation">
									<a href="javascript:void(0);" onclick="divisionListByStar()">추천순</a>
								</li>
							</ul>
						</div>
						
						<ul id="ulul" class="common_sp_list_ul ea4" style="padding: 0 0 0 8px;">
						<!-- /데이터 -->
						</ul>
						
						<nav class="text-center">
							
							<ul class="pagination" id="div_paging"></ul>
							<!-- <ul class="pagination">
								<li>
									<a href="/recipe/review.html?page=1" aria-label="Prev">
									<span aria-hidden="true">&lt;</span>
									</a>
								</li>
								<li class="active"><a href="/recipe/list.html?order=reco&amp;page=1">1</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=2">2</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=3">3</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=4">4</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=5">5</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=6">6</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=7">7</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=8">8</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=9">9</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=10">10</a></li>
								<li><a href="/recipe/list.html?order=reco&amp;page=11" aria-label="Next"><span aria-hidden="true">&gt;</span></a></li>
							</ul> -->
						</nav>
					</ul>
					<!-- 앨범게시판 끝 -->
					 <section style="border-bottom:none;margin-bottom:30px;">
						<div class="container_md">
							<ul class="btm_stats">
								<li><span class="btm_stats_3"></span>총 레시피수<b>143,288</b></li>
								<li><span class="btm_stats_4"></span>월 방문자수<b>5,140,000</b></li>
								<li><span class="btm_stats_5"></span>총 레시피 조회수<b>1,898,128,988</b></li>
								<li class="btm_mail"><a
									href="mailto:modoorecipe@google.com"> <img
										src="./images/icon/mail.png"></a></li>
							</ul>
						</div>
					</section>	
				</div>
			<!-- 컨텐츠 끝 -->
			</content>
			
		</div>
	</div>
   
	<!-- 탑 버튼-->
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
<script>

var _IS_SEARCH_RESTRICT = false;

$(document).ready(function() {
	var divPage = <%=divPage%>;
	divPaging(divPage);
	
	ToggleCategory();
	$('#totalRecord').empty();
		
	sideRanking();
	
	var isFirst = "<%=isFirst%>";
	if(isFirst !=="true"){
		seenRecipe();	
	}	
});

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
	
	$('.md_thum img').each(function(){
		
		$(this).css({
			
			"left": "50%",
			"margin-left": "-"+( $(this).width()/2 )+"px",
			"top": "50%",
			"margin-top": "-"+( $(this).height()/2 )+"px"
		});
	});

	var drop_nav = new DropDown( $('#drop_nav') );

	$(document).click(function() {
		// all dropdowns
		$('.wrapper-dropdown-5').removeClass('active');
	});

});



function goSearchRecipe(ca, val) {
	if (val == 'reco' && _IS_SEARCH_RESTRICT) {
		viewPremiumSearchModal();
	} else {
		$("#srRecipeFrm [name='" + ca + "']").val(val);
		$("[name='lastcate']").val(ca);
		$("#srRecipeFrm").submit();
	}
}

function doSetSearch(filters, val) {
	if (!filters || !val)
		return;
	$("[id^=li_" + filters + "_]").removeClass("active");
	// cancel
	if ($("#dsf_" + filters).val() == val) {
		$("#dsf_" + filters).val('');
	} else {
		$("#li_" + filters + "_" + val).addClass("active");
		$("#dsf_" + filters).val(val);
	}
}

function doDetailSearch() {
	$("[name=dsearch]").val("y");
	if ($("#ni_resource").val())
	$("[name=niresource]").val($("#ni_resource").val());
	$("#srRecipeFrm").submit();
}

function ToggleCategory() {
	$('#id_search_category').toggle();
	if ($('#id_search_category').is(":visible")) {
		$('#id_search_category_text').text('카테고리 닫기');
		$('#id_search_category_img').attr("src", './images/icon/icon_arrow9_up.png');
	} else {
		$('#id_search_category_text').text('카테고리 열기');
		$('#id_search_category_img').attr("src", './images/icon/icon_arrow9_down.png');
	}
}

var divisionListByDate = function() {
	$('#listByDate').addClass('active');
	$('#listByStar').removeClass();
	$('#ulul').empty();
	$('#totalRecord').empty();
	
	divisionList();
}

var divisionList = function(divPage) {
	$.ajax({
		type:"POST",
		data:{
			divPage : divPage
		},
		url: "division_view.do",
		success : function(json) {
						
			$('#totalRecord').empty();
			$('#totalRecord').append(json.totalRecord);
			//$('#totalRecord').empty();
			for(var i in json.array){
				var result = "";
				//console.log(json[i]);
				result += "<li class='common_sp_list_li'>";
				result += "<div class='common_sp_thumb'>";
				result += "<a href='./recipe_view.do?rcseq=" + json.array[i]["rcseq"] + "' class='common_sp_link'>";                  
				result += "<span class='common_vod_label'>";
				if(json.array[i]["url"] != null && json.array[i][url]!=""){
					result += "<img src='https://recipe1.ezmember.co.kr/img/icon_vod.png'>";
				}else{
					result += "";
				}
				result += "</span>";
				result += "<div class='divThumb_Img'>";
				result += "<img src='./picture/" + json.array[i]["rcseq"] + "/Thumb/"+ json.array[i]["rcseq"] +"_thumb_1.jpg'>";
				/* result += "<img src='D:/workspace/FinalProject_1031_0900/src/main/webapp/picture/" + json.array[i]["rcseq"] + "/Thumb/"+ json.array[i]["rcseq"] +"_thumb_1.jpg'>"; */
				result += "</div>";
                result += "</a>";
                result += "</div>";
                result += "<div class='common_sp_caption'>";
                result += "<div class='common_sp_caption_tit line2 rv'>";
                result += "<a href='./recipe_view.do?rcseq=" + json.array[i]["rcseq"] + "'>";
                result += json.array[i]["subject"];
                result += "</a>";
                result += "</div>";
                result += "<div class='common_sp_caption_rv_name' style='display: inline-block; vertical-align: bottom;'>";
                result += "<a href='/profile/recipe.html?uid=48794657'>";
                result += "<img src='./images/profile_default.jpg'>&nbsp;";
                result += json.array[i]["nickname"];
                result += "</a>";
                result += "</div>";
                result += "<div class='common_sp_caption_rv'>";
                result += "<span class='common_sp_caption_rv_star'>";
                result += "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png'>";
                result += "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png'>";
                result += "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png'>";
                result += "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png'>";
                result += "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png'>";
                result += "</span>";
                result += "<span class='common_sp_caption_rv_ea'>(" + json.array[i]["rev"] + ")</span>"; 
                result += "<span class='common_sp_caption_buyer style='vertical-align: middle;'>조회수 " + json.array[i]["hit"] + "</span>";
                result += "</div>";
                result += "</div>";
				result += "</li>";
				
				$('#ulul').append(result);
				$('.divThumb_Img img').bind('load', fitDivImgToFrameSize);
			}
		}
	});
}	    
   
var sideRanking = function() {
	var rankPage = 1;
	var listKind = "hit";
	$.ajax({
		type : "POST",			
		url : "ranking_side.do",
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

var divPaging = function(divPage){
	 $.ajax({
        type: "POST",         
        data:  {
        	divPage : divPage
        },
        url: "division_page.do",
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
   			pageStr+="<span class='off'><a href='division.do?divPage=" + eval("startBlock - blockPerPage") + "'>&lt;&lt;</a></span>";
   			}

   			pageStr+="&nbsp;";

   			if(cpage == 1) {
   			pageStr+="<span class='on'><a>&lt;</a></span>";
   			} else {
   			pageStr+="<span class='off'><a href='division.do?divPage=" + eval("cpage-1")+ "'>&lt;&nbsp;</a></span>";
   			}

   			pageStr+="&nbsp;&nbsp;";

   			console.log(startBlock);
   			
   			for(var i = startBlock ; i <= endBlock ; i++) {
   			if(cpage == i) {
   			pageStr+="<li class='active'><a href='#' onClick='javascript: divPaging("+i+")'>"+i+"</a></li>";
   			} else {
   			pageStr+="<li><a href='#' onClick='javascript: divPaging("+i+")'>"+i+"</a></li>";
   			}
   			}

   			pageStr+="&nbsp;&nbsp;";

   			if(cpage == totalPage) {
   			pageStr+="<span class='on'><a>&gt;</a></span>";
   			} else {
   			pageStr+="<span class='off'><a href='division.do?divPage=" + eval("cpage +1")+ "'>&gt;</a></span>";
   			}

   			pageStr+="&nbsp;";

   			if(endBlock == totalPage) {
   			pageStr+="<span class='on'><a>&gt;&gt;</a></span>";
   			} else {
   			pageStr+="<span class='off'><a href='division.do?divPage=" + eval(startBlock + blockPerPage) + "'>&gt;&gt;</a></span>";
   			}
        	
   		 	$('#ulul').empty();
   		 	divisionList(divPage);
   			
   			$('#div_paging').empty();
   			$('#div_paging').append(pageStr);
        	
        },
        error : function(request,status,error){
        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
     });
}

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
																																							/* <img src='D:/workspace/FinalProject_1031_0900/src/main/webapp/picture/"+rcseq+"/Thumb/"+filename+"'/></a></div></li>"; */
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

function fitDivImgToFrameSize(e){
	var frWidth = $(this).closest('.divThumb_Img').width();
	var frHeight = $(this).closest('.divThumb_Img').height();
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
	   	$(this).closest('.divThumb_Img').css({'text-align':'center'});
	   	var vwHeight = frWidth*(ntHeight/ntWidth);
	   	var paddingTop = (vwHeight - frHeight)/2.0*(-1);
	   	$(this).css({'margin-top':paddingTop+'px'});
	}
}
	

</script>
</body>
</html>