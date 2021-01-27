<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>모두의 레시피</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link rel="stylesheet" href="./css/admin/admin_member.css" />
<link rel="stylesheet" href="./css/tapmenu.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/base/jquery-ui.css" />
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<script type="text/javascript" src="./js/jquery-3.5.1.js"></script> 
<script type="text/javascript" src="./js/jquery-ui.js"></script> 

<script type="text/javascript">
$(document).ready(function() {
		$("#query").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#users tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
    $("#modifyDialog").css('display', 'none');
    $("#deleteDialog").css('display', 'none'); 
   // listserver();
    // 테스트
    $('button.action').button().on('click', function() {
    	//listserver();// 수정
        if($(this).attr('action') == 'modify') {
            $('#modifyDialog').dialog({
                width: 1200,
                height: 500,
                modal: true,
                buttons: {
                	"취소": function() {
                       
                		$(this).dialog('close');
                        
                    },
                     "글수정": function() {
                    	
                    	 alert('수정');
                    	 
                    	 $(this).dialog('close');
                         
                     }
                }
            });
        // 삭제
        }  else if($(this).attr('action') == 'delete') {
            $('#deleteDialog').dialog({
                width: 700,
                height: 310,
                modal: true,
                buttons: {
					"글삭제": function() {
						$(this).dialog('close');
						alert('삭제되었습니다.');
					},
					"취소": function() {
						$(this).dialog('close');
					}
                }
            });
        }  
    });
    listServer();
});



    // 테스트 끝
    /* list data start */
	var listData = function(json) {
	
		/*  */
			$('#users tbody ').empty();
			$.each(json, function(index, item) {
				/*  */	
				//console.log(item.id);
					var html = "";
					html += "	<tr>";
					html += "	<td id='td_nomal'>"+ item.id +"</td>";
					html += "	<td id='td_nomal'>"+ item.password +"</td>";
					html += "	<td id='td_nomal'>"+ item.nickname +"</td>";
					html += "	<td id='td_nomal'>"+ item.email +"</td>";
					html += "	<td id='td_nomal'>"+item.gender+"</td>";
					html += "	<td id='td_nomal'>"+item.phone+"</td>";
					html += "	<td id='td_nomal'>"+item.introduce+"</td>";
					html += "	<td class='td_btn'>";
					html += '		<button idx="'+item.id+'" action="modify" class="action" >수정</button>';
					html += '		<button idx="'+item.id+'" action="delete" class="action">삭제</button>';
					html += "	</td>";
					html += "	</tr>";
					
					$('#users tbody').append(html);
					
					$('button.action').button().on('click', function() {
						/* var row = $(this).attr('idx'); // 헷갈리지 않게 삭제에 필요한 seq는 row로 받아오고 -idx( 어차피 같은 값)
						var id = $(this).attr('id');  */// 수정은 seq로 받아온다 -seq ( 어차피 같은 값)
						
						
						//여기 다이알러그가 진짜
						if($(this).attr('action') == 'modify' && $(this).attr('idx') == item.id) {
							//dialog를 띄우기 전에 수정에 필요한 데이터 가져오기 
						 	$('#m_id').val(item.id);
							$('#m_password').val(item.password);
							$('#m_nickname').val(item.nickname);
							$('#m_email').val(item.email);
							$('#m_gender').val(item.gender);
							$('#m_phone').val(item.phone);
							$('#m_introduce').val(item.introduce);

							$('#modifyDialog').dialog({	                
								width: 700,	                    
								height: 500,	                    
								modal: true,      	                    
								buttons: {	                    
									"글수정": function() {
										var id = item.id;
										var password = $('#m_password').val();
			                        	var nickname = $('#m_nickname').val();
			                        	var email = $('#m_email').val();
			                        	var phone= $('#m_phone').val();
										var introduce = $('#m_introduce').val();
			                         	modifyServer(id, password, email, nickname, phone, introduce);
			                         	
			                        	$(this).dialog('close');
			                        	
									},
			                        
									"취소": function() {	                        
										$(this).dialog('close');	                           
									}	                    
								}	                
							});
						} else if($(this).attr('action') == 'delete'  && $(this).attr('idx') == item.id) {	  
							//dialog를 띄우기 전에 삭제에 필요한 데이터 가져오기 
						 $('#d_id').val(item.id);
							
							$('#deleteDialog').dialog({	                
								width: 700,	                    
								height: 310,	                    
								modal: true,	                    
								buttons: {	                      
									"글삭제": function() {
										$(this).dialog('close');      
										var id = item.id;
										var d_password = $('#d_password').val();
										var rcseq = item.rcseq;
										deleteServer(id, d_password, rcseq);
									},
			                           
									"취소": function() {	                        
										$(this).dialog('close');	                           
									}	                    
								}	                
							});	            
						} 	    
					});
			});

	};
	   /* list data end */
	

	   /* list Server start */
	var listServer = function() {
		$.ajax({
			url :'admin_member_list.do',//데이터만
			//컨트롤러로 가서 DB연결해서 메서드 안의 서정한 리턴값으로 지정한 Json으로 가공해서가져옴
			type : 'get',
			dataType : 'json',
			success: function(json) {
				//console.log(json);
				
				/* 목록 시작 */
				listData(json);// 데이터 선언
				/* 목록 끝 */

			},
			error: function(err) {
				console.log('err'+ err.status);
				console.log('err'+ err.responseText);
			}
		});
	};
	/* list Server end */
	
	/* modify Server start */
	// 수정
	  var modifyServer = function(id, password, email, nickname, phone, introduce) {
      $.ajax({
		url: 'admin_member_modify_ok.do',         
		type: 'get',
		dataType:'json',
		data:{
			id : id,
			password : password,
        	email : email,
        	nickname : nickname,
			phone : phone,
			introduce : introduce
         },
		success: function(json) {
            //console.log(json);
            
            if(json.flag == 0){
               alert('수정되었습니다.');
               $('#modifyDialog').dialog('close');
               listServer();
            }else{
               alert('수정 실패.');
               $('#modifyDialog').dialog('open');
            }
            
         },
		error : function(error) {
            console.log('[에러] : ' + error.status);
            console.log('[에러] : ' + error.responseText);
         }
      });   
   } 
	/* modify Server end */

	/* deleteServer start */
	   var deleteServer = function(id, d_password) {
       $.ajax({
         url: 'admin_member_delete.do',         
         type: 'get',
         dataType:'json',
         data: {
        	 id : id,
        	 password : d_password,
        	// rcseq : rcseq
         },
         
         success: function(json) {
            //console.log(json);
            if(json.flag == 0){
               alert('삭제되었습니다');
               $('#deleteDialog').dialog('close');
               listServer();
               
            }else{
               alert('비밀번호가 다릅니다.');
               $('#deleteDialog').dialog('open');
            }
            
         },
         error : function(error) {
            console.log('[에러] : ' + error.status);
            console.log('[에러] : ' + error.responseText);
         }
      });   
   };  
	/* deleteServer end */
	
	
