<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 String login_id = (String)session.getAttribute("id");
	 String login_state = "";
	 StringBuffer login_user = new StringBuffer();
	 
	 if(session.getAttribute("id")!=null){
	    
	    String id = (String)session.getAttribute("id");
	    //login_id = "<a>" + id + "님</a>";
	   // login_state = "<a href='./logout.do'><span class='label'>로그아웃</span></a>";
	    
	    login_user.append("<li id='drop_nav' class='wrapper-dropdown-5'><a style='padding-right:20px'>" + id + "님</a>");
	    login_user.append("   <ul class='dropdown'>");
	    login_user.append("      <li><a href='./mypage_public.do'><span class='label'>마이페이지</span></a></li>");   
	    login_user.append("      <li><a href='./user_modify.do'><i class='icon-remove'></i>회원정보수정</a></li>"); 
	    login_user.append(login_state = "<li><a href='./logout.do'><span class='label'>로그아웃</span></a></li>");
	    login_user.append("   </ul>");
	    login_user.append("</li>");
	    login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
	    login_user.append("<li><a href='./admin.do'><span class='label'>관리자</span></a></li>");
	 
	}else{
	   login_user.append("<li><a href='./login.do'><span class='label'>로그인</span></a></li>");
	    login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
	    login_user.append("<li><a href='./admin.do'><span class='label'>관리자</span></a></li>");
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
<link rel="stylesheet" href="./css/jquery.modal.min.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/modoo/drop_nav.css" />
<link rel="stylesheet" href="./css/modoo/tabs.css" />
<link rel="stylesheet" href="./css/modoo/tabstyles.css" />
<link rel="stylesheet" href="./css/modoo/mypage.css" />
<link rel="stylesheet" href="./css/modoo/top_button.css" />
<style type="text/css">
.modal {
 position:fixed;
  top:50%; 
  left:50%;
  transform: translate(-50%,-50%);

}
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
            
            <ul class="icons"><%=login_user %></ul>
         </header>
         <!-- 상단 끝 -->
         
         <!-- 마이페이지 -->
         <section style="overflow: hidden;">   
            <div id="contents_area">
               <div class="tabs tabs-style-bar">
                  <nav>
                     <ul class="mp_main_section">
                        <li><a href="#section-bar-1" class="icon"><span>레시피</span></a></li>
                        <li><a href="#section-bar-2" class="icon"><span>후기</span></a></li>
                     </ul>
                  </nav>
                  <div class="content-wrap">
                     
                     <section id="section-bar-1">
                        <form name="searchFrm">
                           <input type="hidden" name="mode" value="public">
                            <div class="chef_cont">
                              <ul class="nav nav-tabs3" style="position:relative;">
                                <li role="presentation" id="myWrite" class="active"><a href="#">내가 쓴 레시피</a></li>
                                <li role="presentation" id="myScrap" class=""><a href="#">스크랩한 레시피</a></li>
                                <!-- <li role="presentation"><a href="#">내가 본 레시피</a></li> -->
                                <div class="list_sort">
                                  <a href="/profile/recipe.html?mode=public&amp;order=seq" class="active">최신순</a>
                                  <a href="/profile/recipe.html?mode=public&amp;order=hit">조회순</a>
                                  <a href="/profile/recipe.html?mode=public&amp;order=scrap">스크랩순</a>
                                 </div>
                              </ul>
                              <div id="showData" class="cont_list">
                              <ul id='ulul' class='common_sp_list_ul ea4' style='padding: 0 0 0 8px;'></ul>
                               <!-- <div class="result_none"><img src="https://recipe1.ezmember.co.kr/img/none_recipe.png">
                                   <p>레시피를 직접 올려보세요!</p> 자랑하고 싶은 나만의 레시피! 공유하고 싶은 멋진 레시피를 올려 주세요.<br>
                                   <button type="button" onclick="location.href='./recipe_write.do';" class="btn-lg btn-primary">레시피 등록하기</button>
                               </div>
                               <div class="input-group info_srarch">
                                    <input type="text" name="qs" class="form-control" placeholder="" value="">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_search4.png"></button>
                                    </span>
                                </div> -->
                              </div>
                            </div>
                        </form>                  
                     </section>
                     
                     
                     <section id="section-bar-2">
                        <form name="searchFrm">
                           <input type="hidden" name="mode" value="public">
                           <div class="chef_cont">
                              <ul class="nav nav-tabs3" style="position:relative;">
                                   <li role="presentation" id="myReviewWrite" class="active"><a href="#">내가 쓴 요리 후기</a></li>
                                   <li role="presentation" id="myReviewGet" class=""><a href="#">받은 요리 후기</a></li>
                              </ul>
                              <div class="cont_list">
                              <ul id='ululReview' class='common_sp_list_ul ea4'>
                                 <!-- <div class="result_none">
                                 <img src="https://recipe1.ezmember.co.kr/img/none_feel.png">
                                    <p>받은 요리후기가 없습니다.</p>
                                    감사의 마음이 담긴 요리후기에 답글을 남겨주세요.<br>
                                    따듯한 마음을 주고 받을 수 있어요<br>
                                 </div> -->
                              </ul>
                              </div>
                           </div>
                        </form>
                     </section>
                  </div>
               </div>
            </div>
            
            <!-- 회원 정보 -->
         <div id="right_area">
                <div class="myhome_main">
                   <div class="myhome_main_info">
                       <div id="mpicture" class="info_pic">
                           <!-- <a href="javascript:void(0);" onclick="$('#ex7').modal('show')"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2020/09/29/414dbdbf78c4661f548b529ae00856731.jpg"></a>
                           <a href="javascript:void(0);" class="info_set" onclick="$('#ex7').modal('show')"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_camera2.png" alt="사진변경"></a> -->
                       </div>
                       <p class="info_name"><b id="mnickname"></b>
                          <span class="glyphicon glyphicon-pencil"></span>
                          <a href="javascript:void(0);" onclick="$('#ex7').modal('show')"><u id="mintroduce"></u></a>
                       </p>
                       <div class="info_follow2">
                          <a href="javascript:void(0);">총조회<b id="allview"></b></a>
                          <span>·</span>
                           <a href="javascript:void(0);" onclick="viewFriendList('follower')">총후기<b id="allrev"></b></a>
                           <span>·</span>
                           <a href="javascript:void(0);" onclick="viewFriendList('following')">총스크랩<b id="allscrap"></b></a>
                       </div>
                   </div>
               </div>
            </div>


         </section>
         <!-- 마이페이지 -->
         
         <!-- 모달 -->
            <div id="ex7" class="modal">
               <div class="modal-dialog" style="width: 570px">
                  <div class="modal-content" style="padding: 0;">
                     <div class="modal-header">                        
                        <h4 class="modal-title">프로필 사진 / 자기소개 편집</h4>
                     </div>
                     <div class="modal-body" style="padding: 10px; text-align: center;">
                        <img id="vProfileImageModalSrc"
                           src="https://recipe1.ezmember.co.kr/cache/rpf/2020/09/22/025608c059b938239d591117f144545d.jpg"
                           style="max-width: 550px; max-height: 500px;">
                        <div style="margin-top: 10px;">
                           <input type="file" name="file" id="file_1"
                              style="display: none;">
                           <p>
                              <input type="text" name="self_intro" value="" class="input-sm"
                                 size="60" maxlength="100"
                                 placeholder="자기소개를 100자 이내로 작성해 주세요.">
                           </p>
                           <button type="button"
                              onclick="document.getElementById('file_1').click();"
                              class="btn btn-primary">프로필 사진 바꾸기</button>
                           <button type="button" id="profileSubmitBtn"
                              onclick="doProfileImageSubmit()" class="btn btn-primary"
                              disabled="disabled">저장</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- 모달 -->          
         
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
			<nav id="menu" style="border-bottom: 0;">

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
<script src="./js/jquery-ui.min.js"></script>
<script src="./js/jquery-modal.min.js"></script>
<script src="./js/modoo/modernizr.custom.79639.js"></script>
<script src="./js/modoo/cbpFWTabs.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   sideRanking();
   memberData();
   
   dataList();
   mypageReviewWrite();
   
   
   $('a[href="#ex7"]').click(function(event) {
      event.preventDefault();

      $(this).modal({
         fadeDuration : 250
      });
   });
   
   $('#myScrap').on('click', function() {
      $('#myWrite').removeClass();
      $('#myScrap').addClass('active');
      $('#ulul').empty();
      scrapDataList();
   });
   
   $('#myWrite').on('click', function() {
      $('#myScrap').removeClass();
      $('#myWrite').addClass('active');
      $('#ulul').empty();
      dataList();
   });
   
   $('#myReviewWrite').on('click', function() {
      $('#myReviewGet').removeClass();
      $('#myReviewWrite').addClass('active');
      $('#ululReview').empty();
      mypageReviewWrite();
      
   });
   
   $('#myReviewGet').on('click', function() {
      $('#myReviewWrite').removeClass();
      $('#myReviewGet').addClass('active');
      $('#ululReview').empty();
      mypageReviewGet();
   });
   
   var isFirst = "<%=isFirst%>";
	if(isFirst !=="true"){
		seenRecipe();	
		
	}
   
});

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
   
   
$(function() {

   [].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
      new CBPFWTabs( el );
   });

});

