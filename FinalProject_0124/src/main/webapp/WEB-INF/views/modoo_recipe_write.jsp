<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%
	String login_id = "";
	String login_state = "";
	StringBuffer login_user = new StringBuffer();
	
	if(session.getAttribute("id") == null){
		out.println("<script type='text/javascript'>");
		out.println("alert('레시피 등록은 로그인이 필요합니다.');");
		out.println("location.href='./login.do'");
		out.println("</script>");
		/* }else if(session.getAttribute("id").equals("admin")){
		
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
		 login_user.append("<li><a href='./admin_main.do'><span class='label'>관리자</span></a></li>"); */
	}else{
		String rcwriter = (String) session.getAttribute("id");
		login_user.append("<li id='drop_nav' class='wrapper-dropdown-5'><a style='padding-right:20px'>" + rcwriter + "님</a>");
		login_user.append("	<ul class='dropdown'>");
		login_user.append("		<li><a href='./mypage_public.do'><span class='label'>마이페이지</span></a></li>");	
		login_user.append("		<li><a href='./user_modify.do'><i class='icon-remove'></i>회원정보수정</a></li>");
		login_user.append(login_state = "<li><a href='./logout.do'><span class='label'>로그아웃</span></a></li>");
		login_user.append("	</ul>");
		login_user.append("</li>");
		login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
		
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
<link rel="stylesheet" href="./css/base/jquery-ui.css">
<link rel="stylesheet" href="./css/modoo/recipe_write.css" />
<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/font_20200413.css" />
<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/font-awesome.min.css" />
<script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/jquery-1.11.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="//static.criteo.net/js/ld/publishertag.js"></script>

</head>
<body>
   <div id="wrapper">
      <div id="main">
         <div class="inner">

            <!-- 상단 -->
            <header id="header">
               <div class="logo_wrap">
                  <p class="logo_p">
                     <a href="./main.do" class="logo"><img
                        src="./images/logo/modoo_logo07.svg" alt="logo" /></a>
                  </p>
               </div>

               <section id="search" class="alt">
                  <form method="post" action="#">
                     <input type="text" name="query2" id="query2" placeholder="재료명, 요리명" />
                  </form>
               </section>

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
            
            <!-- 레시피 등록 시작-->
            <form action="recipeUpload.do" method="post" id="writeForm" enctype="multipart/form-data">
            	<input type="hidden" name="rcwriter" value="<%=rcwriter%>"/>
           		<div class="container recipe_regi">
           			<div class="regi_center">
           				<div class="regi_title">
           					레시피 등록
           					<div class="tit_right">
           						<a href="javascript:openStepGuide();">
           							<img src="./images/write/btn_tip.gif" alt="단계별 추가 정보 입력 안내">
           						</a>
           						<a href="javascript:void(0)" id="btnRecipeInsertGuide">
           							<img src="./images/write/btn_guide.gif" alt="레시피등록안내">
           						</a>
           					</div>
           				</div>
           				
           				<div class="cont_box pad_l_60">
           					<div id="divMainPhotoUpload" class="cont_pic2">
           						<input type="hidden" name="main_photo" id="main_photo" value="" />
           						<input type="hidden" name="new_main_photo" id="new_main_photo" value="" /> 
           						<input type="hidden" name="del_main_photo" id="del_main_photo" value="" />
           						<div style="position: absolute; left: -3000px">
           							<input type="file" class="thumb" name="q_main_file" id="q_main_file" file_gubun="main" accept="jpeg,png,gif,JPG" style="display:; width: 0px; height: 0px; font-size: 0px;" text=""/>
           						</div>
           						<div id="divMainPhotoBox" is_over="0">
           							<img id="mainPhotoHolder" onclick="browseMainFile()" src="https://recipe1.ezmember.co.kr/img/pic_none4.gif" style="width: 250px; height: 250px; cursor: pointer">
           						</div>
           					</div>
           					
           					<div class="cont_line">
           						<p class="cont_tit4">레시피 제목</p>
           						<input style="width:600px;display: inline-block;" type="text" name="cok_title" id="cok_title" value="" class="form-control" placeholder="예) 소고기 미역국 끓이기" />
           					</div>
           					
           					<div class="cont_line pad_b_25">
           						<p class="cont_tit4">요리소개</p>
           						<textarea name="cok_intro" id="cok_intro" class="form-control step_cont" placeholder="이 레시피의 탄생배경을 적어주세요. 예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요. 어머니로부터 배운 미역국 레시피를 남편의 입맛에 맞게 고안했습니다."></textarea>
           					</div>
           					
           					<div class="cont_line pad_b_25">
           						<p class="cont_tit4">동영상</p>
           						<input type="hidden" name="video_photo" id="video_photo" value=""> 
           						<input type="hidden" name="new_video_photo" id="new_video_photo" value="">
           						<input type="hidden" name="del_video_photo" id="del_video_photo" value="">
           						<input type="hidden" name="cok_video_src" id="cok_video_src" value="">
           						<textarea name="cok_video_url" id="cok_video_url" class="form-control step_cont" prev_url="" placeholder="동영상 주소를 입력하세요. 예) http://youtu.be/lA0Bxo3IZmM" style="height: 100px; width:54%;<!-- 380px --> resize: none;"></textarea>
           						<div style="position: absolute; left: -3000px">
           							<input type="file" name="q_video_file" id="q_video_file" file_gubun="video" accept="jpeg,png,gif,JPG" style="display:; width: 0px; height: 0px; font-size: 0px;" text="" />
								</div>
								<div id="divVideoPhotoBox" is_over="0" class="thumb_m">
									<img id="videoPhotoHolder" src="https://recipe1.ezmember.co.kr/img/pic_none5.gif" style="width: 177px; height: 100px; border:1px solid #e1e1e1; border-radius: 5px;">
								</div>
							</div>
							
							<div class="cont_line">
								<p class="cont_tit4">카테고리</p>
								<select name="cok_sq_category_2" id="cok_sq_category_2" text="종류별">
									<option value="">종류별</option>
									<option value="63">밑반찬</option>
									<option value="56">메인반찬</option>
									<option value="54">국/탕</option>
									<option value="55">찌개</option>
									<option value="60">디저트</option>
									<option value="53">면/만두</option>
									<option value="52">밥/죽/떡</option>
									<option value="61">퓨전</option>
									<option value="57">김치/젓갈/장류</option>
									<option value="58">양념/소스/잼</option>
									<option value="65">양식</option>
									<option value="64">샐러드</option>
									<option value="68">스프</option>
									<option value="66">빵</option>
									<option value="69">과자</option>
									<option value="59">차/음료/술</option>
									<option value="62">기타</option>
								</select>
								<select name="cok_sq_category_1" id="cok_sq_category_1" text="재료별">
									<option value="">재료별</option>
									<option value="70">소고기</option>
									<option value="71">돼지고기</option>
									<option value="72">닭고기</option>
									<option value="23">육류</option>
									<option value="28">채소류</option>
									<option value="24">해물류</option>
									<option value="50">달걀/유제품</option>
									<option value="33">가공식품류</option>
									<option value="47">쌀</option>
									<option value="32">밀가루</option>
									<option value="25">건어물류</option>
									<option value="31">버섯류</option>
									<option value="48">과일류</option>
									<option value="27">콩/견과류</option>
									<option value="26">곡류</option>
									<option value="34">기타</option>
								</select>
								<span class="guide" style="margin: -22px 0 0 146px;">
									분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.
								</span>
							</div>
						</div>
						
						
						<div class="cont_box pad_l_60">
							<span class="guide mag_b_15" style="width: 100%;">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</span>
							<div class="mag_b_25 ui-sortable" id="divMaterialGroupArea">
								<li id="liMaterialGroup_1">
									<p class="cont_tit6 st2 mag_r_15">
										<input type="text" name="material_group_title_1" id="material_group_title_1" value="재료" class="form-control" style="font-weight: bold; font-size: 18px; width: 210px;" readonly="readonly"/>
										<span class="cont_tit_btn"></span>
									</p>
									<ul id="divMaterialArea_1" class="ui-sortable"></ul>
									<div class="btn_add" style="margin: 20px auto; width: 70%;">
										<button id="addMaterial" class="btn btn-default">
											<span class="glyphicon glyphicon-plus-sign"></span>추가
										</button>
									</div>
								</li>
							</div>
						</div>
						
						<div class="cont_box pad_l_60">
							<!--  <input type="file" name="file" id="multifile_1" file_gubun="step" style="display: none;" multiple=""> -->
							<p class="cont_tit3">
							요리순서
							<!-- <button type="button" onclick="document.getElementById('multifile_1').click();" class="btn-sm btn-default">
								<span class="glyphicon glyphicon-plus"></span> 순서사진 한번에 넣기
							</button> -->
							</p>
							<span class="guide mag_b_15">
								<b>요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.</b> <br>
								 예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.<br>
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운 맛이 사라집니다.<br> 
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;꿀을 조금 넣어주세요 ▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다.
							 </span>
							 
							 <div id="divStepArea" class="ui-sortable"><!--step area--></div>
							 
							 <!-- step template -->
							 <div id="divStepTemplate" style="display: none">
							 	<div id="divStepItem_STEP" class="step">
							 		<p id="divStepNum_STEP" class="cont_tit2_1" style="cursor: pointer">Step 1</p>
							 		<div id="divStepText_STEP" style="display: inline-block">
							 			<textarea name="step_text_STEP[]" id="step_text_STEP" class="form-control step_cont" placeholder="" style="height: 160px; width: 430px; resize: none;"></textarea>
							 		</div>
							 		<div id="divStepUpload_STEP" style="display: inline-block">
							 			<input type="hidden" name="step_no[]" id="step_no_STEP" value="">
							 			<input type="hidden" name="step_photo[]" id="step_photo_STEP" value=""> 
							 			<input type="hidden" name="new_step_photo[]" id="new_step_photo_STEP" value="">
							 			<input type="hidden" name="del_step_photo[]" id="del_step_photo_STEP" value="">
							 			<div style="position: absolute; left: -3000px">
							 				<input type="file" class="step" name="q_step_file_STEP" id="q_step_file_STEP" file_gubun="step" accept="jpeg,png,gif,JPG" style="display:; width: 0px; height: 0px; font-size: 0px;" text="">
							 			</div>
							 			<div id="divStepPhotoBox_STEP" is_over="0">
							 				<img id="stepPhotoHolder_STEP" onclick="browseStepFile(__STEP)" src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" width="160" height="160" style="cursor: pointer">
							 			</div>
							 		</div>
							 		
							 		<!--  퀵 사이드바 -->
							 		<div id="divStepBtn_STEP" class="step_btn" style="display: none">
							 			<a href="javascript:void(0)"><span class="glyphicon glyphicon-chevron-up moveUp"></span></a> 
							 			<a href="javascript:void(0)"><span class="glyphicon glyphicon-chevron-down moveDown"></span></a> 
										<a href="javascript:adjustStep(__STEP)"><b>맞춤</b></a> 
										<a href="javascript:addStep(__STEP)"><span class="glyphicon glyphicon-plus"></span></a> 
                                    	<a href="javascript:delStep(__STEP)"><span class="glyphicon glyphicon-remove"></span></a>
									</div>
								</div>
							</div>
							
							<!-- 요리순서 추가 시작 -->
							<div class="btn_add mag_b_25" style="padding: 0 0 20px 180px; width: 820px;">
								<button type="button" onclick="addStep()" class="btn btn-default">
									<span class="glyphicon glyphicon-plus-sign"></span>순서추가
								</button>
							</div>
							
							<!--  요리완성사진 시작 -->
							<p class="cont_tit4">요리완성사
							<!-- <input type="file" name="file" id="multifile_2" file_gubun="work" style="display: none;" multiple="">
							<br>
							<button type="button" onclick="document.getElementById('multifile_2').click();" class="btn-sm btn-default">
								<span class="glyphicon glyphicon-plus"></span> 사진 한번에 넣기
							</button> -->
							</p>
							
							<div id="divWorkArea" style="display: inline-block" class="ui-sortable">
								<div id="divWorkUpload_1" class="complete_pic">
									<input type="hidden" name="work_photo[]" id="work_photo_1" value=""> 
									<input type="hidden" name="new_work_photo[]" id="new_work_photo_1" value="">
									<input type="hidden" name="del_work_photo[]" id="del_work_photo_1" value="">
									<div style="position: absolute; left: -3000px">
										<input type="file" class="work" name="q_work_file_1" id="q_work_file_1" file_gubun="work" accept="jpeg,png,gif,JPG" style="display:; width: 0px; height: 0px; font-size: 0px;" text=""/>
									</div>
									<div id="divWorkPhotoBox_1" is_over="0">
										<a href="#" class="pic_del" style="display: none"></a> 
										<img id="workPhotoHolder_1" onclick="browseWorkFile(1)" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 140px; height: 140px; cursor: pointer">
									</div>
								</div>
								
								<div id="divWorkUpload_2" class="complete_pic">
									<input type="hidden" name="work_photo[]" id="work_photo_2" value=""> 
									<input type="hidden" name="new_work_photo[]" id="new_work_photo_2" value="">
									<input type="hidden" name="del_work_photo[]" id="del_work_photo_2" value="">
									<div style="position: absolute; left: -3000px">
										<input type="file" class="work" name="q_work_file_2" id="q_work_file_2" file_gubun="work" accept="jpeg,png,gif,JPG" style="display:; width: 0px; height: 0px; font-size: 0px;" text=""/>
									</div>
									<div id="divWorkPhotoBox_2" is_over="0">
										<a href="#" class="pic_del" style="display: none"></a> 
										<img id="workPhotoHolder_2" onclick="browseWorkFile(2)" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 140px; height: 140px; cursor: pointer">
									</div>
								</div>
								
								<div id="divWorkUpload_3" class="complete_pic">
									<input type="hidden" name="work_photo[]" id="work_photo_3" value=""> 
									<input type="hidden" name="new_work_photo[]" id="new_work_photo_3" value="">
									<input type="hidden" name="del_work_photo[]" id="del_work_photo_3" value="">
									<div style="position: absolute; left: -3000px">
										<input type="file" class="work" name="q_work_file_3" id="q_work_file_3" file_gubun="work" accept="jpeg,png,gif,JPG" style="display:; width: 0px; height: 0px; font-size: 0px;" text=""/>
									</div>
									<div id="divWorkPhotoBox_3" is_over="0">
										<a href="#" class="pic_del" style="display: none"></a> 
										<img id="workPhotoHolder_3" onclick="browseWorkFile(3)" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 140px; height: 140px; cursor: pointer">
									</div>
								</div>
								
								<div id="divWorkUpload_4" class="complete_pic">
									<input type="hidden" name="work_photo[]" id="work_photo_4" value=""> 
									<input type="hidden" name="new_work_photo[]" id="new_work_photo_4" value="">
									<input type="hidden" name="del_work_photo[]" id="del_work_photo_4" value="">
									<div style="position: absolute; left: -3000px">
										<input type="file" class="work" name="q_work_file_4" id="q_work_file_4" file_gubun="work" accept="jpeg,png,gif,JPG" style="display:; width: 0px; height: 0px; font-size: 0px;" text=""/>
									</div>
									<div id="divWorkPhotoBox_4" is_over="0">
										<a href="#" class="pic_del" style="display: none"></a> 
										<img id="workPhotoHolder_4" onclick="browseWorkFile(4)" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 140px; height: 140px; cursor: pointer">
									</div>
								</div>
							</div>
                        	<!-- 요리완성 끝 -->
                       	</div>
                       	
                       	<!-- 요리팁 시작 -->
                       	<div class="cont_box pad_l_60">
                       		<p class="cont_tit4">요리팁</p>
                       		<textarea name="cok_tip" id="cok_tip" class="form-control step_cont" placeholder="예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요." style="height: 120px; width: 620px; resize: none;"></textarea>
                       	</div>
                       </div>
                       
                       <!--/regi_center-->
                       <div class="regi_btm">
                       	<button id="recipeWriteOk" class="btn-lg btn-primary">저장</button>
                       	<button type="button" onclick="history.back();" class="btn-lg btn-default">취소</button>
                       </div>
				</div>
			</form>
			<!-- 레시피 등록 끝 -->

			<section style="border-bottom: none; margin-bottom: 30px;">
				<div class="container_md">
					<ul class="btm_stats">
						<li><span class="btm_stats_3"></span>총 레시피수<b>143,288</b></li>
						<li><span class="btm_stats_4"></span>월 방문자수<b>5,140,000</b></li>
						<li><span class="btm_stats_5"></span>총 레시피 조회수<b>1,898,128,988</b></li>
						<li class="btm_mail"><a href="mailto:modoorecipe@google.com">
								<img src="./images/icon/mail.png">
						</a></li>
					</ul>
				</div>
			</section>

		</div>
	</div>
	
	<!-- 탑 버튼 -->
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
					<input type="text" name="query1" id="query1" placeholder="재료명, 요리명" />
				</form>
			</section>
			
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
		</div>
	</div>
	<!-- 사이드바  -->
</div>
<!-- 자바스크립트 -->
<script src="./js/jquery.min.js"></script>
<script src="./js/skel.min.js"></script>
<script src="./js/util.js"></script>
<script src="./js/main.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/modoo/top_button.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="./js/modoo/modernizr.custom.79639.js"></script>
<script type="text/javascript">

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
		
		var isFirst = "<%=isFirst%>";
		if(isFirst !=="true"){
			seenRecipe();	
		}

		var drop_nav = new DropDown( $('#drop_nav') );

		$(document).click(function() {
			// all dropdowns
			$('.wrapper-dropdown-5').removeClass('active');
		});
	});

