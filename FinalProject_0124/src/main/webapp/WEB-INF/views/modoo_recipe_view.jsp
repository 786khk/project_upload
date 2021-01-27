<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");	
	String rcseq = (String)request.getAttribute("rcseq");
	
	String mypage = "";
	String login_id = "";
	String login_state = "";
	String createRev = "";
 	
	if(id!=null && !id.equals("")){
	
		login_id = "환영합니다<br/>" + id + " 님!";
	 	login_state = "<a href='./logout.do'><span class='label'>로그아웃</span></a>";

		createRev += "<div id='evaluate'>";
		createRev += " 	<p class='star_rating'>";
		createRev += "    <a href='javascript:' onclick='starNum(1);' class='on'>★</a>";
		createRev += "     	<a href='javascript:' onclick='starNum(2);' class='on'>★</a>";
		createRev += "      	<a href='javascript:' onclick='starNum(3);' class='on'>★</a>";
		createRev += "      	<a href='javascript:' onclick='starNum(4);' >★</a>";
		createRev += "       	<a href='javascript:' onclick='starNum(5);' >★</a>      ";
		createRev += "       	<input type='hidden' id='star'/>             ";      
		createRev += "  	</p>";
		createRev += "  	<span id='starText'>평가하기</span>";
		createRev += "</div>";
		createRev += "<div class='view_reply'>";
		createRev += "    <div class='reply_write'>";
		createRev += "    <form id='insCmtFrm1' method='post'>";
		createRev += "     <input type='hidden' name='q_mode' value='insertRecipeComment'>";
		createRev += "     <input type='hidden' name='frm[cmt_sq_board]' value='6895214'>";
		createRev += "     <input type='hidden' name='frm[cmt_id_user]' value=''>";
		createRev += "     <input type='hidden' name='frm[cmt_nm_user]' value=''>";
		createRev += "     <input type='hidden' name='frm[cok_reg_id]' value='96may0504'>";
		createRev += "     <input type='hidden' name='frm[q_tx_images1]' id='cmt_tx_images1'>"; 
		createRev += "     <input type='hidden' name='frm[q_tx_images2]' id='cmt_tx_images21'>";
		createRev += "     <input type='file' id='review_img' style='display: none;'>";
		createRev += "      <div style= 'display: inline-block;width:100px;'>";
		createRev += "         <div id='add_imgs1' class='complete_pic'>";
		createRev += "           <img src='./images/pic_none3.gif' id='rev_img_up' alt='파일첨부' width='100' height='100'";
		createRev += "              onclick='reviewImgSel();' style='cursor: pointer;'>";
		createRev += "         </div>";
		createRev += "        <div id='img_dd1' class='complete_pic' style='display: none;'>";
		createRev += "           <img id='attach_imgs1' src='' style='width:100%;'>";
		createRev += "         </div>";
		createRev += "     </div>";
		createRev += "     <div class='input-group'>";
		createRev += "        <textarea id='cmt_tx_content1' name='frm[cmt_tx_content]' class='form-control' placeholder='요리 후기를 남겨 주세요!!' style='height: 100px; width: 100%;display:table-cell; resize: none;'></textarea>";
		createRev += "   <span class='input-group-btn' >";
		createRev += "        <button id='reviewBtn' class='btn btn-default' type='button' style='height: 100px; width: 100px;'>등록</button>";
		createRev += "     </span>";
		createRev += "    </div>";
		createRev += " </form>";
		createRev += " </div>";      
		createRev += "</div>";		
		
		 mypage = "<a href='./mypage_public.do'><span class='label'>마이페이지</span></a>";
		
	
	//}else if(id.equals("admin")){
		
		
		
	}else{
		createRev += "<div class='after_login'>후기 작성은 로그인 후 가능합니다.</div>"; 
		login_state = "<a href='./login.do'><span class='label'>로그인</span></a>";
	}	
	
	String isFirst = "false";
	if (session.getAttribute("rcList") == null) {
		isFirst = "true";
	}
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
<script type="text/javascript" src="./js/modoo/modernizr.custom.04022.js"></script>
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/modoo/recipe_view.css" />
<link rel="stylesheet" href="./css/modoo/top_button.css" />
<link rel="stylesheet" href="./css/modoo/slide.css" />
<link rel="stylesheet" href="./css/modoo/normalize.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300,300italic' rel='stylesheet' type='text/css'>
<title>모두의 레시피</title>
<style type="text/css">
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:#FFBB00;}

	#evaluate{
		padding-top : 20px;
		text-align: center;
	}
	
	
</style>
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
						<li><%=login_state %></li>
						<%=mypage %>
						<li><a href="./recipe_write.do"><span class="label">레시피
									등록</span></a></li>
						<li><a href="./admin_main.do"><span class="label">관리자</span></a></li>
					</ul>
					<!-- 회원 정보 지우지 마세요 -->
				</header>
				<!-- 상단 끝 -->


				<!-- 컨텐츠 시작 -->
				<div>
					<div class="container sub_bg">
						<div id="contents_area">
							<div id="recipe_rfilename_hit_nickname_content" class="view2_pic">
								<!-- <div class="view_cate st2" style="z-index: 10;">
                           <div class="view_cate_num"><span class="hit font_num">173</span></div>
                        </div>
                        <div class="centeredcrop">
                           <img id="main_thumbs" src="https://recipe1.ezmember.co.kr/cache/recipe/2020/10/10/99e3192267ac01cffcb05d9acfa77c081.jpg" alt="main thumb">
                        </div>
                        <div class="user_info2">
                           <a class="app_block_link_remove user_info2_pic" href="/profile/index.html?uid=fanyloveh2">
                              <img src="https://recipe1.ezmember.co.kr/cache/rpf/2020/06/25/7528c3d63b3e829ffbd0100cc8fac6881.jpg">
                           </a>
                           <span class="user_info2_name">승승맘h2
                              <button id="friendDiv" type="button" class="btn btn-xs btn-default" onclick="doAddFriend()">소식받기</button>
                           </span>
                        </div> -->
							</div>

							<div class="view2_summary">
								<span id="recipe_subject_intro_content"> </span>
								<div class="btn_list st2">

									<span id="recipe_scrap_content"> <a
										href="javascript:void(0)" onclick="scrapClick()"> <img
											src="https://recipe1.ezmember.co.kr/img/mobile/btn_view_scrap.png">
											<span>스크랩<b id="scrapNum" class="st2"></b></span>
									</a>
									</span> <span id="recipe_rev_content"> </span>
								</div>
							</div>

							<!-- 광고 시작 -->
							<div id="divAdArea_recipe_view_top"
								style="text-align: center; margin-top: 20px; padding: 0 10px;">
								<script async=""
									src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
								<ins class="adsbygoogle"
									style="display: block; text-align: center; height: 200px;"
									data-ad-layout="in-article" data-ad-format="fluid"
									data-ad-client="ca-pub-1557771002660658"
									data-ad-slot="9313999426" data-adsbygoogle-status="done">
									<ins id="aswift_0_expand"
										style="display: inline-table; border: none; height: 200px; margin: 0; padding: 0; position: relative; visibility: visible; width: 875px; background-color: transparent;">
										<ins id="aswift_0_anchor"
											style="display: block; border: none; height: 200px; margin: 0; padding: 0; position: relative; visibility: visible; width: 875px; background-color: transparent;">
											<iframe id="aswift_0" name="aswift_0"
												style="left: 0; position: absolute; top: 0; border: 0; width: 875px; height: 200px;"
												sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation"
												width="875" height="200" frameborder="0"
												src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-1557771002660658&amp;output=html&amp;h=200&amp;slotname=9313999426&amp;adk=1053428403&amp;adf=1245380136&amp;w=875&amp;fwrn=4&amp;lmt=1602496026&amp;rafmt=11&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=875x200&amp;url=https%3A%2F%2Fwww.10000recipe.com%2Frecipe%2F6943784&amp;flash=0&amp;wgl=1&amp;tt_state=W3siaXNzdWVyT3JpZ2luIjoiaHR0cHM6Ly9hZHNlcnZpY2UuZ29vZ2xlLmNvbSIsInN0YXRlIjowfV0.&amp;dt=1602496026385&amp;bpp=8&amp;bdt=264&amp;idt=168&amp;shv=r20201007&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D65100fe80e293823%3AT%3D1601961644%3AS%3DALNI_MalGzkTbx1wI7mN_wEd6lYHZhmdQA&amp;correlator=5631148024139&amp;frm=20&amp;pv=2&amp;ga_vid=654567366.1601883553&amp;ga_sid=1602496027&amp;ga_hid=1844856160&amp;ga_fc=0&amp;ga_cid=2003550416.1602472211&amp;iag=0&amp;icsg=2199034396704&amp;dssz=41&amp;mdo=0&amp;mso=0&amp;rplot=4&amp;u_tz=540&amp;u_his=50&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=342&amp;ady=1284&amp;biw=1903&amp;bih=500&amp;scr_x=0&amp;scr_y=1200&amp;eid=21067603&amp;oid=3&amp;pvsid=2438436869071305&amp;pem=878&amp;ref=https%3A%2F%2Fwww.10000recipe.com%2Frecipe%2Flist.html&amp;rx=0&amp;eae=0&amp;fc=640&amp;brdim=0%2C0%2C0%2C0%2C1920%2C0%2C1920%2C1040%2C1920%2C500&amp;vis=1&amp;rsz=%7C%7CeE%7C&amp;abl=CS&amp;pfx=0&amp;fu=8320&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=yiOhg8CHbb&amp;p=https%3A//www.10000recipe.com&amp;dtd=183&amp;wmode=transparent"
												marginwidth="0" marginheight="0" vspace="0" hspace="0"
												allowtransparency="true" scrolling="no"
												allowfullscreen="true" data-google-container-id="a!1"
												data-google-query-id="CLiPkfPiruwCFQKblgodlqkK7A"
												data-load-complete="true"></iframe>
										</ins>
									</ins>
								</ins>
								<script>
									(adsbygoogle = window.adsbygoogle || [])
											.push({});
								</script>
							</div>
							<!-- 광고 끝 -->

							<div class="blank_bottom"></div>
							<div class="cont_ingre2">
								<div class="best_tit">
									<b>재료</b><span>Ingredients</span>
									<div class="best_tit_rmn">
										<button id="btnMeasureModal" type="button"
											class="btn btn-default"
											onclick="$('#measureModal').modal('show');">계량법 안내</button>
									</div>
								</div>
								<div class="ready_ingre3" id="divConfirmedMaterialArea">
									<ul class="case1">
										<b class="ready_ingre3_tt">[재료]</b>
										<div id="material_content"></div>
									</ul>
								</div>
							</div>

								<div class="blank_bottom"></div>