var dataList = function() {
   
   var id = "<%= login_id %>";
   //console.log(id);
    $.ajax({
         type:"POST",         
         data : {
            id : id
         },
         url: "mypage_public_data.do",
         success : function(json) {
            //console.log(json.array.length);       
            var result1 = "";
             if(json.array.length == 0){  
                
                     result1 += "<div class='result_none'>";
                     result1 += "<img src='https://recipe1.ezmember.co.kr/img/none_recipe.png'>";
                       result1 += "<p>레시피를 직접 올려보세요!</p> 자랑하고 싶은 나만의 레시피! 공유하고 싶은 멋진 레시피를 올려 주세요.<br>";
                    result1 += "<button type='button' onclick='location.href='./recipe_write.do';' class='btn-lg btn-primary'>레시피 등록하기</button>";
                   result1 += "</div>";

                   result1 += "<div class='input-group info_srarch'>";
                  result1 += "<input type='text' name='qs' class='form-control' placeholder='' value=''>";
                  result1 += "<span class='input-group-btn'>";
                  result1 += "<button class='btn btn-default' type='submit'>";
                    result1 += "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_search4.png'>";
                    result1 += "</button>";
                   result1 += "</span>";
                   result1 += "</div>";
               
               $('#ulul').append(result1);
               }else{
                  
                  for(var i in json.array)
                  var result = "";
                   //console.log(json[i]);
                  
                   result += "<li class='common_sp_list_li'>";
                   result += "<div class='common_sp_thumb'>";
                   result += "<a href='./recipe_view.do?rcseq=" + json.array[i]["rcseq"] + "' class='common_sp_link'>";                  
                   result += "<span class='common_vod_label'>";
                   if(json.array[i]["url"] != null){
                      result += "<img src='https://recipe1.ezmember.co.kr/img/icon_vod.png'>";
                   }else{
                      result += "";
                   }
                   result += "</span>";
                   result += "<img src='./picture/" + json.array[i]["rcseq"] + "/Thumb/"+ json.array[i]["rcseq"] +"_thumb_1.jpg'>";
                   result += "</a>";
                   result += "</div>";
                   result += "<div class='common_sp_caption'>";
                   result += "<div class='common_sp_caption_tit line2 rv'>";
                   result += "<a href='./recipe_view.do?rcseq=" + json.array[i]["rcseq"] + "'>";
                   result += json.array[i]["subject"];
                   result += "</a>";
                   result += "</div>";
                   result += "<div class='common_sp_caption_rv_name' style='display: inline-block; vertical-align: bottom;'>";
                  // result += "<a href='/profile/recipe.html?uid=48794657'>";
                   result += "<img src='" + json.array[i]["picture"] + "'>";
                   result += json.array[i]["nickname"]
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
               }  
            
         }
      });   
 }
 
