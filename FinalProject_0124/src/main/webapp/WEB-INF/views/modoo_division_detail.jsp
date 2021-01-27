<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
String cat1 = request.getParameter("cat1");
String cat2 = request.getParameter("cat2");
System.out.println(cat1);
System.out.println(cat2);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/skel.min.js"></script>
<script type="text/javascript" src="./js/util.js"></script>
<script type="text/javascript" src="./js/main.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/modoo/top_button.js"></script>
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/modoo/division.css" />
<link rel="stylesheet" href="./css/modoo/top_button.css" />
<title>모두의 레시피</title>
<script>
   var _IS_SEARCH_RESTRICT = false;
   $(document).ready(function() {
      /* ToggleCategory(); */
      var cat1 = "<%=cat1 %>";
      var cat2 = "<%=cat2 %>";
               
         $.ajax({
            type:"POST",       
            data : {
            	cat1 : cat1,
            	cat2 : cat2
            },
            url: "division_detail.do",
            success : function(json) {
                       //console.log(json.totalRecord);  
                       //console.log(json.array[0]);
               $('#detailRecord').append(json.totalRecord);       
                       
               for(var i in json.array){
                  var result = "";
                  //console.log(json[i]);
                  result += "<li class='common_sp_list_li'>";
                  result += "<div class='common_sp_thumb'>";
                  result += "<a href='./recipe_view.do?rcseq=" + json.array[i]["rcseq"] + "' class='common_sp_link'>"; 
                  result += "<span class='common_vod_label'><img src='https://recipe1.ezmember.co.kr/img/icon_vod.png'></span>";
                  result += "<img src='" + json.array[i]["rfilename"] + "'>";
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
                  result += "<span class='common_sp_caption_rv_ea'>(" + json.array[i]["rev"] + ")</span> <span";
                  result += "class='common_sp_caption_buyer'";
                  result += "style='vertical-align: middle;'>조회수 " + json.array[i]["hit"] + "</span>";
                  result += "</div>";
                  result += "</div>";
                  result += "</li>";
                  
                  $('#ulul').append(result);
                  
                  
               }
               
               
            }
         });
   
      rankingListStar();
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
         $('#id_search_category_img').attr("src",
               'https://recipe1.ezmember.co.kr/img/icon_arrow9_up.gif');
      } else {
         $('#id_search_category_text').text('카테고리 열기');
         $('#id_search_category_img').attr("src",
               'https://recipe1.ezmember.co.kr/img/icon_arrow9_down.gif');
      }
      
   }
   
   var rankingListStar = function() {
       $.ajax({
         type:"POST",         
         url: "ranking_view_star.do",
         success : function(json) {
                          
            
            $('#totalRecord').append(json.totalRecord);       
                    
            for(var i = 1; i <= 5; i++){           
               
                 var result = "";                  
                 result += "<li class=''>";
             	   result += "<p>" + i + "</p>";
        		   result += "<a href'./recipe_view.do?rcseq=" + json.array[i-1]["rcseq"] + "'>" + json.array[i-1]["subject"] + "</a>";
         		   result += "</li>";
                 $('#rankingList').append(result);                     
                   
            }                   
           
         }
      });   
 } 