<%







%>
					<!-- 	<div class="view_movie">
								<h3>동영상</h3>
								<div class="movie_area">
									<div class="iframe_wrap">
										 <iframe id="ifrmRecipeVideo"
											src="https://www.youtube.com/embed/6k-vSm-byGs?wmode=transparent&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fwww.10000recipe.com"
											org_src="https://www.youtube.com/embed/6k-vSm-byGs"
											frameborder="0" width="640" height="360" allowfullscreen=""
											style="width: 700px; height: 422px;"
											data-gtm-yt-inspected-11185557_8="true"
											data-gtm-yt-inspected-1_27="true"></iframe> 
									</div>
								</div>
							</div> 

							<div class="blank_bottom"></div>-->

							<div class="view_step">
								<div class="best_tit">
									<b>조리순서</b><span>Steps</span>
									<div class="best_tit_rmn">
										<a href="javascript:void(0);" onclick="chgViewStep(1)"> <img
											id="tabStepView1"
											src="https://recipe1.ezmember.co.kr/img/mobile/tab_view1.png"
											alt="이미지크게보기">
										</a> <a href="javascript:void(0);" onclick="chgViewStep(2)"> <img
											id="tabStepView2"
											src="https://recipe1.ezmember.co.kr/img/mobile/tab_view2.png"
											alt="텍스트만보기">
										</a> <a href="javascript:void(0);" onclick="chgViewStep(3)"> <img
											id="tabStepView3"
											src="https://recipe1.ezmember.co.kr/img/mobile/tab_view3_on.png"
											alt="이미지작게보기">
										</a>
									</div>
								</div>

								<!--  스텝  -->
								<div id="step_content"></div>
								<!--  스텝 끝 -->

								<!-- 요리완성 사진 -->
								<!-- <div class="sp-slideshow">

									<input id="button-1" type="radio" name="radio-set"
										class="sp-selector-1" checked="checked"> <label
										for="button-1" class="button-label-1"></label> <input
										id="button-2" type="radio" name="radio-set"
										class="sp-selector-2"> <label for="button-2"
										class="button-label-2"></label> <input id="button-3"
										type="radio" name="radio-set" class="sp-selector-3"> <label
										for="button-3" class="button-label-3"></label>

									<input id="button-4" type="radio" name="radio-set" class="sp-selector-4">
									<label for="button-4" class="button-label-4"></label>
									
									<input id="button-5" type="radio" name="radio-set" class="sp-selector-5">
									<label for="button-5" class="button-label-5"></label> 

									<label for="button-1" class="sp-arrow sp-a1"></label> <label
										for="button-2" class="sp-arrow sp-a2"></label> <label
										for="button-3" class="sp-arrow sp-a3"></label>
									<label for="button-4" class="sp-arrow sp-a4"></label>
									<label for="button-5" class="sp-arrow sp-a5"></label>

									<div class="sp-content">
										<div class="sp-parallax-bg"></div>
										<ul class="sp-slider clearfix">
											<li><img
												src="https://recipe1.ezmember.co.kr/cache/recipe/2020/08/28/f923dbd30b7c16e7f41101ed5dc287d31.jpg"
												alt="image01"></li>
											<li><img
												src="https://recipe1.ezmember.co.kr/cache/recipe/2020/08/28/0583a64e17fbb554026e27ba7c1e6f381.jpg"
												alt="image02"></li>
											<li><img
												src="https://recipe1.ezmember.co.kr/cache/recipe/2020/08/28/f923dbd30b7c16e7f41101ed5dc287d31.jpg"
												alt="image03"></li>

										</ul>
									</div>
									sp-content

								</div> -->
								<!-- 요리완성 사진 끝 -->

								<div id="recipe_tip_wdate_content">
									<!-- <dl class="view_step_tip">
										<dt>
											<img src="https://recipe1.ezmember.co.kr/img/tit_tip.gif"
												alt="팁-주의사항">
										</dt>
										
											 <dd>새우 손질이 어려우신 경우 칵테일새우를 넣어도 됩니다.</dd>
										
									</dl>
	
									<div class="view_notice">
										<p class="view_notice_date">
											<b>등록일 : 2020-10-10</b> <b>수정일 : 2020-10-12</b>
										</p>
	
										<span>저작자의 사전 동의 없이 이미지 및 문구의 무단 도용 및 복제를 금합니다.</span>
									</div> -->
								</div>
							</div>
							<!--/view_step -->
							<div class="blank_bottom"></div>
							<div class="view_step">
								<div class="best_tit">
									<b>레시피 작성자</b><span>About the writer</span>
								</div>
								<div id="recipe_nickname_picture_mintroduce_content"
									class="view_profile">
									<!-- <div class="profile_pic">
										<a href="/profile/index.html?uid=fanyloveh2"><img
											src="https://recipe1.ezmember.co.kr/cache/rpf/2020/06/25/7528c3d63b3e829ffbd0100cc8fac6881.jpg"></a>
									</div>
									<div class="profile_cont">
										<p class="cont_name">
											승승맘h2
											<button id="friendDiv2" type="button"
												class="btn btn-lg btn-default" onclick="doAddFriend()">
												<span class="glyphicon glyphicon-plus"></span>소식받기
											</button>
										</p>
										<p class="cont_intro">사랑하는 사람들에게 맛있는 음식을 먹이고픈 승승맘h2입니다^^</p>
									</div> -->
								</div>
							</div>

							<div id="snsLinkModal" class="modal" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog" style="width: 620px">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<img src="https://recipe1.ezmember.co.kr/img/btn_close.gif"
													alt="닫기">
											</button>
											<h4 class="modal-title">공유하기</h4>
										</div>
										<div class="modal-body">
											<div class="btn_list">
												<a href="javascript:void(0)"
													onclick="snsWriter('kakaoStory')"><img
													src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_ks.png"
													data-toggle="tooltip" title="" data-original-title="카카오스토리"></a>
												<a href="javascript:void(0)" onclick="snsWriter('facebook')"><img
													src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_f.png"
													data-toggle="tooltip" title="" data-original-title="페이스북"></a>
												<a href="javascript:void(0)" onclick="snsWriter('twitter')"><img
													src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_t.png"
													data-toggle="tooltip" title="" data-original-title="트위터"></a>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div id="errorModal" class="modal" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog" style="width: 520px">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<img src="https://recipe1.ezmember.co.kr/img/btn_close.gif"
													alt="닫기">
											</button>
											<h4 class="modal-title">브로콜리 넣은 새우볶음밥 레시피</h4>
										</div>
										<div class="modal-body">
											<textarea id="errorCont" class="form-control" rows="3"
												placeholder="이런! 레시피에 문제가 있나요? 자세한 내용을 남겨주시면 신속하게 처리하겠습니다."
												style="height: 260px;"></textarea>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn-lg btn-default"
												data-dismiss="modal">취소</button>
											<button type="button" class="btn-lg btn-primary"
												onclick="submitError()">전송</button>
										</div>
										<div class="modal-noti">
											개별회신을 원하시면, <a href="/customer/list.html?bid=3"
												style="text-decoration: underline; color: #666;">여기</a>에
											문의하세요.
										</div>
									</div>
								</div>
							</div>

							<div id="noteModal" class="modal" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog" style="width: 520px">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<img src="https://recipe1.ezmember.co.kr/img/btn_close.gif"
													alt="닫기">
											</button>
											<h4 class="modal-title">브로콜리 넣은 새우볶음밥 레시피</h4>
										</div>
										<div class="modal-body">
											<textarea id="noteCont" class="form-control" rows="3"
												placeholder="해당 레시피에 대해서 나만의 노트를 작성해 보세요."
												style="height: 260px;"></textarea>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn-lg btn-default"
												data-dismiss="modal">취소</button>
											<button type="button" class="btn-lg btn-primary"
												onclick="submitNote()">저장</button>
										</div>
									</div>
								</div>
							</div>

							<div id="vImageModal" class="modal" role="dialog"
								aria-hidden="true">
								<div id="vImageModalDialog" class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<img id="vImageModalSrc" src="">
										</div>
									</div>
								</div>
							</div>

							<div id="materialVideoModal" class="modal" role="dialog"
								aria-hidden="true">
								<div id="materialVideoModalDialog" class="modal-dialog">
									<div class="modal-content" style="width: 730px; height: 452px">
										<div class="modal-body">
											<iframe id="ifrmMaterialVideo" width="700" height="422"
												src="about:blank?wmode=transparent" frameborder="0"
												allowfullscreen=""></iframe>
										</div>
									</div>
								</div>
							</div>

							<div id="measureModal" class="modal fade in" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content" style="padding: 0;">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true"><img
													src="https://recipe1.ezmember.co.kr/img/btn_close.gif"
													alt="닫기" width="18px" height="18px"></span>
											</button>
											<h4 class="modal-title">계량법 안내</h4>
										</div>
										<div class="modal-body">
											<table class="weighing_modal">
												<tbody>
													<tr>
														<th>1큰술(1T, 1Ts)<br>= 1숟가락
														</th>
														<td>15ml = 3t<br>(계량스푼이 없는 경우 밥숟가락으로 볼록하게 가득 담으면
															1큰술)
														</td>
													</tr>
													<tr>
														<th>1작은술(1t, 1ts)</th>
														<td>5ml<br>(티스푼으로는 2스푼이 1작은술)
														</td>
													</tr>
													<tr>
														<th>1컵(1Cup, 1C)</th>
														<td>200ml = 16T(한국,중국,일본)<br>(미국 및 서양의 경우 1C가
															240~250ml이므로 계량컵 구매 사용시 주의)
														</td>
													</tr>
													<tr>
														<th>1종이컵</th>
														<td>180ml</td>
													</tr>
													<tr>
														<th>1oz</th>
														<td>28.3g</td>
													</tr>
													<tr>
														<th>1파운드(lb)</th>
														<td>약 0.453 킬로그램(kg)</td>
													</tr>
													<tr>
														<th>1갤런(gallon)</th>
														<td>약 3.78 리터(ℓ)</td>
													</tr>
													<tr>
														<th>1꼬집</th>
														<td>약 2g 정도이며 '약간'이라고 표현하기도 함</td>
													</tr>
													<tr>
														<th>조금</th>
														<td>약간의 2~3배</td>
													</tr>
													<tr>
														<th>적당량</th>
														<td>기호에 따라 마음대로 조절해서 넣으란 표현</td>
													</tr>
													<tr>
														<th>1줌</th>
														<td>한손 가득 넘치게 쥐어진 정도<br>(예시 : 멸치 1줌 = 국멸치인 경우
															12~15마리, 나물 1줌은 50g)
														</td>
													</tr>
													<tr>
														<th>크게 1줌 = 2줌</th>
														<td>1줌의 두배</td>
													</tr>
													<tr>
														<th>1주먹</th>
														<td>여자 어른의 주먹크기, 고기로는 100g</td>
													</tr>
													<tr>
														<th>1토막</th>
														<td>2~3cm두께 정도의 분량</td>
													</tr>
													<tr>
														<th>마늘 1톨</th>
														<td>깐 마늘 한쪽</td>
													</tr>
													<tr>
														<th>생강 1쪽</th>
														<td>마늘 1톨의 크기와 비슷</td>
													</tr>
													<tr>
														<th>생강 1톨</th>
														<td>아기 손바닥만한 크기의 통생강 1개</td>
													</tr>
													<tr>
														<th>고기 1근</th>
														<td>600g</td>
													</tr>
													<tr>
														<th>채소 1근</th>
														<td>400g</td>
													</tr>
													<tr>
														<th>채소 1봉지</th>
														<td>200g 정도</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn-lg btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>

							<div id="materialViewModal" class="modal" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog" style="width: 912px;">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<img src="https://recipe1.ezmember.co.kr/img/btn_close.gif"
													alt="닫기">
											</button>
											<h4 class="modal-title" id="materialNames"></h4>
										</div>
										<div class="modal-body" id="materialBody"></div>
									</div>
								</div>
							</div>

							<div id="goodsViewModal" class="modal" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog" style="width: 820px;">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<img src="https://recipe1.ezmember.co.kr/img/btn_close.gif"
													alt="닫기">
											</button>
											<h4 class="modal-title" id="goodsNames">
												<img
													src="https://recipe1.ezmember.co.kr/img/mobile/icon_pdt.png"
													width="24"> 레시피와 관련된 상품
											</h4>
										</div>
										<div class="modal-body" id="goodsBody">
											<input type="hidden" id="open_position" value="">
										</div>
									</div>
								</div>
							</div>

							<div id="goodsCarouselModal" class="modal" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog" style="width: 820px;">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<img src="https://recipe1.ezmember.co.kr/img/btn_close.gif"
													alt="닫기">
											</button>
											<h4 class="modal-title">
												<img
													src="https://recipe1.ezmember.co.kr/img/mobile/icon_pdt.png"
													width="24"> 레시피와 관련된 상품
											</h4>
										</div>
										<div class="modal-body"></div>
									</div>
								</div>
							</div>

							<!-- 레시피 스크랩 -->
							<script>
								var selFolder = false;
								function checkScrapLogin() {
									return true;
								}

								function newScrapFoler() {
									if (!checkScrapLogin())
										return;

									if (selFolder)
										$("#selectScrapFolderModal").modal('hide');
									$("#editFolderSeq").val('');
									$("#scrapFolderName").val('');
									$("#editScrapFolderModal").modal('show');
									$("#editFolderModalTitle").html("새폴더 만들기");
									$("#editFolderModalDescr").show();
								}

								function editScrapFoler(seq) {
									if (!checkScrapLogin())
										return;
									if (!seq)
										return;

									if (selFolder)
										$("#selectScrapFolderModal").modal(
												'hide');
									$("#editScrapFolderModal").modal('show');
									$("#editFolderModalTitle").html("폴더명 수정");
									$("#editFolderModalDescr").hide();
									$("#editFolderSeq").val(seq);
									if ($("#editOriName_" + seq).val())
										$("#scrapFolderName").val(
												$("#editOriName_" + seq).val());
								}

								function delScrapFoler(seq) {
									if (!checkScrapLogin())
										return;
									if (!seq)
										return;
									if (confirm('폴더를 삭제하시겠습니까?\n\n폴더에 스크랩된 레시피도 모두 삭제됩니다.')) {
										$
												.ajax({
													type : "POST",
													url : "/scrap/ajax.html",
													data : "q_mode=deleteFolder&folderSeq="
															+ seq,
													success : function(result) {
														if (result == 'SUCCESS') {
															scrapListRefresh();
														} else {
															alert('삭제실패. 잠시후 다시 시도해 주세요.');
														}
													}
												});
									}
								}

								function shareScrapFoler(seq, tg) {
									if (!checkScrapLogin())
										return;
									if (!seq)
										return;

									var msg = "폴더를 공유하시겠습니까?\n\n다른 사람들이 내가 스크랩한 레시피를 구경하고 추천할 수 있습니다.";
									if (tg != 1)
										msg = "폴더 공유를 해제하시겠습니까?\n\n다른 사람들이 내가 스크랩한 레시피를 볼 수 없습니다.";

									if (confirm(msg)) {
										$
												.ajax({
													type : "POST",
													url : "/scrap/ajax.html",
													data : "q_mode=shareFolder&folderSeq="
															+ seq
															+ "&share="
															+ tg,
													success : function(result) {
														if (result == 'SUCCESS') {
															scrapListRefresh();
														} else {
															alert('공유실패. 잠시후 다시 시도해 주세요.');
														}
													}
												});
									}
								}

								function submitScrapFolder() {
									if (!checkScrapLogin())
										return;
									var folder = $("#scrapFolderName").val();
									var seq = $("#editFolderSeq").val();
									var mode = (!seq) ? 'insertFolder'
											: 'updateFolder';
									if (!folder) {
										alert('폴더명을 입력해 주세요.');
										return;
									}
									$
											.ajax({
												type : "POST",
												url : "/scrap/ajax.html",
												data : "q_mode=" + mode
														+ "&seq=" + seq
														+ "&folder=" + folder,
												success : function(result) {
													if (result == 'SUCCESS') {
														$("#scrapFolderName")
																.val('');
														$(
																"#editScrapFolderModal")
																.modal('hide');
														scrapListRefresh();
													} else if (result == 'LIMITED') {
														alert('폴더는 50개까지만 생성가능합니다. 다른 폴더를 지우고 만들어 주세요.');
													} else if (result == 'NOT_ENOUGH') {
														//alert("프리미엄 회원이 아닌경우, 최대 개까지 폴더 생성이 가능합니다.");
														viewPremiumFolderModal();
													} else {
														alert('등록실패. 잠시후 다시 시도해 주세요.');
													}
												}
											});
								}

								function getScrapFolder(target) {
									var urls = "q_mode=getListScrapFolder";
									if (target == "my")
										urls += "&uid=";
									$.ajax({
										type : "GET",
										url : "/scrap/ajax.html",
										data : urls,
										success : function(result) {
											if (result) {
												$("#listScrapFolder_" + target)
														.html(result);
											} else {
												alert('조회실패. 잠시후 다시 시도해 주세요.');
											}
										}
									});
								}

								function scrapListRefresh() {
									if (selFolder) {
										selectScrapFolderOpen();
									} else {
										getScrapFolder('my');
									}
								}

								function selectScrapFolderOpen() {
									$("#selectScrapFolderModal").modal('show');
									selFolder = true;
									getScrapFolder('sel');
								}
								$(function() {
									$('#editScrapFolderModal').on(
											'hidden.bs.modal', function() {
												//$("#selectScrapFolderModal").modal('show');
												scrapListRefresh();
											});
								});
							</script>
							<input type="hidden" id="editFolderSeq">
							<div id="editScrapFolderModal" class="modal" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog" style="width: 80%; max-width: 520px;">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span><img
													src="https://recipe1.ezmember.co.kr/img/btn_close.gif"
													alt="닫기"></span>
											</button>
											<h4 id="editFolderModalTitle" class="modal-title">새폴더
												만들기</h4>
										</div>
										<div class="modal-body" style="padding: 25px 35px 0;">
											<input id="scrapFolderName" type="text" class="form-control"
												placeholder="폴더명을 입력해 주세요(20자 이내)" style="height: 50px;">
											<div id="editFolderModalDescr" style="display: none;">
												<p>
													* 폴더는 최대 50개까지 생성이 가능합니다.<br>
												</p>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn-lg btn-default"
												data-dismiss="modal">취소</button>
											<button type="button" class="btn-lg btn-primary"
												onclick="submitScrapFolder()">등록</button>
										</div>
									</div>
								</div>
							</div>
							<div id="selectScrapFolderModal" class="modal" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog" style="width: 80%; max-width: 520px;">
									<div class="modal-content new_folder">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span><img
													src="https://recipe1.ezmember.co.kr/img/btn_close.gif"
													alt="닫기"></span>
											</button>
											<h4 class="modal-title">
												<p>레시피를 담을 폴더를 선택해 주세요.</p>
												<button type="button" class="btn btn-default"
													aria-label="Left Align" onclick="newScrapFoler()">
													<span>새폴더 만들기</span>
												</button>
											</h4>
										</div>
										<div class="modal-body" style="padding: 0;">
											<div id="listScrapFolder_sel" class="scrap_list"
												style="height: 480px; overflow: yes; overflow-x: hidden;">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="blank_bottom"></div>

							<a name="reviewLists"></a>
							<div class="view_reply st2">
								<div class="reply_tit">
									<div id="recipe_rev_content">
										요리 후기 <span id="recipeCommentListCount"></span>
									</div>
									<div class="dropdown clearfix pull-right">
										<!-- <button class="btn btn-default dropdown-toggle" type="button"
											id="dropdownMenu1" data-toggle="dropdown"
											aria-expanded="false">
											유용한 후기순<span class="glyphicon glyphicon-menu-down"></span>
										</button> -->
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1">
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:void(0);" onclick="goReviewSort('')">유용한
													후기순</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:void(0);" onclick="goReviewSort('1')">최근
													날짜순</a></li>
										</ul>
									</div>
								</div>
								<div>
									<div class="modoo reply_list">

										<div id="review_content" class="media-body"></div>
										<div id="replyReviewDiv_309255"></div>


										<div id="moreViewReviewList"
											style="display: none; padding-top: 20px;">
											<div id="review_more_content" class="media-body"></div>
											<div id="replyReviewDiv_309255"></div>
										</div>
										<div class="view_btn_more" style="padding-bottom: 20px;">
											<a id="btnMoreReviews" href="javascript:void(0)"
												onclick="doMoreReviewToggles()">전체보기</a>
										</div>
									</div>

								</div>

								<div id="re_replyReview_div" style="display: none;">
									<div class="reply_write">
										<form id="insCmtReviewFrm" method="post">
											<input type="hidden" name="q_mode" value="insertReviewReply">
											<input type="hidden" name="frm[seq]" id="parent_review_seq">
											<input type="hidden" name="targetList" value="reviewLists">
											<div class="input-group">
												<textarea id="tx_comment" onclick="" name="frm[tx_comment]"
													class="form-control"
													style="height: 100px; width: 100%; resize: none;"></textarea>
												<span class="input-group-btn"><button
														class="btn btn-default" type="button"
														onclick="doCommentReviewSubmit()"
														style="height: 100px; width: 100px;">등록</button></span>
											</div>
										</form>
									</div>
								</div>
							</div>

							<!-- 댓 -->

							<!-- /view_reply -->

							<div class="blank_bottom"></div>

							<%=createRev %>

							<div class="blank_bottom"></div>
							<br />
							<div class="view_tag">
								<a href="/recipe/list.html?q=잔치국수">#잔치국수</a> <a
									href="/recipe/list.html?q=잔치국수만들기">#잔치국수만들기</a> <a
									href="/recipe/list.html?q=잔치국수레시피">#잔치국수레시피</a> <a
									href="/recipe/list.html?q=어묵국수">#어묵국수</a> <a
									href="/recipe/list.html?q=어묵국수만들기">#어묵국수만들기</a> <a
									href="/recipe/list.html?q=어묵국수레시피">#어묵국수레시피</a>
							</div>

							<script type="text/javascript"
								src="https://ssl.pstatic.net/adimg3.search/adpost/js/adpost_show_ads_v2.min.js"></script>

							<div class="blank_bottom"></div>

							<div class="view_step">
								<div class="best_tit">
									<b style="color: #74b243;">새우볶음밥</b> <b>추천 레시피</b>
								</div>
								<div class="common_rcp_list" style="padding: 0 0 0 65px;">
									<ul class="common_rcp_list_ul">

										<li class="common_rcp_list_li" style="width: 180px;"><a
											href="/recipe/6891445" class="common_rcp_link">
												<div class="common_rcp_thumb">
													<img
														src="https://recipe1.ezmember.co.kr/cache/recipe/2018/06/25/62b8c78d8e273a77241b1a3c7d09f36b1_m.jpg">
												</div>
												<div class="common_rcp_caption">
													<div class="common_rcp_caption_tit line2">볶음밥 처음
														성공입니다 대박 고마워요~~♡</div>
													<div class="common_rcp_caption_name"
														style="display: inline-block;">
														<p class="common_rcp_caption_name_pic">
															<img
																src="https://recipe1.ezmember.co.kr/cache/rpf/2016/08/27/790f01187fe945b6e07a2870a96ac1ec1.jpg">배지안
														</p>
													</div>
													<div class="common_rcp_caption_rv"
														style="display: inline-block;">
														<span class="common_rcp_caption_rv_star"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
													</div>
												</div>
										</a></li>
										<li class="common_rcp_list_li" style="width: 180px;"><a
											href="/recipe/6929581" class="common_rcp_link">
												<div class="common_rcp_thumb">
													<img
														src="https://recipe1.ezmember.co.kr/cache/recipe/2020/03/30/31c96d85aa36d8bc24677f9bbe6925ee1_m.jpg">
												</div>
												<div class="common_rcp_caption">
													<div class="common_rcp_caption_tit line2">마늘을 생마늘이
														아니라 냉동꺼 녹여서 넣었더니 마늘향이 쓴맛으로 변해서 맛이 별로였어요ㅜㅜ 울 아가들은 배가고픈지
														잘먹지만 담엔 꼭 생마늘이나 대파 양파로 대체해야겠어요 아기 먹이실분들 참고하세요^^</div>
													<div class="common_rcp_caption_name"
														style="display: inline-block;">
														<p class="common_rcp_caption_name_pic">
															<img
																src="https://recipe1.ezmember.co.kr/cache/rpf/2020/05/05/3a83e76e01ec3af9faffbea2b583baab1.jpg">율공주맘..
														</p>
													</div>
													<div class="common_rcp_caption_rv"
														style="display: inline-block;">
														<span class="common_rcp_caption_rv_star"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
													</div>
												</div>
										</a></li>
										<li class="common_rcp_list_li" style="width: 180px;"><a
											href="/recipe/6896028" class="common_rcp_link">
												<div class="common_rcp_thumb">
													<img
														src="https://recipe1.ezmember.co.kr/cache/recipe/2018/09/17/6538332ac434451ad637d2c9457ff9011_m.jpg">
												</div>
												<div class="common_rcp_caption">
													<div class="common_rcp_caption_tit line2">맛있어요~~
														금방할수있는 요리라 퇴근 후에 신랑이랑 후딱 해먹었네요~~ 장새우 밖에 없어서 장새우 익혀먹었더니 이것도
														나름 나쁘지 않네용~~~</div>
													<div class="common_rcp_caption_name"
														style="display: inline-block;">
														<p class="common_rcp_caption_name_pic">
															<img
																src="https://recipe1.ezmember.co.kr/cache/rpf/2020/04/01/56a3071d2c44af56116e05adfd85818e1.jpg">밤스커피
														</p>
													</div>
													<div class="common_rcp_caption_rv"
														style="display: inline-block;">
														<span class="common_rcp_caption_rv_star"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
													</div>
												</div>
										</a></li>
										<li class="common_rcp_list_li" style="width: 180px;"><a
											href="/recipe/6845019" class="common_rcp_link">
												<div class="common_rcp_thumb">
													<img
														src="https://recipe1.ezmember.co.kr/cache/recipe/2016/03/21/d0dc5b20e13e377e74dddaa6f4f83b8e1_m.jpg">
												</div>
												<div class="common_rcp_caption">
													<div class="common_rcp_caption_tit line2">대박 개꿀맛 있데요?
														또해먹을 께요~~^^</div>
													<div class="common_rcp_caption_name"
														style="display: inline-block;">
														<p class="common_rcp_caption_name_pic">
															<img
																src="https://recipe1.ezmember.co.kr/cache/rpf/2020/04/19/8ca4ee9ec7f5ea8a3029ffb65c3be44e1.2dc5bd80c6e646fe9a1fac98bb335c06">감자네하..
														</p>
													</div>
													<div class="common_rcp_caption_rv"
														style="display: inline-block;">
														<span class="common_rcp_caption_rv_star"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
													</div>
												</div>
										</a></li>
										<li class="common_rcp_list_li" style="width: 180px;"><a
											href="/recipe/6874928" class="common_rcp_link">
												<div class="common_rcp_thumb">
													<img
														src="https://recipe1.ezmember.co.kr/cache/recipe/2017/08/18/53d72b2460b8addd62e256b3a50f75171_m.jpg">
												</div>
												<div class="common_rcp_caption">
													<div class="common_rcp_caption_tit line2">굴소스 넣고 했더니
														넘 맛나요~~ 감사압니당</div>
													<div class="common_rcp_caption_name"
														style="display: inline-block;">
														<p class="common_rcp_caption_name_pic">
															<img
																src="https://recipe1.ezmember.co.kr/cache/rpf/2018/12/01/5ad956b8662009d8abd36150b3d855941.jpg">윤영분
														</p>
													</div>
													<div class="common_rcp_caption_rv"
														style="display: inline-block;">
														<span class="common_rcp_caption_rv_star"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
													</div>
												</div>
										</a></li>
										<li class="common_rcp_list_li" style="width: 180px;"><a
											href="/recipe/6915661" class="common_rcp_link">
												<div class="common_rcp_thumb">
													<img
														src="https://recipe1.ezmember.co.kr/cache/recipe/2019/07/11/eb7e828dcd2e79c16adaa9324ae59b2c1_m.jpg">
												</div>
												<div class="common_rcp_caption">
													<div class="common_rcp_caption_tit line2">아이 체험학습갈때
														해줬더니 기대이상으로 맛있데요~ 감사합니다 ^^~♡</div>
													<div class="common_rcp_caption_name"
														style="display: inline-block;">
														<p class="common_rcp_caption_name_pic">
															<img
																src="https://recipe1.ezmember.co.kr/cache/rpf/2019/11/04/5a4918044b2dfb4ccc642dfc15ad736a1.jpg">-엄신자
														</p>
													</div>
													<div class="common_rcp_caption_rv"
														style="display: inline-block;">
														<span class="common_rcp_caption_rv_star"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
													</div>
												</div>
										</a></li>
										<li class="common_rcp_list_li" style="width: 180px;"><a
											href="/recipe/6875404" class="common_rcp_link">
												<div class="common_rcp_thumb">
													<img
														src="https://recipe1.ezmember.co.kr/cache/recipe/2017/08/26/e90f4461e8306c65f610caec1f70c0181_m.jpg">
												</div>
												<div class="common_rcp_caption">
													<div class="common_rcp_caption_tit line2">너무맛있어요 파프리카
														별로 안좋아하는데 볶음밥 넣으니 넘 맛있고 자주 먹을 거 같아요</div>
													<div class="common_rcp_caption_name"
														style="display: inline-block;">
														<p class="common_rcp_caption_name_pic">
															<img
																src="https://recipe1.ezmember.co.kr/cache/rpf/2020/01/24/cfe2ee900f40348fe4c0a053d9fa3a5a1.0c7e82c7bf2bc4d2613c59ce98506bce">브로콜리..
														</p>
													</div>
													<div class="common_rcp_caption_rv"
														style="display: inline-block;">
														<span class="common_rcp_caption_rv_star"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
													</div>
												</div>
										</a></li>
										<li class="common_rcp_list_li" style="width: 180px;"><a
											href="/recipe/6931229" class="common_rcp_link">
												<div class="common_rcp_thumb">
													<img
														src="https://recipe1.ezmember.co.kr/cache/recipe/2020/04/21/bced17dae9324f549fcfba7daa25cbcd1_m.jpg">
												</div>
												<div class="common_rcp_caption">
													<div class="common_rcp_caption_tit line2">너무잘먹엇습니다^^
														조리법도 쉽고 맛도 있고너무 좋앗어요^^</div>
													<div class="common_rcp_caption_name"
														style="display: inline-block;">
														<p class="common_rcp_caption_name_pic">
															<img
																src="https://recipe1.ezmember.co.kr/img/df/pf_100_100.png">구조버스
														</p>
													</div>
													<div class="common_rcp_caption_rv"
														style="display: inline-block;">
														<span class="common_rcp_caption_rv_star"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"><img
															src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png"></span>
													</div>
												</div>
										</a></li>

									</ul>
									<div class="view_btn_more" id="" style="margin-right: 65px;">
										<a
											href="/recipe/list.html?q=%EC%83%88%EC%9A%B0%EB%B3%B6%EC%9D%8C%EB%B0%A5"
											style="margin-bottom: 40px;">새우볶음밥 레시피 더보기</a>
									</div>
								</div>
							</div>
							<div class="blank_bottom"></div>

							<!-- 추천 레시피 -->
							<script>
								var curVRPage = 1;
								var totalVRcnt = 0;
								
								function getViewRecipeList(page){
									if($("#rRecipContDivPage_"+page).length > 0){
								        $("[id^='rRecipContDivPage_']").hide();
								        $("#rRecipContDivPage_"+page).show();
								        curVRPage = page;
								        return ;
								    }
									
								    var rvArr = storageUtil.get('stRecentViewRecipe');
								    
								    if(!rvArr || rvArr == 'FAIL'){
								        $("#recentRecipeDiv").hide();
								        return ;
								    }
								   
								    totalVRcnt = rvArr.length;
								    
								    var scale = 5;
								    var skip = (page-1) * scale;
								    var lastpage = Math.ceil(totalVRcnt/scale);
								    var hstr = '';
								    hstr += '<div id="rRecipContDivPage_'+page+'" class="row">';
								    if(page > 1) hstr += '<a href="javascript:void(0);" class="list_btn_pre" onClick="getViewRecipeList('+(page-1)+')"><img src="https://recipe1.ezmember.co.kr/img/btn_arrow1_l.png" alt="이전"></a>';
								    if(page < lastpage) hstr += '<a href="javascript:void(0);" class="list_btn_next" onClick="getViewRecipeList('+(page+1)+')"><img src="https://recipe1.ezmember.co.kr/img/btn_arrow1_r.png" alt="다음"></a>';
								    for(var i=skip; i<skip+scale; i++)
								    {
								        var rvs = rvArr[i];
								        if(!rvs) continue;
								        hstr += '<div class="col-xs-2">';
								        hstr += '<a class="thumbnail" href="https://www.10000recipe.com/recipe/'+rvs.seq+'"><img src="'+rvs.thumb+'" style="width:180px; height:180px;">';
								        hstr += '<div class="caption elipsis_rrtitle"><b>'+rvs.title+'</b></div></a>';
								        hstr += '</div>';
								    }
								    hstr += '</div>';
								    if(page != 1 && curVRPage > page) $("#recentRecipeContDiv").prepend(hstr);
								    else  $("#recentRecipeContDiv").append(hstr);
								    getViewRecipeList(page);
								    $(".elipsis_rrtitle").ellipsis({row: 2});
								}
								
								$(document).ready(function () {
								    getViewRecipeList(1);
								})
							</script>

							<!-- 추천레시피 -->
							<div id="recentRecipeDiv" class="container">
								<div class="rcp_lately_list">
									<h3>최근 본 레시피</h3>
									<div id="recentRecipeContDiv">
										<div id="rRecipContDivPage_1" class="row"
											style="display: block;">
											<a href="javascript:void(0);" class="list_btn_next"
												onclick="getViewRecipeList(2)"> <img
												src="https://recipe1.ezmember.co.kr/img/btn_arrow1_r.png"
												alt="다음">
											</a>
											<div class="col-xs-2">
												<a class="thumbnail"
													href="https://www.10000recipe.com/recipe/6895214"> <img
													src="https://recipe1.ezmember.co.kr/cache/recipe/2018/09/03/a1484790f7ca9f7854d9ef470a14ef021_m.jpg"
													style="width: 180px; height: 180px;">
													<div class="caption elipsis_rrtitle">달콤 바삭 캬라멜 식빵팝콘
														만들기...</div>
												</a>
											</div>
											<div class="col-xs-2">
												<a class="thumbnail"
													href="https://www.10000recipe.com/recipe/6943918"> <img
													src="https://recipe1.ezmember.co.kr/cache/recipe/2020/10/12/45876f3267f9fdc0047b256cb2eb18ef1_m.jpg"
													style="width: 180px; height: 180px;">
													<div class="caption elipsis_rrtitle">부드럽고 살살녹는 간단한 [
														샌드위치 ]...</div>
												</a>
											</div>
											<div class="col-xs-2">
												<a class="thumbnail"
													href="https://www.10000recipe.com/recipe/6859194"> <img
													src="https://recipe1.ezmember.co.kr/cache/recipe/2016/10/26/f6bb7ed9b795c02fbee24563896f56041_m.jpg"
													style="width: 180px; height: 180px;">
													<div class="caption elipsis_rrtitle">고추장아찌황금레시피,고추장아찌담그는법
														...</div>
												</a>
											</div>
											<div class="col-xs-2">
												<a class="thumbnail"
													href="https://www.10000recipe.com/recipe/6912734"> <img
													src="https://recipe1.ezmember.co.kr/cache/recipe/2019/05/25/39ac1e73e998e88da300d38663242f0a1_m.jpg"
													style="width: 180px; height: 180px;">
													<div class="caption elipsis_rrtitle">버섯으로 관자 느낌 내는
														방법! 새송이버섯간장버터...</div>
												</a>
											</div>
											<div class="col-xs-2">
												<a class="thumbnail"
													href="https://www.10000recipe.com/recipe/6867650"> <img
													src="https://recipe1.ezmember.co.kr/cache/recipe/2017/03/29/cee70f9835e0221d85d634cce75674721_m.jpg"
													style="width: 180px; height: 180px;">
													<div class="caption elipsis_rrtitle">다른 반찬이 필요없는 매운
														어묵 비빔밥~*...</div>
												</a>
											</div>
											<div class="col-xs-2">
												<a class="thumbnail"
													href="https://www.10000recipe.com/recipe/6859194"> <img
													src="https://recipe1.ezmember.co.kr/cache/recipe/2016/10/26/f6bb7ed9b795c02fbee24563896f56041_m.jpg"
													style="width: 180px; height: 180px;">
													<div class="caption elipsis_rrtitle">고추장아찌황금레시피,고추장아찌담그는법
														...</div>
												</a>
											</div>
											<div class="col-xs-2">
												<a class="thumbnail"
													href="https://www.10000recipe.com/recipe/6912734"> <img
													src="https://recipe1.ezmember.co.kr/cache/recipe/2019/05/25/39ac1e73e998e88da300d38663242f0a1_m.jpg"
													style="width: 180px; height: 180px;">
													<div class="caption elipsis_rrtitle">버섯으로 관자 느낌 내는
														방법! 새송이버섯간장버터...</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 추천레시피 끝 -->

						</div>
						<!-- /contents_area -->

						<div class="col-xs-12 sub_bg_btm"></div>
					</div>

				</div>
				<!-- 컨텐츠 끝 -->
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
				<h2><%= login_id %></h2>
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
					<ul id="rankingSide" class="recipestore"></ul>
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
					<p class="copyright">&copy; Copyright 모두의 레시피. All Rights
						Reserved</p>
				</footer>
				<!-- 푸터 끝 -->
				
			</div>
		</div>
		<!-- 사이드바 끝 -->

		<div id="viewPicDivModal" class="modal" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" style="padding: 0;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">사진</h4>
					</div>
					<div class="modal-body" style="padding: 5px; max-width: 600px">
						<div id="viewPicModalCont"></div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