var scrapDataList = function() {
   
   var id = "<%= login_id %>";
   //console.log(id);
    $.ajax({
         type:"POST",         
         data : {
            id : id
         },
         url: "mypage_scrapseq_data.do",
         success : function(json) {
            //console.log(json.scrapseq);       
            var str = json.scrapseq;
            var scrapseq = str.split(',');
            //console.log(scrapseq[0]);
            for(var i in scrapseq){
               console.log(scrapseq[i]);
               
               $.ajax({
                     type:"POST",         
                     data : {
                        rcseq : scrapseq[i]
                     },
                     url: "mypage_scrapList_data.do",
                     success : function(json) {
                        //console.log(json.scrapseq);       
                        var result1 = "";
                         if(json.array.length == 0){  
                            
                                 result1 += "<div class='result_none'>";
                                 result1 += "<img src='https://recipe1.ezmember.co.kr/img/none_recipe.png'>";
                                   result1 += "<p>레시피를 스크랩 해보세요!</p> 내가 저장하고 싶은 레시피! 다른 사람들이 올린 레시피를 스크랩 해보세요.<br>";
                               result1 += "</div>";

                               result1 += "<div class='input-group info_srarch'>";
                              result1 += "<input type='text' name='qs' class='form-control' placeholder='' value=''>";
                              result1 += "<span class='input-group-btn'>";
                              result1 += "<button class='btn btn-default' type='submit'>";
                                result1 += "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_search4.png'>";
                                result1 += "</button>";
                               result1 += "</span>";
                               result1 += "</div>";
                           
                           $('#ulul').append(result1);
                           }else{
                              
                              for(var i in json.array)
                              var result = "";
                               //console.log(json[i]);
                               
                               result += "<li class='common_sp_list_li'>";
                               result += "<div class='common_sp_thumb'>";
                               result += "<a href='./recipe_view.do?rcseq=" + json.array[i]["rcseq"] + "' class='common_sp_link'>";                  
                               result += "<span class='common_vod_label'>";
                               if(json.array[i]["url"] != null){
                                  result += "<img src='https://recipe1.ezmember.co.kr/img/icon_vod.png'>";
                               }else{
                                  result += "";
                               }
                               result += "</span>";
                               result += "<img src='./picture/" + json.array[i]["rcseq"] + "/Thumb/"+ json.array[i]["rcseq"] +"_thumb_1.jpg'>";
                               result += "</a>";
                               result += "</div>";
                               result += "<div class='common_sp_caption'>";
                               result += "<div class='common_sp_caption_tit line2 rv'>";
                               result += "<a href='./recipe_view.do?rcseq=" + json.array[i]["rcseq"] + "'>";
                               result += json.array[i]["subject"];
                               result += "</a>";
                               result += "</div>";
                               result += "<div class='common_sp_caption_rv_name' style='display: inline-block; vertical-align: bottom;'>";
                               //result += "<a href='/profile/recipe.html?uid=48794657'>";
                               if(json.array[i]["picture"] === ""){
                            		result += "<img src='./images/profile_default.jpg'>";
                               }else{
                              		result += "<img src='" + json.array[i]["picture"] + "'>";
                               }
                               result += json.array[i]["nickname"]
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
                           }  
                         
                        
                     }
                  });  
            }
            
            
            
         }
      });   
 }
 