</script>
<script src="./js/jquery-3.5.1.min.js"></script>
<script src="./js/jquery-ui.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2"></script>
<!-- 자바스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {
		rankingListStar();
	});
	
	var sel_file;
	      
	var addMaterial = function(i) {
		
		var data = "";
	         
		var mat;
		var amou;
		
		switch(i%5){
		
			case 1: mat = '예) 돼지고기'; amou = '예) 100g';
			break;
	            
			case 2: mat = '예) 양파'; amou = '예) 반개';
			break;
			         
			case 3: mat = '예) 파'; amou = '예) 1/3';
			break;
			
			case 4: mat = '예) 두부'; amou = '예) 반모';
			break;
			
			case 0: mat = '예) 소금'; amou = '예) 반스푼';
			break;
		}
	                    
		data += "<li id='liMaterial_" + i + "'>";
		data += "<input type='text' name='cok_material_nm_"+i+"[]'";
		data += "id='cok_material_nm' class='form-control'";
		data += "style='width: 330px;' placeholder='" + mat + "'>";
	         
		data += "<input type='text' name='cok_material_amt_"+i+"[]'";
		data += "id='cok_material_amt' class='form-control'";
		data += "style='width: 330px;' placeholder='" + amou + "'>";         
		
		data += "<span class='hv" + i + "'></span>";
		data += "</li>";
		
		$('#divMaterialArea_1').append(data);
		
		$('#liMaterial_1_' + i).hover(function() {
			var test = "<a id='btnMaterialDel_1_2' href='javascript:delMaterial(1,2)' class='btn-del'></a>";
			$('.hv' + i).append(test);
			
		}, function() {
			$('.hv' + i).empty();
		});
		
		$('.hv' + i).on('click', function() {
			$('#liMaterial_1_' + i).remove();
		});
	};
	
	
	var _STEP_SAMPLE = [
		"\uc18c\uace0\uae30\ub294 \uae30\ub984\uae30\ub97c \ub5bc\uc5b4\ub0b4\uace0 \uc801\ub2f9\ud55c \ud06c\uae30\ub85c \uc370\uc5b4\uc8fc\uc138\uc694.",
		"\uc900\ube44\ub41c \uc591\ub150\uc73c\ub85c \uba3c\uc800 \uace0\uae30\ub97c \uc870\ubb3c\uc870\ubb3c \uc7ac\uc6cc \ub461\ub2c8\ub2e4.",
		"\uadf8 \uc0ac\uc774 \uc591\ud30c\uc640 \ubc84\uc12f, \ub300\ud30c\ub3c4 \uc370\uc5b4\uc11c \uc900\ube44\ud558\uc138\uc694.",
		"\uace0\uae30\uac00 \ubc18\ucbe4 \uc775\uc5b4\uac08 \ub54c \uc591\ud30c\ub97c \ud568\uaed8 \ubcf6\uc544\uc694."
	];     
	
	
	/* modal */
	 
	function handlePhotoFiles(e){
		
		var file_gubun = '';
		var str_num = '';
		
		if (/step/.test(e.target.id)) {
			file_gubun = 'step';
			str_num = e.target.id.replace('q_step_file_', '');
		} else if (/work/.test(e.target.id)) {
			file_gubun = 'work';
			str_num = e.target.id.replace('q_work_file_', '');
		} else if (/main/.test(e.target.id)) {
			file_gubun = 'main';
		} else if (/video/.test(e.target.id)) {
			file_gubun = 'video';
		} else if (/contents/.test(e.target.id)) {
			file_gubun = 'contents';
		}
		
		var reader = new FileReader;
		reader.onload = function(event){
			var img = new Image();
			img.src = reader.result;
			img.onload = function(){		
				
				//iphone에서 찍은 사진(고용량)을 canvas에서 리사이징할 경우이미지가 틀어지는 현상이 있음
				var finalFile = reader.result;
							
				if (file_gubun == 'main') {
					$('#divMainPhotoBox').html('<div class="text-center" style="margin:50px 0 0 0"><span class="fa fa-spinner fa-spin fa-2x"></span></div>');
				} else if (file_gubun == 'video') {
					$('#divVideoPhotoBox').html('<div class="text-center" style="margin:30px 0 -30px 0;width:177px;height:100px"><span class="fa fa-spinner fa-spin fa-2x"></span></div>');
				} else if (file_gubun == 'step') {
					$('#divStepPhotoBox_' + str_num).html('<div class="text-center" style="margin:50px 0 0 0;width:160px"><span class="fa fa-spinner fa-spin fa-2x"></span></div>');
				} else if (file_gubun == 'work') {
					$('#divWorkPhotoBox_' + str_num).html('<div class="text-center" style="margin:50px 0 0 0"><span class="fa fa-spinner fa-spin fa-2x"></span></div>');
				}
				
				$.ajax({
					beforeSend: function(xhr){
						xhr.setRequestHeader('Content-Type', 'canvas/upload');
					},
					type: "POST",
					url: "./multiUpload.do?file_gubun=" + file_gubun + "&id=" + str_num,
					data: "canvasData=" + finalFile,
					dataType: "json",
					cache: "false",
					contextType : false,
					processData: false,
					success: function(json){
						if (json['result'] == "SUCCESS") {
							switch (json['file_gubun']) {
							case 'step':
								setStepPhoto('1', json['url'], '', json['id']);
							break;
							case 'main':
								setMainPhoto('1', json['url'], '');
							break;
							case 'video':
								setVideoPhoto('1', json['url'], '');
							break;
							case 'work':
								setWorkPhoto('1', json['url'], '', json['id']);
							break;
							case 'contents':
								setContentsPhoto('1', json);
							break;
							}
						}else {
							alert("처리에 실패하였습니다.");
						}
					},
					error: function(){
						alert('오류가 발생하였습니다.');
					}
				});
			}
		}
		reader.readAsDataURL(e.target.files[0]);
	};
	
	function setStepPhoto(is_temp, url, org_url, str_num){
		$("#step_photo_" + str_num).val(url);
		if (is_temp != '') {
			$("#new_step_photo_" + str_num).val('1');
			$("#divStepPhotoBox_" + str_num).html('<div id="divStepPhotoHolder_' + str_num + '" style="position:relative;"><img id="upload_step_image_' + str_num + '" onclick="browseStepFile(' + str_num + ')" src="/common/ajx_common.html?q_mode=get_image&axis=fixed&max_w=160&max_h=160&is_temp=' + is_temp + '&q_url=' + encodeURIComponent(url) + '" border="0" style="cursor:pointer;width:160px;height:160px;"><a id="btnDelStepPhoto_' + str_num + '" class="pic_del" href="javascript:delStepPhoto(' + str_num + ')" style="display: none;"></a></div>');
		}else {
			$("#divStepPhotoBox_" + str_num).html('<div id="divStepPhotoHolder_' + str_num + '" style="position:relative;"><img id="upload_step_image_' + str_num + '" onclick="browseStepFile(' + str_num + ')" src="/common/ajx_common.html?q_mode=get_image&axis=fixed&max_w=160&max_h=160&is_temp=' + is_temp + '&q_url=' + encodeURIComponent(url) + '" border="0" style="cursor:pointer;width:160px;height:160px;"><a id="btnDelStepPhoto_' + str_num + '" class="pic_del" href="javascript:delStepPhoto(' + str_num + ')" style="display: none;"></a></div>');
		}
		$("#divStepPhotoHolder_" + str_num).mouseover(function(){
			$("#divStepPhotoBox_" + str_num).attr('is_over', '1');
			$("#btnDelStepPhoto_" + str_num).show();
		}).mouseout(function(){
			$("#divStepPhotoBox_" + str_num).attr('is_over', '0');
			setTimeout(function(){
				//$("#divStepPhotoBox_"+str_num).attr('is_over','0');
				if ($("#divStepPhotoBox_" + str_num).attr('is_over') == '0') {
					$("#btnDelStepPhoto_" + str_num).hide();
				}
			}, 200);
		});
	};
	
	function bindEvent(el, eventName, eventHandler){
		if (el.addEventListener) {
			el.addEventListener(eventName, eventHandler, false);
		}else if (el.attachEvent) {
			el.attachEvent(eventName, eventHandler);
		}
	};
	
	
	function adjustStep(step) {
		adjustText('step_text_'+step);
	};
	
	function adjustText(id) {
		var arr_str = [];
		var contents = $('#'+id).val();
		
		if ($.trim(contents) != '') {
			var temp = contents.split('\n');
			for (var i = 0; i < temp.length; i++) {
				if ($.trim(temp[i]) != '') {
					arr_str.push($.trim(temp[i]));
				}
			}
			$('#' + id).val(arr_str.join(' '));
		}
	};
	
	
	function delStep(step){
		$("#divStepArea [id=divStepItem_" + step + "]").fadeOut(200,function() {
			$("#divStepArea [id=divStepItem_" + step + "]").remove();
			remakeStepNumber();
		});
	};
	
	
	function addStep(prev_step, init_json){
		var step = 0;
		//var obj_step = $(obj).parent().prop('id').replace('divStepBtn_','');
		
		$("#divStepArea [id^=divStepItem_]").each(function(){
			var tmp = $(this).prop('id').replace('divStepItem_', '');
			var tmp_step = parseInt(tmp, 10);
			step = Math.max(step, tmp_step);
		});
		step++;
		
		//alert(step);
		var str = $("#divStepTemplate").html().replace(/__STEP/g, step);
		var str = str.replace(/_STEP/g, '_' + step);
		
		if (typeof prev_step == 'undefined' || prev_step === null || prev_step == 0) {
			$(str).appendTo('#divStepArea');
		}else {
			$(str).insertAfter("#divStepItem_" + prev_step);
		}if (typeof init_json !== 'undefined' && init_json !== null && init_json['text']) {
			$("#divStepArea [id=step_text_" + step + "]").val(init_json['text']);
		}else {
			$("#divStepArea [id=step_text_" + step + "]").attr('placeholder','예) '+_STEP_SAMPLE[(step-1)%_STEP_SAMPLE.length]);
		}if (typeof init_json !== 'undefined' && init_json !== null && init_json['step_no']) {
			$("#divStepArea [id=step_no_" + step + "]").val(init_json['step_no']);
		}if (typeof init_json !== 'undefined' && init_json !== null && init_json['photo']) {
			setStepPhoto('', init_json['photo'][0], init_json['photo'][0], step);
		}if (typeof init_json !== 'undefined' && init_json !== null && (init_json['tip'] || init_json['material'] || init_json['fire'] || init_json['cooker'] || init_json['video'])) {
			$("#divStepArea [id=addStepInfoForm_" + step + "]").show();
		} else {
			$("#divStepArea [id=addStepInfoButs_" + step + "]").show();
		}if (typeof init_json !== 'undefined' && init_json !== null && init_json['tip']) {
			$("#divStepArea [id=stepForm_tip_" + step + "]").show();
			$("#divStepArea [id=step_tip_" + step + "]").val(init_json['tip']);
		}if (typeof init_json !== 'undefined' && init_json !== null && init_json['material']) {
			$("#divStepArea [id=stepForm_material_" + step + "]").show();
			$("#divStepArea [id=step_material_" + step + "]").val(init_json['material']);
		}if (typeof init_json !== 'undefined' && init_json !== null && init_json['fire']) {
			$("#divStepArea [id=stepForm_fire_" + step + "]").show();
			$("#divStepArea [id=step_fire_" + step + "]").val(init_json['fire']);
		}if (typeof init_json !== 'undefined' && init_json !== null && init_json['cooker']) { 
			$("#divStepArea [id=stepForm_cooker_" + step + "]").show();
			$("#divStepArea [id=step_cooker_" + step + "]").val(init_json['cooker']);
		}if (typeof init_json !== 'undefined' && init_json !== null && init_json['video']) {
			$("#divStepArea [id=stepForm_video_" + step + "]").show();
			$("#divStepArea [id=step_video_" + step + "]").val(init_json['video']);
			$("#divStepArea [id=step_video_seq_" + step + "]").val(init_json['video_seq']);
		}
		
		$("#divStepArea [id=stepBtn_material_" + step + "]").click(function(){
			$("#divStepArea [id=stepForm_material_" + step + "]").show();
		});
		
		$("#divStepArea [id=stepBtn_cooker_" + step + "]").click(function(){
			$("#divStepArea [id=stepForm_cooker_" + step + "]").show();
		});
		
		$("#divStepArea [id=stepBtn_fire_" + step + "]").click(function(){
			$("#divStepArea [id=stepForm_fire_" + step + "]").show();
		});
		
		$("#divStepArea [id=stepBtn_tip_" + step + "]").click(function(){
			$("#divStepArea [id=stepForm_tip_" + step + "]").show();
		});
		
		$("#divStepArea [id=stepBtn_video_" + step + "]").click(function(){
			$("#divStepArea [id=stepForm_video_" + step + "]").show();
		});
		
		$("#divStepArea [id=stepBtn_all_" + step + "]").click(function(){
			$("#divStepArea [id=stepForm_material_" + step + "]").show();
			$("#divStepArea [id=stepForm_cooker_" + step + "]").show();
			$("#divStepArea [id=stepForm_fire_" + step + "]").show();
			$("#divStepArea [id=stepForm_tip_" + step + "]").show();
		});
		
		$("#divStepArea [id=divStepItem_" + step + "]").mouseover(function(){
			$(this).find('.step_btn').show();
		}).mouseout(function(){
			$(this).find('.step_btn').hide();
		});
		
		$("#divStepArea [id=divStepItem_" + step + "] .moveUp").click(function(){
			if ($(this).parents('.step').prevAll('.step').length !== 0) {
				$(this).parents('.step').insertBefore($(this).parents('.step').prev());
				remakeStepNumber();
			}
		});
		
		$("#divStepArea [id=divStepItem_" + step + "] .moveDown").click(function(){
			if ($(this).parents('.step').nextAll('.step').length !== 0) {
				$(this).parents('.step').insertAfter($(this).parents('.step').next());
				remakeStepNumber();
			}
		});
		
		$("#divStepArea").sortable({
			handle: ($("#cok_reg_type").val() == 'input') ? $(".cont_tit2_1") : $(".cont_tit2"),
			stop: function(event,ui) {
				remakeStepNumber();
			}
		});
		
		$("#divStepArea [id=divStepNum_" + step + "]").tooltip({
			'placement': 'top',
			'container': $('.recipe_regi'),
			'title': '드래그하면 순서를 변경할 수 있습니다.'
		});
		
		if ($("#cok_reg_type").val() == 'edit') {
			$("#divStepItem_"+step).droppable({
				accept: "#divLeftContent img, #divLeftContent span",
				drop: function( event, ui ) {
					//var src = ui.draggable.attr('src');
					var src = ($(ui.draggable).prop('tagName') == 'IMG') ? ui.draggable.attr('src') : ui.draggable.attr('img_src');
					var target_step = $(this).prop('id').replace('divStepItem_','');
					setStepPhoto('1',src,src,target_step);
				}
			});
		}
		
		bindEvent(document.getElementById("q_step_file_" + step), 'change', handleImg);
		remakeStepNumber();
	};
	
	function browseStepFile(step){
		$("#divStepArea [id=q_step_file_" + step + "]").click()
	};
	
	function remakeStepNumber(){
		$("#divStepArea [id^=divStepItem_]").each(function(idx, obj){
			var step = $(this).prop('id').replace('divStepItem_', '');
			$("#divStepArea [id=divStepNum_" + step + "]").html('Step' + (idx + 1));
		});
	};   
	
	function browseMainFile(){
	    $("#q_main_file").click();
	};
	
	function handleMainImg(e) {
	    var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);
	
	    filesArr.forEach(function(f) {
	        if(!f.type.match("image.*")) {
	            alert("확장자는 이미지 확장자만 가능합니다.");
	            return;
	        }
	
	        sel_file = f;
	
	        var reader = new FileReader();
	        reader.onload = function(e) {
	            $("#mainPhotoHolder").attr("src", e.target.result);
	        }
	        reader.readAsDataURL(f);
	    });
	}
	
	function handleImg(e) {
	 	var file_gubun = '';
		var str_num = '';
		if (/step/.test(e.target.id)) {
			file_gubun = 'step';
			str_num = e.target.id.replace('q_step_file_', '');
		} else if (/work/.test(e.target.id)) {
			file_gubun = 'work';
			str_num = e.target.id.replace('q_work_file_', '');
		}
	
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
	
		filesArr.forEach(function(f) {
		if(!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
		    return;
		}
	
		sel_file = f;
	
		var reader = new FileReader();
		reader.onload = function(e) {
			
			   if (file_gubun == 'step') {
				   $("#stepPhotoHolder_"+str_num).attr("src", e.target.result);
	              
	               
	           } else if (file_gubun == 'work') {
	        	   $("#workPhotoHolder_"+str_num).attr("src", e.target.result);
	              
	           }
		}
		    reader.readAsDataURL(f);
		});
		 
	}
	
	function browseWorkFile(num){
	    $("#divWorkArea [id=q_work_file_" + num + "]").click();
	}
	
	$(document).ready(function() {
		
		var material_order = 1;
	         
		addMaterial(material_order);
		material_order++;
		addMaterial(material_order);
		material_order++;
		addMaterial(material_order);
		material_order++;
	         
		$('#addMaterial').on('click', function() {
		   //alert('a');
		   addMaterial(material_order);   
		   material_order++;         
		});
		
		addStep();
	         
		$("#q_main_file").on("change", handleMainImg);
		
		     
		$("#btnMo").click(function(){
		    $("#divAutoMaterialModal").modal();
		    $("#divAutoMaterialModal").show();
		});
			
		
	
		
		  for (var i=1; i<=4; i++) {
		        bindEvent(document.getElementById("q_work_file_"+i), 'change', handleImg);
		    }
		  
		  
		  $("#recipeWriteOk").on('click', function(){
			  
			 	var fileCheck = $("#q_main_file").val();
			    if(!fileCheck){
			        alert("요리 대표 사진을 첨부해 주세요.");
			        return false;
			    }
		  
			    var subCheck = $("#cok_title").val();
			    if( subCheck === "" ){
			        alert("요리 제목을 입력해 주세요.");
			        return false;
			    }
			  
			    var stepLength = $("input[class=step]").length;
			    
			    console.log(stepLength);
			    
			    if( stepLength < 3){
			    	alert("요리 과정은 최소 3개 이상이어야 합니다.");
			        return false;			    	
			    }
			  
			  	$('#writeForm').append("<input type='hidden' name='stepNum' value="+ $("input[class=step]").length +">");  
				
				$('#writeForm').append("<input type='hidden' name='materialNum' value="+ $("input[id=cok_material_nm]").length +">");  
			  	
				$('#writeForm').submit();		  
		  });
		  
	});
	
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
	/* 파일 UI크기 설정 */
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
</script>

</body>
</html>
<% } %>