<script type="text/javascript">
var i = 0;

$(document).ready(function(){
		
	$("#review_img").on("change", handleImgFileSelect);
	
	sideRanking();
	
	//i++;
	function doPrint(){
	    var wnd = window.open('./recipe_print.do');
	    if (wnd) wnd.focus();
	};
	
	$( ".star_rating a" ).click(function() {
	     $(this).parent().children("a").removeClass("on");
	     $(this).addClass("on").prevAll("a").addClass("on");
	     return false;
	});
	
	reviewData();
	
	$('#reviewBtn').on('click', function() {
		
		 if(starNo == 0){
	         alert('별점을 눌러주세요!!');
	      }else{
		
		var rvwriter = "<%= id %>";
		$.ajax({
	        type:"POST",
	        data: {
	        	rcseq : <%=rcseq %>,
	        	rvwriter : rvwriter,
	        	star : starNo,
	        	rvcontent : $('#cmt_tx_content1').val(),
	        },
	        url: "review_ok.do",
	        success : function(json) {  
	        	fn_submit(json.rvseq);        	
	        }
	     });
	   }
	});
		
	//step
	$.ajax({
        type:"POST",
        data: {
        	rcseq : <%=rcseq %>
        },
        url: "recipe_view_step.do",
        success : function(json) {        	
             for(var i in json){
            	 
              	 var html = "";
              
	             html += "<div id='stepDiv" + json[i]["storder"] + "' class='view_step_cont media step" + json[i]["storder"] + "'>";
	             html += "<div id='stepdescr" + json[i]["storder"] + "' class='media-body'>";
	             html += json[i]["content"];
	             /* html += "새우를 손질합니다. <br /> 세척한 새우껍질를 벗기고 머리를 제거한 후 새우 등에 있는 내장을 빼줍니다.<br />";
	           	 html += "내장이 잡히지 않는 경우 이쑤시개로 빼줍니다.<br /> <br />"; 
	        	 html += "<p class='step_add add_material'>새우6마리</p>";
	       		 html += "<p class='step_add add_tool'>이쑤시개</p>";*/
	       		 html += "</div>";
	
	           	 html += "<div id='stepimg" + json[i]["storder"] + "' class='media-right'>";
	          	/*  html += "<img src='D:/workspace/FinalProject_1031_0900/src/main/webapp/picture/"+ json[i]["rcseq"] +"/Step/"+json[i]["filename"]+"'>";	 */
	        	 html += "<img src='./picture/"+ json[i]["rcseq"] +"/Step/"+json[i]["filename"]+"'>";	 
	       		 html += "</div>";
	        	 html += "</div>";
	        	 
	        	 $('#step_content').append(html);
             }
        }
     });
	
	//material
	$.ajax({
        type:"POST",
        data: {
        	rcseq : <%=rcseq %>
        },
        url: "recipe_view_material.do",
        success : function(json) {        	
             for(var i in json){
              	var html = "";
              
              	html += "<a href='javascript:viewMaterial('78');' onclick='ga('send', 'event', '레시피본문', '재료정보버튼클릭', '" + json[i]["name"] + "');'>";
              	html += "<li>" + json[i]["name"] + "<img src='https://recipe1.ezmember.co.kr/img/mobile/icon_info.png' style='width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;'>";
       			html += "<span class='ingre_unit'>" + json[i]["amount"] + "</span>";
              	html += "</li>";
           		html += "</a>";
	        	 
	        	 $('#material_content').append(html);
             }
	     }
     });
	
	//recipe
	$.ajax({
        type:"POST",
        data: {
        	rcseq : <%=rcseq %>
        },
        url: "recipe_view_recipeView.do",
        success : function(json) {        	
             for(var i in json){
              	var html = "";
              	html += "<dl class='view_step_tip'>";
              	html += "<dt>";
           		html += "<img src='https://recipe1.ezmember.co.kr/img/tit_tip.gif' alt='팁-주의사항'>";
       			html += "</dt>";				
      			html += "<dd>" + json[i]["tip"] + "</dd>";			
          		html += "</dl>";
          		html += "<div class='view_notice'>";
          		html += "<p class='view_notice_date'>";
           		html += "<b>등록일 : " + json[i]["wdate"] + "</b>";
          		html += "</p>";
           		html += "<span>저작자의 사전 동의 없이 이미지 및 문구의 무단 도용 및 복제를 금합니다.</span>";
           		html += "</div>";           		
	        	$('#recipe_tip_wdate_content').append(html);	
	        	//레시피뷰 메인사진나오는 부분
	        	var html1 = "";	        	
	        	html1 += "<div class='view_cate st2' style='z-index: 10;'>";
	        	html1 += "<div class='view_cate_num'><span class='hit font_num'>" + json[i]["hit"] + "</span></div>";
	        	html1 += "</div>";
	       		html1 += "<div class='centeredcrop'>";
	       		html1 += "<img id='main_thumbs' src='./picture/" + json[i]["rcseq"] + "/Thumb/"+ json[i]["rcseq"] +"_thumb_1.jpg' alt='main thumb'>";
	       		/* html1 += "<img id='main_thumbs' src='D:/workspace/FinalProject_1031_0900/src/main/webapp/picture/" + json[i]["rcseq"] + "/Thumb/"+ json[i]["rcseq"] +"_thumb_1.jpg' alt='main thumb'>"; */
	     		html1 += "</div>";
	      		html1 += "<div class='user_info2'>";
	      		html1 += "<a class='app_block_link_remove user_info2_pic'>";
	      		html1 += "<img src='./images/profile_default.jpg'>";
	      		html1 += "</a>";
	       		html1 += "<span class='user_info2_name'>&nbsp;&nbsp;";
	       		html1 += json[i]["nickname"]
	       		html1 += "<button id='friendDiv' type='button' class='btn btn-xs btn-default' onclick='doAddFriend()'>소식받기</button>";
	        	html1 += "</span>";
	        	html1 += "</div>";	        	
	        	$('#recipe_rfilename_hit_nickname_content').append(html1);
	        	
	        	var html2 = "";
	              html2 += "<h3>" + json[i]["subject"] + "</h3>";
	                html2 += "<div class='view2_summary_in' id='recipeIntro'>";
	                html2 += "<span class='view2_summary_in_m1'> \" </span>"; 
	                html2 += "<span class='view2_summary_in_m2'> \" </span>"; 
	                html2 += json[i]["rintroduce"];
	             html2 += "</div>";   
	             $('#recipe_subject_intro_content').append(html2);
	                
	             var html2_1 = "";
	             html2_1 += "<a onclick='$('#snsLinkModal').modal('show')'>"; 
	             html2_1 += "<img src='https://recipe1.ezmember.co.kr/img/mobile/btn_view_talk.png'>";
	             html2_1 += "<span>공유</span>";
	             html2_1 += "</a>";
	               html2_1 += "<a href='#commentLists'>"; 
	                html2_1 += "<img src='https://recipe1.ezmember.co.kr/img/mobile/btn_view_re.png'>";
	                html2_1 += "<span>후기<b class='st3'>" + json[i]["rev"] + "</b></span>";
	                html2_1 += "</a>";                
	                $('#recipe_rev_content').append(html2_1);
	       		
	       		var html3 = "";
	       		html3 += "<div class='profile_pic'>";
	       		html3 += "<a href='/profile/index.html?uid=fanyloveh2'>";
	     		html3 += "<img src='" + json[i]["picture"] + "'>";
	  			html3 += "</a>";
	  			html3 += "</div>";
	  			html3 += "<div class='profile_cont'>";
	  			html3 += "<p class='cont_name'>";
	     		html3 += json[i]["nickname"]
	    		html3 += "<button id='friendDiv2' type='button' class='btn btn-lg btn-default' onclick='doAddFriend()'>";
	     		html3 += "<span class='glyphicon glyphicon-plus'></span>소식받기";
	       		html3 += "</button>";
	       		html3 += "</p>";
	       		html3 += "<p class='cont_intro'>" + json[i]["mintroduce"] + "</p>";
	       		html3 += "</div>";
	       		$('#recipe_nickname_picture_mintroduce_content').append(html3);
             }          
         }
     });
	
	getScrapCount();
	
	var isFirst = "<%=isFirst%>";
	if(isFirst !=="true"){
		seenRecipe();	
	}
});