var mypageReviewWrite = function() {
   var id = "<%= login_id %>";
    $.ajax({
      type:"POST",   
      data : {
       id : id  
      },
      url: "mypage_review_write_data.do",
      success : function(json) {
         
         //$('#totalRecord').append(json.totalRecord);       
         var result1 = "";
         var result = "";
         console.log(json.length);
         for(var i in json){
            if(json.length == 0){
               result1 += "<div class='result_none'>";
               result1 += "<img src='https://recipe1.ezmember.co.kr/img/none_feel.png'>";
               result1 += "<p>직접 요리해보셨나요?</p>";
                result1 += "요리후기를 남겨주세요!<br>";
                result1 += "<button type='button' onclick='location.href='./recipe_review_write.do';' class='btn-lg btn-primary'>후기 작성</button>";
                result1 += "</div>";
                
                $('#ululReview').append(result1);
            }else{              
                  var result = "";
                  result += "<li class='common_sp_list_li'>";
                  result += "<div class='common_sp_thumb'>";
                  result += "<a href='./recipe_view.do?rcseq=" + json[i]["rcseq"] + "' class='common_sp_link'>";
                  result += "<img src='http://localhost:8080/FinalProject/rev_pic/"+json[i]["rvseq"]+"/" + json[i]["rvfilename"] + "'>";
                  result += "</a>";
                  result += "</div>";
                  result += "<div class='common_sp_caption'>";
                  result += "<div class='common_sp_caption_rv_box'>";
                  result += "<div class='common_sp_caption_tit line3 rv'>" + json[i]["rvcontent"] + "</div>";
                  result += "<div class='common_sp_caption_rv_name' style='display: inline-block; vertical-align: bottom; cursor: pointer;' onclick='location.href='./recipe_view.do?rcseq=" + json[i]["rcseq"] + "'>";
                  result += "<div>" + json[i]["nickname"] + "</div>";
                  result += "</div>";
                  result += "<div class='common_sp_caption_rv' style='display: inline-block;'>";
             
                  result += "<span class='common_sp_caption_rv_star'>";
                  for(var j = 0; j < json[i]["star"]; j++){
                     result += "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png'>";
                   }
                  result += "</span>";
             
                  result += "</div>";
                  result += "<span class='common_sp_caption_buyer' style='display: block;'>" + json[i]["rvwdate"] + "</span>";
                  result += "</div>";
                  result += "</div>";
                  result += "</li>";
             
                  $('#ululReview').append(result);
            }
                              
         }
                        
      }
   });   
}