</script>
</head>
<body>

   <div id=wrapper>
      <div id="main">
         <div class="inner">

            <!-- 상단 -->
            <header id="header">
               <!-- 로고 지우지 마세요 -->
               <div class="logo_wrap">
                  <p class="logo_p">
                     <a href="./main.do" class="logo"> <img
                        src="./images/logo/modoo_logo07.svg" alt="logo" /></a>
                  </p>
               </div>
               <!-- 로고 지우지 마세요 -->

               <!-- 검색바 지우지 마세요 -->
               <section id="search" class="alt">
                  <form method="post" action="#">
                     <input type="text" name="query" id="query" placeholder="재료명, 요리명" />
                  </form>
               </section>
               <!-- 검색바 지우지 마세요 -->

               <!-- 회원 정보 지우지 마세요 -->
               <ul class="icons">
                  <li><a href="./login.do"><span class="label">로그인</span></a></li>
                  <li><a href="./recipe_write.do"><span class="label">레시피
                           등록</span></a></li>
                  <li><a href="#"><span class="label">관리자</span></a></li>
               </ul>
               <!-- 회원 정보 지우지 마세요 -->
            </header>
            <!-- 상단 끝 -->


            <!-- 컨텐츠 -->
            <div>
               <!-- 분류 내용 시작-->
               <div id="contents_area_full" style="clear: both;">
               <!-- 상단 카테고리 시작 -->
               <div class="s_list_ea tit">전체레시피 <span>전체 레시피 한번에 모아보기!</span></div>
               <div id="id_search_category" style="" class="rcp_m_cate">
                  <table cellspacing="0" cellpadding="0">
                     <tbody>
                        <tr>
                           <th style="padding-top: 10px;">
                              <span>종류별</span>
                              <span>재료별</span>
                           </th>
                           <td>
                              <!-- toggle 카테고리 -->
                              <div class="rcp_cate st3">
                                 <!-- 종류별 -->
                                 <div class="cate_list">
                                    <a href="javascript:goSearchRecipe('cat4','')"
                                       class="active">전체</a><a
                                       href="javascript:goSearchRecipe('cat4','63')">밑반찬</a><a
                                       href="javascript:goSearchRecipe('cat4','56')">메인반찬</a><a
                                       href="javascript:goSearchRecipe('cat4','54')">국/탕</a><a
                                       href="javascript:goSearchRecipe('cat4','55')">찌개</a><a
                                       href="javascript:goSearchRecipe('cat4','60')">디저트</a><a
                                       href="javascript:goSearchRecipe('cat4','53')">면/만두</a><a
                                       href="./division_detail.do">밥/죽/떡</a><a
                                       href="javascript:goSearchRecipe('cat4','61')">퓨전</a><a
                                       href="javascript:goSearchRecipe('cat4','57')">김치/젓갈/장류</a><a
                                       href="javascript:goSearchRecipe('cat4','58')">양념/소스/잼</a><a
                                       href="javascript:goSearchRecipe('cat4','65')">양식</a><a
                                       href="javascript:goSearchRecipe('cat4','64')">샐러드</a><a
                                       href="javascript:goSearchRecipe('cat4','68')">스프</a><a
                                       href="javascript:goSearchRecipe('cat4','66')">빵</a><a
                                       href="javascript:goSearchRecipe('cat4','69')">과자</a><a
                                       href="javascript:goSearchRecipe('cat4','59')">차/음료/술</a><a
                                       href="javascript:goSearchRecipe('cat4','62')">기타</a>
                                 </div>
                                 <!-- 재료별 -->
                                 <div class="cate_list">
                                    <a href="javascript:goSearchRecipe('cat3','')"
                                       class="active">전체</a><a
                                       href="javascript:goSearchRecipe('cat3','70')">소고기</a><a
                                       href="javascript:goSearchRecipe('cat3','71')">돼지고기</a><a
                                       href="javascript:goSearchRecipe('cat3','72')">닭고기</a><a
                                       href="javascript:goSearchRecipe('cat3','23')">육류</a><a
                                       href="javascript:goSearchRecipe('cat3','28')">채소류</a><a
                                       href="javascript:goSearchRecipe('cat3','24')">해물류</a><a
                                       href="javascript:goSearchRecipe('cat3','50')">달걀/유제품</a><a
                                       href="javascript:goSearchRecipe('cat3','33')">가공식품류</a><a
                                       href="javascript:goSearchRecipe('cat3','47')">쌀</a><a
                                       href="javascript:goSearchRecipe('cat3','32')">밀가루</a><a
                                       href="javascript:goSearchRecipe('cat3','25')">건어물류</a><a
                                       href="javascript:goSearchRecipe('cat3','31')">버섯류</a><a
                                       href="javascript:goSearchRecipe('cat3','48')">과일류</a><a
                                       href="javascript:goSearchRecipe('cat3','27')">콩/견과류</a><a
                                       href="javascript:goSearchRecipe('cat3','26')">곡류</a><a
                                       href="javascript:goSearchRecipe('cat3','34')">기타</a>
                                 </div>
                              </div>
                              <!-- toggle 카테고리 끝-->
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
                     <span>
                        <img id="id_search_category_img" src="https://recipe1.ezmember.co.kr/img/icon_arrow9_up.gif">
                     </span>
                  </a>
               </div>
               <!-- 카테고리 버튼 -->

               <form id="srRecipeFrm" name="srRecipeFrm" method="get" action="/recipe/list.html">
                  <input type="hidden" name="q" value=""> 
                  <input type="hidden" id="q_query" name="query" value=""> 
                  <input type="hidden" name="cat1" value=""> 
                  <input type="hidden" name="cat2" value=""> 
                  <input type="hidden" name="cat3" value=""> 
                  <input type="hidden" name="cat4" value="">
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
                  <div class="m_list_tit">
                     총 <b><span id="detailRecord"></span></b>개의 맛있는 레시피가 있습니다.
                     <ul class="nav nav-tabs2 pull-right" style="position: relative;">
                        <li role="presentation">
                           <a href="javascript:void(0);" onclick="goSearchRecipe('order','date')">최신순</a>
                        </li>
                        <li role="presentation" class="active">
                           <a href="javascript:void(0);" onclick="goSearchRecipe('order','reco')">추천순</a>
                        </li>
                     </ul>
                  </div>

                  <ul id="ulul" class="common_sp_list_ul ea4" style="padding: 0 0 0 8px;">
                     
                     <!-- 데이터 -->
                     <!-- <li class="common_sp_list_li">
                        <div class="common_sp_thumb">
                           <a href="./recipe_view.do?" class="common_sp_link"> 
                              <span class="common_vod_label"><img src="https://recipe1.ezmember.co.kr/img/icon_vod.png"></span>
                              <img src="https://recipe1.ezmember.co.kr/cache/recipe/2019/05/25/39ac1e73e998e88da300d38663242f0a1_m.jpg">
                           </a>
                        </div>
                        <div class="common_sp_caption">
                           <div class="common_sp_caption_tit line2 rv">
                              <a href="./recipe_view.do">
                              버섯으로 관자 느낌 내는
                              방법! 새송이버섯간장버터구이 만들기
                              </a>
                           </div>
                           <div class="common_sp_caption_rv_name"
                              style="display: inline-block; vertical-align: bottom;">
                              <a href="/profile/recipe.html?uid=48794657">루던</a>
                           </div>
                           <div class="common_sp_caption_rv">
                              <span class="common_sp_caption_rv_star"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
                              <span class="common_sp_caption_rv_ea">(112)</span> <span
                                 class="common_sp_caption_buyer"
                                 style="vertical-align: middle;">조회수 10.1만</span>
                           </div>
                        </div>
                     </li>
                     
                     <li class="common_sp_list_li">
                        <div class="common_sp_thumb">
                           <a href="/recipe/6894323" class="common_sp_link"> <span
                              class="common_vod_label"><img
                                 src="https://recipe1.ezmember.co.kr/img/icon_vod.png"></span>
                              <img
                              src="https://recipe1.ezmember.co.kr/cache/recipe/2018/08/17/d1d0c5999686a5ec11e426b79abf4a1a1_m.jpg">
                           </a>
                        </div>
                        <div class="common_sp_caption">
                           <div class="common_sp_caption_tit line2 rv">고기처럼 쫄깃한 밥도둑 반찬
                              '새송이버섯 간장버터구이'레시피</div>
                           <div class="common_sp_caption_rv_name"
                              style="display: inline-block; vertical-align: bottom;">
                              <a href="/profile/recipe.html?uid=ksy9623">뽀유TV</a>
                           </div>
                           <div class="common_sp_caption_rv">
                              <span class="common_sp_caption_rv_star"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
                              <span class="common_sp_caption_rv_ea">(352)</span> <span
                                 class="common_sp_caption_buyer"
                                 style="vertical-align: middle;">조회수 45.2만</span>
                           </div>
                        </div>
                     </li>
                     
                     <li class="common_sp_list_li">
                        <div class="common_sp_thumb">
                           <a href="/recipe/6881099" class="common_sp_link"> <img
                              src="https://recipe1.ezmember.co.kr/cache/recipe/2017/12/18/58dd1a9a0d0ef8ff0c60dc35965ea09d1_m.jpg">
                           </a>
                        </div>
                        <div class="common_sp_caption">
                           <div class="common_sp_caption_tit line2 rv">완전맛있는 차돌박이찜!
                              미소된장마요소스도 함께~</div>
                           <div class="common_sp_caption_rv_name"
                              style="display: inline-block; vertical-align: bottom;">
                              <a href="/profile/recipe.html?uid=boru130">보루빵</a>
                           </div>
                           <div class="common_sp_caption_rv">
                              <span class="common_sp_caption_rv_star"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
                              <span class="common_sp_caption_rv_ea">(97)</span> <span
                                 class="common_sp_caption_buyer"
                                 style="vertical-align: middle;">조회수 15.9만</span>
                           </div>
                        </div>
                     </li>
                     
                     <li class="common_sp_list_li">
                        <div class="common_sp_thumb">
                           <a href="/recipe/6881815" class="common_sp_link"> <img
                              src="https://recipe1.ezmember.co.kr/cache/recipe/2018/07/17/7c94e88fca13cf73f8e0e473e02357e01_m.jpg">
                           </a>
                        </div>
                        <div class="common_sp_caption">
                           <div class="common_sp_caption_tit line2 rv">칠리새우ㅣ쉬림프 박스 만들기</div>
                           <div class="common_sp_caption_rv_name"
                              style="display: inline-block; vertical-align: bottom;">
                              <a href="/profile/recipe.html?uid=gag91721">킨다</a>
                           </div>
                           <div class="common_sp_caption_rv">
                              <span class="common_sp_caption_rv_star"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
                              <span class="common_sp_caption_rv_ea">(334)</span> <span
                                 class="common_sp_caption_buyer"
                                 style="vertical-align: middle;">조회수 38.6만</span>
                           </div>
                        </div>
                     </li>
                     
                     <li class="common_sp_list_li">
                        <div class="common_sp_thumb">
                           <a href="/recipe/6877253" class="common_sp_link"> <span
                              class="common_vod_label"><img
                                 src="https://recipe1.ezmember.co.kr/img/icon_vod.png"></span>
                              <img
                              src="https://recipe1.ezmember.co.kr/cache/recipe/2017/09/28/d445feff73d436cbea92af449c3f66ac1_m.jpg">
                           </a>
                        </div>
                        <div class="common_sp_caption">
                           <div class="common_sp_caption_tit line2 rv">비엔나 만두 강정</div>
                           <div class="common_sp_caption_rv_name"
                              style="display: inline-block; vertical-align: bottom;">
                              <a href="/profile/recipe.html?uid=41823403">찌니훗</a>
                           </div>
                           <div class="common_sp_caption_rv">
                              <span class="common_sp_caption_rv_star"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
                              <span class="common_sp_caption_rv_ea">(73)</span> <span
                                 class="common_sp_caption_buyer"
                                 style="vertical-align: middle;">조회수 12.4만</span>
                           </div>
                        </div>
                     </li>
                     
                     <li class="common_sp_list_li">
                        <div class="common_sp_thumb">
                           <a href="/recipe/6846168" class="common_sp_link"> <img
                              src="https://recipe1.ezmember.co.kr/cache/recipe/2016/04/08/8448b043b2e1eb6cb55041b0bffb1a281_m.jpg">
                           </a>
                        </div>
                        <div class="common_sp_caption">
                           <div class="common_sp_caption_tit line2 rv">초간단 럭셔리요리@
                              매콤참치퀘사디아</div>
                           <div class="common_sp_caption_rv_name"
                              style="display: inline-block; vertical-align: bottom;">
                              <a href="/profile/recipe.html?uid=hanakikiki">kimkim</a>
                           </div>
                           <div class="common_sp_caption_rv">
                              <span class="common_sp_caption_rv_star"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
                                 src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
                              <span class="common_sp_caption_rv_ea">(40)</span> <span
                                 class="common_sp_caption_buyer"
                                 style="vertical-align: middle;">조회수 8.4만</span>
                           </div>
                        </div>
                     </li> -->
                     <!-- /데이터 -->
                  </ul>
                  <nav class="text-center">
                     <ul class="pagination">
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
                        <li><a href="/recipe/list.html?order=reco&amp;page=11"
                           aria-label="Next"><span aria-hidden="true">&gt;</span></a></li>
                     </ul>
                  </nav>
               </ul>
            <!-- 앨범게시판 끝 -->
         </div>
         <!-- 컨텐츠 끝 -->
     
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

         <!-- 카테고리(Menu) -->
         <nav id="menu" style="border-bottom: 0;">
            <header class="major">
               <h2>카테고리</h2>
            </header>
            <ul>
               <li><span class="opener">분류</span>
                  <ul class="modoo_nav">
                     <li><a href="./division.do">종류별</a></li>
                     <li><a href="./division.do">재료별</a></li>
                  </ul>
               </li>
               <li><a href="./review.do">후기</a></li>
               <li><a href="./ranking.do">랭킹</a></li>
            </ul>
         </nav>
         <!-- 카테고리 끝 -->

         <!-- 최근에 본 레시피 -->
         <section>
            <header class="major">
               <h2>내가 본 레시피</h2>
               <ul class="recipestore">
                  <li class=""><a href="">내가 본 레시피<span> (38)</span></a></li>
               </ul>
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
            <ul id="rankingList" class="recipestore">
               <!-- <li class="">
                  <p>1</p> <a href="#">꿀떡꿀떡 넘어가는 꿀떡버거</a>
               </li>
               <li class="">
                  <p>2</p> <a href="#">오지는 조합 오지치즈후라이~!</a>
               </li>
               <li class="">
                  <p>3</p> <a href="#">건강냄새 물씬~ 쌍화탕 한방닭죽</a>
               </li>
               <li class="">
                  <p>4</p> <a href="#">카아악~! 맵다매워! 불닭치면</a>
               </li>
               <li class="">
                  <p>5</p> <a href="#">막창? 떡뽂이? 이건 꿀조합일세!</a>
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
         <footer id="footer">
            <p class="copyright">&copy; Copyright 모두의 레시피. All Rights Reserved</p>
         </footer>
         <!-- 푸터 끝 -->
      </div>
   </div>
   <!-- 사이드바 -->

   </div>
</body>

</html>