</script>
<title>모두의 레시피</title>
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

					<!-- <section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="재료명, 요리명" />
					</form>
				</section> -->

					<ul class="icons">
						<li><a href="./mainhome.do"><span class="label">사용자
									화면으로 이동</span></a></li>
						<li><a href="./login.do"><span class="label">로그인</span></a></li>
						<li><a href="./recipe_write.do"><span class="label">레시피
									등록</span></a></li>
						<li><a href="./admin_main.do"><span class="label">관리자</span></a></li>
						<li><a href="#" class="icon"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon"><span class="label">Medium</span></a></li>
					</ul>
				</header>
				<!-- 상단 끝 -->


				<!-- 컨텐츠 -->
				<!-- 회원관리 컨텐츠 시작 -->
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							<section id="search" class="alt">
								<!-- 게시글 검색, 분류  -->
								<div id="content_util">
									<input type="text" name="query" id="query" placeholder="검색할 내용을 입력하세요." />
									<!-- <div class="btn_search"> -->
									<!-- <button type="button" value="검색" id="btn_search">검색</button> -->
									<!-- </div> -->


								</div>
								<!-- 게시글 검색, 분류  -->
							</section>
						</div>
					</div>


					<!-- 목록 시작 -->
					<div class="row">
						 <table class="table" id="users">
							<thead>
								<tr>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>별명</th>
									<th>메일</th>
									<th>성별</th>
									<th>연락처</th>
									<th>소개글</th>	
									<th>수정 /삭제</th>
								</tr>
							</thead>
							<tbody>
							<div ></div>
								<!-- <tr>
									<td id="td_nomal">mental</td>
									<td id="td_nomal">4444</td>
									<td id="td_nomal">안녕하세요,멘탈이 가출할 만큼 맛있는레시피!</td>
									<td id="td_nomal"><img src="./images/icon/login.png"
										alt="profile" /></td>
									<td id="td_nomal">22</td>
									<td id="td_nomal">2020-10-12</td>
									<td class="td_btn">
										<button type="button" action="modify" class="action">수정</button>
										
										삭제 버튼 시작
										<button type="button" action="delete" class="action">삭제</button>
										삭제버튼 끝

									</td>
								</tr> -->
							</tbody>
						</table>
						
						
					</div>
					<!-- 목록 끝 -->

					<!-- 회원관리 컨텐츠 -->
					<!-- 컨텐츠 끝 -->
				</div>
				<!-- modify dialog -->
		 		<div id="modifyDialog" title="정보 수정" class="ui-dialog">
				 <fieldset>
				 	<div class="fiel">
						 <div>
							<!-- readonly -->
							<label for="id" class="dialog">I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D</label>
							<input type="text" id="m_id"
								class="text ui-widget-content ui-corner-all" readonly="readonly" />
						</div> 
						 <div>
							<label for="password" class="dialog">비밀&nbsp;번호</label> 
							<input type="text" id="m_password" class="text ui-widget-content ui-corner-all" />
						</div>
						<div>
							<label for="nickname" class="dialog">닉&nbsp;&nbsp;네&nbsp;&nbsp;임</label>
							<input type="text" id="m_nickname"
								class="text ui-widget-content ui-corner-all" />
						</div>
						<div>
							<label for="email" class="dialog">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
							<input type="text" id="m_email"
								class="text ui-widget-content ui-corner-all" />
						</div>
						<div>
							<label for="gender" class="dialog">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</label>
							<input type="text" id="m_gender" class="text ui-widget-content ui-corner-all" readonly="readonly" />
						</div>
						<div>
							<label for="phone" class="dialog">연&nbsp;&nbsp;락&nbsp;&nbsp;처</label>
							<input type="tel" id="m_phone"
								class="text ui-widget-content ui-corner-all" />
						</div>
						<div>
							<label for="intro" class="dialog">소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개</label>
							<br />
							<textarea rows="15" cols="100" id="m_introduce" class="text ui-widget-content ui-corner-all" ></textarea>
						</div>
						<!-- <div>
							<label for="profile" class="dialog">프&nbsp;&nbsp;로&nbsp;&nbsp;필</label>
							
							<input type="file" id="m_profile" name=file enctype="multipart/form-data"class="text ui-widget-content ui-corner-all"/>

						</div> -->
						<div>
							<!-- readonly -->
							<label for="allview" class="dialog">조회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;페이지</label>
							<input type="text" id="m_allview"
								class="text ui-widget-content ui-corner-all" readonly="readonly" />
						</div> 
					</div> 
				</fieldset> 
				</div> 
				<!--Modify dialog -->
				

				<!-- Delete dialog -->
				
				<!-- 버튼 누르면 바로 삭제
				 -->
				<div id="deleteDialog" title="글삭제"> 
				     <fieldset>
				          <div>
				               <label for="id" class="header">I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D</label>
				               <input type="text" id="d_id" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
				          </div>
				          <div>
				               <label for="password" class="header">비밀&nbsp;번호</label>
				               <input type="password" id="d_password" class="text ui-widget-content ui-corner-all"/>
				          </div>
				     </fieldset>
				</div> 
				<!-- Delete dialog -->
			</div>
		</div>


		<!-- 사이드바/푸터 -->

		<div id="sidebar_1">

			<div class="inner">


				<!-- 카테고리(Menu) -->
				<nav id="menu" style="border-bottom: 0;">
					<header class="major">
						<h2>관리자 모드</h2>
					</header>

					<ul class="nav flex-column">
						<li ><a href="./admin_main.do">관리자 메인</a></li>

						<li><a href="./admin_member.do">회원관리</a></li>


						<li><a href="./admin_recipe.do">레시피 관리</a></li>

						<li><a href="./admin_review.do">후기관리 </a></li>
					</ul>

				</nav>
				<!-- 카테고리 끝 -->




				<!-- 푸터 -->
				<footer id="footer">
					<!-- class="container-fluid navbar-fixed-bottom" -->
					<p class="copyright">&copy; Copyright 모두의 레시피. All Rights
						Reserved</p>
				</footer>
				<!-- 푸터 끝 -->
			</div>
		</div>

		<!-- Modify dialog-form -->
		<!--  -->


		<!-- Modify dialog-form -->
	</div>

</body>

<!-- 자바스크립트 -->
<!-- <script src="./js/jquery.min.js"></script> jquery.js가 적용안돼서 위에 따로 선언 -->
<script src="./js/skel.min.js"></script>
<script src="./js/util.js"></script>
<script src="./js/main.js"></script>
<script src="./js/bootstrap.min.js"></script>
<!-- 자바스크립트 -->

</html>