var mypageReviewGet = function() {
   var id = "<%= login_id %>";
    $.ajax({
      type:"POST",   
      data : {
       id : id  
      },
      url: "mypage_review_get_data.do",
      success : function(json) {
         
         //$('#totalRecord').append(json.totalRecord);       
         var result1 = "";
         var result = "";
         console.log(json.length);
         for(var i in json){
            if(json.length == 0){
               result1 += "<div class='result_none'>";
               result1 += "<img src='https://recipe1.ezmember.co.kr/img/none_feel.png'>";
               result1 += "<p>받은 요리후기가 없습니다.</p>";
                result1 += "감사의 마음이 담긴 요리후기에 답글을 남겨주세요.<br>";
                result1 += "따듯한 마음을 주고 받을 수 있어요<br>";
                result1 += "</div>";
                
                $('#ululReview').append(result1);
            }else{              
                  var result = "";
                  result += "<li class='common_sp_list_li'>";
                  result += "<div class='common_sp_thumb'>";
                  result += "<a href='./recipe_view.do?rcseq=" + json[i]["rcseq"] + "' class='common_sp_link'>";
                  result += "<img src='http://localhost:8080/FinalProject/rev_pic/"+json[i]["rvseq"]+"/" + json[i]["rvfilename"] + "'>";
                  result += "</a>";
                  result += "</div>";
                  result += "<div class='common_sp_caption'>";
                  result += "<div class='common_sp_caption_rv_box'>";
                  result += "<div class='common_sp_caption_tit line3 rv'>" + json[i]["rvcontent"] + "</div>";
                  result += "<div class='common_sp_caption_rv_name' style='display: inline-block; vertical-align: bottom; cursor: pointer;' onclick='location.href='./recipe_view.do?rcseq=" + json[i]["rcseq"] + "'>";
                  result += "<div>" + json[i]["nickname"] + "</div>";
                  result += "</div>";
                  result += "<div class='common_sp_caption_rv' style='display: inline-block;'>";
             
                  result += "<span class='common_sp_caption_rv_star'>";
                  for(var j = 0; j < json[i]["star"]; j++){
                     result += "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png'>";
                   }
                  result += "</span>";
             
                  result += "</div>";
                  result += "<span class='common_sp_caption_buyer' style='display: block;'>" + json[i]["rvwdate"] + "</span>";
                  result += "</div>";
                  result += "</div>";
                  result += "</li>";
             
                  $('#ululReview').append(result);
            }
                              
         }
                        
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

var memberData = function() {
	   var id = "<%= login_id %>";
	    $.ajax({
	      type:"POST",   
	      data : {
	       kind : "allview",
	       id : id  
	      },
	      url: "mypage_memberData.do",
	      success : function(json) {
	         //console.log(json.allview);
	         $('#allview').empty();
	          $('#allview').append(json.allview);        
	      }
	   });   
	    
	    $.ajax({
	        type:"POST",   
	        data : {
	         kind : "allrev",
	         id : id  
	        },
	        url: "mypage_memberData.do",
	        success : function(json) {
	           //console.log(json.allrev);
	           $('#allrev').empty();
	            $('#allrev').append(json.allrev);     
	                    
	        }
	     });
	    
	    $.ajax({
	        type:"POST",   
	        data : {
	         kind : "allscrap",
	         id : id  
	        },
	        url: "mypage_memberData.do",
	        success : function(json) {
	           //console.log(json.allscrap);
	           $('#allscrap').empty();
	            $('#allscrap').append(json.allscrap);     
	                    
	        }
	     });
	    
	    $.ajax({
	        type:"POST",   
	        data : {
	         kind : "memberInfo",
	         id : id  
	        },
	        url: "mypage_memberData.do",
	        success : function(json) {
	           //console.log(json);
	                 
	           $('#mintroduce').empty();
	           $('#mintroduce').append(json[0]["introduce"]);
	           
	           $('#mnickname').empty();
	           $('#mnickname').append(json[0]["nickname"]);
	           
	           var result = "";
	           
	           result += "<a href='#' onclick=\"$('#ex7').modal('show')\"><img src='https://recipe1.ezmember.co.kr/cache/rpf/2020/09/29/414dbdbf78c4661f548b529ae00856731.jpg'></a>";
	           result += "<a href='#' class='info_set' onclick=\"$('#ex7').modal('show')\"><img src='https://recipe1.ezmember.co.kr/img/mobile/icon_camera2.png' alt='사진변경'></a>";   
	           
	           $('#mpicture').empty();
	           $('#mpicture').append(result);
	           
	           if(json[0]["introduce"] == ""){
	              var result1 = "";
	              result1 += "<input type='text' name='self_intro' value='' class='input-sm' size='60' maxlength='100' placeholder='자기소개를 100자 이내로 작성해 주세요.'>";
	              $('#m_intro').append(result1);
	           }else{
	              var result2 = "";
	              result2 += "<input type='text' name='self_intro' value='" + json[0]["introduce"] + "' class='input-sm' size='60' maxlength='100' placeholder='자기소개를 100자 이내로 작성해 주세요.'>";
	              $('#m_intro').empty();
	              $('#m_intro').append(result2);
	           }
	           
	        }
	     });  
	}

</script>

</body>
</html>