//스크랩
var scrapClick = function() {
      var id = "<%=id %>";
   $.ajax({
         type:"POST",  
         data : {
            rcseq : <%=rcseq %>,
            id : id      
         },
         url: "recipe_scrapPlus.do",
         success : function(json) {
	         if(json.flag == 1){
	            alert('스크랩 되었습니다. 마이페이지에서 확인하세요.');
	            getScrapCount();
	         }else{
	            alert('이미 스크랩한 레시피입니다.');
	         }
         },
         error : function(e) {
         alert('스크랩에 실패했습니다.');
         
         console.log(e);
      	}
	});  
}

var getScrapCount = function() {
   
   $.ajax({
         type:"POST",  
         data : {
            rcseq : <%=rcseq %>
         },
         url: "recipe_getScrapCount.do",
         success : function(json) {                                      
         $('#scrapNum').empty();
         $('#scrapNum').append(json.scrap);           
         }
	});  
}

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

    filesArr.forEach(function(f) {
        if (!f.type.match(reg)) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#rev_img_up").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}

var starNo = 0;

var starNum = function(star) {
	starNo = star;	
}
/* review */
var reviewData = function() {
	
	$.ajax({
        type:"POST",
        data: {
        	rcseq : <%=rcseq %>	        	        	
        },
        url: "review_data.do",
        success : function(data) {
    		var result = "";
    		var result1 = "";
    		
			for ( var i in data) {
				if (data[i]["rvfilename"]=="noImage,png"){
					console.log("noimage");
				}
				
					if (i < 3) {
						result += "<div class='media reply_list'>";

						result += "<div class='media-body'>";
						result += "<h4 class='media-heading'>";
						result += "<b class='info_name_f'>" + data[i]["nickname"] + "</b>" + data[i]["rvwdate"];
						result += "<span class='reply_list_star'>";
						for (var j = 0; j < data[i]["star"]; j++) {
							result += "<img src='./images/icon_star2_on.png'>";
						}
						result += "</span>";
						result += "</h4>";
						result += "<p class='reply_list_cont'>";
						result += data[i]["rvcontent"];
						result += "</p>";
						result += "</div>";
						
						result += "<div class='media-image'>";
						
						
						if(data[i]["rvfilename"] === 'no Image' || data[i]["rvfilename"] ===  null){
							result += "<img src='./images/noImage_100.png'>";
						}else{
					/* 		result += "<a href='javascript:viewLargePic(\".../picture/rev_pic/"+ data[i]["rvseq"] + "/"	+ data[i]["rvfilename"]	+ "\")' class='reply_list_img'>"; */
							result += "<a href='.../picture/rev_pic/"+ data[i]["rvseq"] + "/"	+ data[i]["rvfilename"]	+ "' class='reply_list_img'>"; 
							result += "<img src='.../picture/rev_pic/"+data[i]["rvseq"]+"/"+ data[i]["rvfilename"] +"' alt='사진없음'></a>";	
						}
						
						result += "</div>";
												
						result += "</div>";
						
						$('#review_content').empty();
						$('#review_content').append(result);
					} else if (i > 3) {
						result1 += "<div class='media reply_list'>";
						
						result1 += "<div class='media-body'>";
						result1 += "<h4 class='media-heading'>";
						result1 += "<b class='info_name_f'>" + data[i]["nickname"] + "</b>" + data[i]["rvwdate"];
						result1 += "<span class='reply_list_star'>";
						for (var j = 0; j < data[i]["star"]; j++) {
							result1 += "<img src='../images/icon_star2_on.png'>";
						}
						result1 += "</span>";
						result1 += "</h4>";
						result1 += "<p class='reply_list_cont'>";
						result1 += data[i]["rvcontent"];
						result1 += "</p>";
						result1 += "</div>";
						
						result1 += "<div class='media-image'>";
						result1 += "<a href='javascript:viewLargePic('./picture/rev_pic/"+ data[i]["rvseq"]	+ "/" + data[i]["rvfilename"] +"'/)' class='reply_list_img'>";
						result1 += "<a href='./picture/rev_pic/"+ data[i]["rvseq"] + "/"	+ data[i]["rvfilename"]	+ "' class='reply_list_img'>"; 
						result1 += "<img src='./picture/rev_pic/"+data[i]["rvseq"]+"/"+ data[i]["rvfilename"] +"' alt='No Image'></a>";
						result1 += "</div>";
						
						result1 += "</div>";
						$('#review_more_content').empty();
						$('#review_more_content').append(result1);
					}
				}
			}
		});
	};

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
					result += "<a href'./recipe_view.do?rcseq="
							+ json[i-1]["rcseq"] + "'>"
							+ json[i-1]["subject"] + "</a>";
					result += "</li>";
					$('#rankingSide').append(result);
				}
			}
		});
	};

	var reviewImgSel = function() {
		$('#review_img').click();
	};

	function fn_submit(rvseq) {
		var form = new FormData();
		form.append("review_img", $("#review_img")[0].files[0]);

		$.ajax({
			url : "review_img_ok.do?rvseq=" + rvseq,
			type : "POST",
			processData : false,
			contentType : false,
			data : form,
			success : function(response) {
				
				if (response.flag == 1) {
					alert("후기 작성 완료!");
					reviewData();
					$('#cmt_tx_content1').val('');
					$("#rev_img_up")
							.attr("src",
									"./images/pic_none3.gif");

				} else {
					alert("후기 작성 실패..");
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	function viewLargePic(imgSrc) {
		var html = '<div class="text-center"><img src="'+imgSrc+'" style="max-width:580px;"></div>';
		$("#viewPicModalCont").html(html);
		$("#viewPicDivModal").modal("show");
	}

	var reviewsOpens = 0;

	function doMoreReviewToggles() {
		if (reviewsOpens == 0) {
			$("#moreViewReviewList").show();
			$("#btnMoreReviews").html('줄여보기');
			reviewsOpens = 1;
		} else {
			$("#moreViewReviewList").hide();
			$("#btnMoreReviews").html('전체보기');
			reviewsOpens = 0;
			location.href = '#reviewLists';
		}
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

	
	document.documentElement.className = "js";
	
	var supportsCssVars = function() {
		var e, t = document.createElement("style");
		return t.innerHTML = "root: { --tmp-var: bold; }", document.head
				.appendChild(t),
				e = !!(window.CSS && window.CSS.supports && window.CSS
						.supports("font-weight", "var(--tmp-var)")),
				t.parentNode.removeChild(t), e
	};
	supportsCssVars()
			|| alert("Please view this demo in a modern browser that supports CSS Variables.");
	
	
</script>
</html>