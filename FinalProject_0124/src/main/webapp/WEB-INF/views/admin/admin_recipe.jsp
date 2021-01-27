<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link rel="stylesheet" href="./css/admin/admin_recipe.css" />
<link rel="stylesheet" href="./css/tapmenu.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/base/jquery-ui.css" />
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<script type="text/javascript" src="./js/jquery-3.5.1.js"></script> 
<script type="text/javascript" src="./js/jquery-ui.js"></script> 
<title>모두의 레시피</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#query").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#recipes tr").filter(function() {
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
                height: 200,
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
			$('#recipes tbody').empty();
			$.each(json, function(index, item) {
				/*  */	
				//console.log(item.id);
					var html = "";
					html += "	<tr>";
					html += "	<td id='td_nomal'>"+ item.rcseq +"</td>";
					html += "	<td id='td_nomal'>"+ item.rcwriter +"</td>";
					html += "	<td id='td_nomal'>"+ item.subject +"</td>";
					html += "	<td id='td_nomal'>"+ item.introduce +"</td>";
					html += "	<td id='td_nomal'>"+item.url+"</td>";
					html += "	<td id='td_nomal'>"+item.tip+"</td>";
					html += "	<td id='td_nomal'>"+item.category1+"</td>";
					html += "	<td id='td_nomal'>"+item.category2+"</td>";
					html += "	<td id='td_nomal'>" +item.wdate+ +"</td>";
					html += "	<td id='td_nomal'>" +item.hit+ + "</td>";
					html += "	<td id='td_nomal'>" +item.rev+ +"</td>";
					html += "	<td class='td_btn'>";
					html += '		<button idx="'+item.rcseq+'" action="modify" class="action" >수정</button>';
					html += '		<button idx="'+item.rcseq+'" action="delete" class="action">삭제</button>';
					html += "	</td>";
					html += "	</tr>";
					
					$('#recipes tbody').append(html);
					
					$('button.action').button().on('click', function() {
						/* var row = $(this).attr('idx'); // 헷갈리지 않게 삭제에 필요한 seq는 row로 받아오고 -idx( 어차피 같은 값)
						var id = $(this).attr('id');  */// 수정은 seq로 받아온다 -seq ( 어차피 같은 값)
						
						if($(this).attr('action') == 'modify' && $(this).attr('idx')== item.rcseq) {
							//dialog를 띄우기 전에 수정에 필요한 데이터 가져오기 
							 //modifyServer(rseq);
							$('#rcseq').val(item.rcseq);
							$('#rcwriter').val(item.rcwriter);
							$('#subject').val(item.subject);
							$('#introduce').val(item.introduce);
							$('#url').val(item.url);
							$('#tip').val(item.tip);
							$('#category1').val(item.category1);
							$('#category2').val(item.category2);
							$('#wdate').val(item.wdate);
							$('#hit').val(item.hit);
							$('#rev').val(item.rev);
							
							$('#modifyDialog').dialog({	                
								width: 700,	                    
								height: 800,	                    
								modal: true,      	                    
								buttons: {	                    
									"글수정": function() {
										var rcseq = item.rcseq;
			                      		var subject = $('#subject').val();
			                      		var introduce = $('#introduce').val();
			                      		var url = $('#url').val();
			                      		var tip = $('#tip').val();
										modifyServer(rcseq, subject, introduce, url, tip);
			                        	$(this).dialog('close');
									},
			                        
									"취소": function() {	                        
										$(this).dialog('close');	                           
									}	                    
								}	                
							});
						} else if($(this).attr('action') == 'delete' && $(this).attr('idx')== item.rcseq) {	  
							//dialog를 띄우기 전에 삭제에 필요한 데이터 가져오기 
							//$('#rcseq_d').val(item.rcseq);
							$('#subject_d').val(item.subject);
							
							$('#deleteDialog').dialog({	                
								width: 700,	                    
								height: 310,	                    
								modal: true,	                    
								buttons: {	                      
									"글삭제": function() {	
										$(this).dialog('close');
										var rcseq = $('#rcseq_d').val();
										//var subject = item.subject;
										 deleteServer(rcseq); 
									/* 	$('#d_subject').val('');
										$('#d_password').val('');*/  
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
			url : 'admin_recipe_list.do',//데이터만
			//컨트롤러로 가서 DB연결해서 메서드 안의 서정한 리턴값으로 지정한 Json으로 가공해서가져옴
			type : 'get',
			dataType : 'json',
			success: function(json) {
				console.log(json);
				
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
	 var modifyServer = function(rcseq, subject, introduce, url, tip){
	   $.ajax({
	      url: 'admin_recipe_modify.do',
	      data:{ 
	    	  rcseq : rcseq, 
	    	  subject : subject, 
	    	  introduce : introduce, 
	    	  url : url, 
	    	  tip : tip
	      },
	      type : 'get',
	      dataType : 'json', // 날라오는 데이터는 json이다.
	      success : function(json){
	         console.log(json);
	         if(json.flag == 0){
	               alert('수정되었습니다');
	               $('#modifyDialog').dialog('close');
	               listServer();
	            }else{
	               alert('수정 실패.');
	               $('#modifyDialog').dialog('open');
	            }
	             // 닫아주는 구문을 써야함
	           // $('#modifyDialog').dialog('close');
	            
	            // alert('에러')
	          
	      },
	      error : function(error){
	         console.log('[에러1]' + error.status);
	         console.log('[에러2]' + error.responseText);
	      }
	   });
	}; 
	/* modify Server end */
	
	/* deleteServer start */
    var deleteServer = function(rcseq) {
       $.ajax({
         url: 'admin_recipe_delete.do',         
         type: 'get',
         dataType:'json',
         data:{
        	 rcseq: rcseq,
        	 //subject: subject
         },
         success: function(json) {
            console.log(rcseq_d);
            console.log(subject_d);
            
            if(json.flag == 0){
               alert('삭제되었습니다');
               $('#deleteDialog').dialog('close');
               listServer();
               
            }else{
               alert('삭제 실패.');
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
				<!-- 레시피 컨텐츠 시작 -->
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							<section id="search" class="alt">
								<!-- 게시글 검색, 분류  -->
								<div class="content_util">
									
										<!-- <select name="index" id="index">
											<option selected>분류</option>
											<option value="kind">종류별</option>
											<option value="ingredient">재료별</option>
										</select> --> 
										<input type="text" name="query" id="query"
											placeholder="검색할 내용을 입력하세요." />
										<div class="btn_search">
											<!-- <button type="button" id="btn_search" value="검색">검색</button> -->
										</div>

									

								</div>
								<!-- 게시글 검색, 분류  -->
							</section>
						</div>
					</div>



					<!-- 테이블 시작 -->
					<div class="row">
						<table class="table" id="recipes">
							<thead>
								<tr>
									<th>No.</th>
									<th>작성자</th>
									<th>제목</th>
									<th>소개글</th>
									<!-- <th>사진</th> -->
									<th>url</th>
									<th>tip</th>
									<th>분류1</th>
									<th>분류2</th>
									<th>게시일</th>
									<th>조회수</th>
									<th>리뷰 수</th>
									<th>수정/삭제</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
					<!-- 테이블 끝 -->

				<!-- 수정 다이얼로그 -->
						<!-- modify dialog -->
				<div id="modifyDialog" title="정보 수정" class="ui-dialog">
				 <fieldset>
				 	<div class="fiel">

						 <div>
							<label for="rcseq" class="dialog">번&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;호</label>
							<input type="text" id="rcseq" class="text ui-widget-content ui-corner-all" readonly="readonly" />
						</div> 
						
						<div>
							<label for="rcwriter" class="dialog">작&nbsp;&nbsp;성&nbsp;&nbsp;자</label>
							<input type="text" id="rcwriter" class="text ui-widget-content ui-corner-all" readonly="readonly" />
						</div>
						
						<div>
							<label for="subject" class="dialog">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
							<input type="text" id="subject" class="text ui-widget-content ui-corner-all"  />
						</div>
					
						<div>
							<label for="introduce" class="dialog">소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개</label>
							<br />
							<textarea rows="15" cols="100" id="introduce" class="text ui-widget-content ui-corner-all" ></textarea>
						</div>
						<div>
							<label for="url" class="dialog">U&nbsp;&nbsp;&nbsp;R&nbsp;&nbsp;&nbsp;L</label>
							<br />
							<input type="text" id="url" class="text ui-widget-content ui-corner-all" />
						</div>
						<div>
							<label for="tip" class="dialog">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							<input type="text" id="tip" class="text ui-widget-content ui-corner-all" />
						</div>
						<div>
							<label for="category1" class="dialog">분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류1</label>
							<input type="text" id="category1" class="text ui-widget-content ui-corner-all" readonly="readonly"  />
						</div>
						<div>
							<label for="category2" class="dialog">분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;류2</label>
							<input type="text" id="category2" class="text ui-widget-content ui-corner-all" readonly="readonly"  />
						</div>
						<div>
							<label for="wdate" class="dialog">날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;짜</label>
							<input type="text" id="wdate"
								class="text ui-widget-content ui-corner-all" readonly="readonly" />
						</div>
						 <div>
							<label for="hit" class="dialog">조&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회</label>
							<input type="text" id="hit" class="text ui-widget-content ui-corner-all" readonly="readonly" />
						</div> 
						 <div>

							<label for="rev" class="dialog">댓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;글</label>
							<input type="text" id="rev" class="text ui-widget-content ui-corner-all" readonly="readonly" />
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
				               <label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
				               <input type="text" id="subject_d" class="text ui-widget-content ui-corner-all"readonly="readonly"/>
				          </div>
				          <div>
				               <label for="rcseq" class="header">글&nbsp;&nbsp;번&nbsp;&nbsp;호</label>
				               <input type="text" id="rcseq_d" class="text ui-widget-content ui-corner-all" />
				          </div>
				          
				     </fieldset>
				</div> 
				<!-- Delete dialog -->
				
				<!-- 수정 다이얼로그 -->
				
				</div>
				<!-- 레시피 컨텐츠 시작 -->
				<!-- 컨텐츠 끝 -->
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
						<li><a href="./admin_main.do">관리자 메인</a></li>

						<li><a href="./admin_member.do">회원관리</a></li>

						<li><a href="./admin_recipe.do">레시피 관리</a></li>

						<li><a href="./admin_review.do">후기관리 </a></li>
					</ul>

				</nav>
				<!-- 카테고리 끝 -->




				<!-- 푸터 -->
				<footer id="footer">
					<p class="copyright">&copy; Copyright 모두의 레시피. All Rights
						Reserved</p>
				</footer>
				<!-- 푸터 끝 -->
			</div>
		</div>


	</div>
</body>

<!-- 자바스크립트 -->

<script src="./js/skel.min.js"></script>
<script src="./js/util.js"></script>
<script src="./js/main.js"></script>
<script src="./js/bootstrap.min.js"></script>
<!-- 자바스크립트 -->

</html>