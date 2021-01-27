<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<title>모두의 레시피</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./css/modoo/login.css" />

</style>
</head>
<body>
	<div id=wrapper>
		<div id="main">

			<!-- 로그인 -->
			<div id="wrap">
    		
				<!-- header -->
				<div id="header">
					<h1><a href="./main.do" class="sp r_logo" id="log.naver"><span class="blind">모두의레시피</span></a></h1>
				</div>
		
		
				<div id="container">
					<!-- content -->
					<div id="content">
						<div class="title" aria-live="assertive">
							<p></p>
						</div>
						<!-- autocomplete(자동완성 : 끔) -->
						
						
							<fieldset class="login_form">
								<legend class="blind">로그인</legend>
								<!-- 아이디 -->
								<div class="id_area">
									<div class="input_row" id="id_area">
										<span class="input_box">
											<label for="id" id="label_id_area" class="lbl" style="display: block;">아이디</label>
											<input type="text" id="id" name="id" accesskey="L" placeholder="아이디" class="int" maxlength="41" value="">
										</span>
									</div>
								</div>
								<!-- 비밀번호 -->
								<div class="pw_area">
									<div class="input_row" id="pw_area">
										<span class="input_box">
											<label for="pw" id="label_pw_area" class="lbl">비밀번호</label>
											<input type="password" id="pw" name="pw" placeholder="비밀번호" class="int" maxlength="16">
										</span>
									</div>
								</div>
		
								<!-- 버튼 -->
								<!-- <input type="submit" title="로그인" alt="로그인" value="로그인" class="btn_global" id="log.login"> -->
								<button id="submit" class="btn_global">로그인</button>
								
								<div class="check_info">
									<div class="login_check">
										<span class="login_check_box">
											<input type="checkbox" id="login_chk" name="nvlong" class="" value="off">
											<label for="login_chk" id="label_login_chk" class="ico_keep_check ">로그인 상태 유지</label>
										</span>
									</div>
								</div>
							</fieldset>
						
						<p class="help-block">개인정보 보호를 위해 개인 PC에서만 사용하세요.</p>
						
						<div class="position_a">
							<div class="find_info">
								<a target="_blank" id="idinquiry" href="">아이디 찾기</a> 
								<span class="bar" aria-hidden="true">|</span> 
								<a target="_blank" id="pwinquiry" href="">비밀번호 찾기</a> 
								<span class="bar" aria-hidden="true">|</span> 
								<a id="join" href="./agree.do">회원가입</a>
							</div>
						</div>
						
						<!-- 간편 로그인 -->
						<div class="qr_once_wrap">
							<div class="qr_once_inner">
								<p class="title">더욱 간편한 로그인</p>
								<div class="qr_once_area">
									<div class="item">
										<button type="button" id="log.otn" class="item_btn">
											<span class="icon_once" aria-hidden="true"></span>
											<span class="txt">네이버로 로그인</span>
										</button>
									</div>
								</div>
								<div class="nudge_tooltip" id="nudge_tooltip" style="display: none;">						
									<span class="banner_area">
										<span class="edge"></span>
										<span class="text"><em>PC방 등 공용 PC라면 안전하게 사용해 보세요.</em></span>
										<a href="#" id="nudge_close" role="button" aria-label="닫기" class="nudge_close"></a>
									</span>
								</div>
							</div>				
						</div>
						<!-- 간편 로그인 끝 -->
						
					</div>
					<!-- //content -->
				</div>
				<!-- //container -->
	
				<!-- footer -->
				<div id="footer">
					<ul>
						<li><a target="_blank" href="" id="fot.agreement">이용약관</a></li>
						<li><strong><a target="_blank" href="" id="fot.privacy">개인정보처리방침</a></strong></li>
						<li><a target="_blank" href="" id="fot.disclaimer">책임의 한계와 법적고지</a></li>
						<li><a target="_blank" href="" id="fot.help">회원정보 고객센터</a></li>
					</ul>
					<address><em class="copy">Copyright</em> <em class="u_cri">©</em> <a target="_blank" href="./main.do" class="u_cra" id="fot.navercorp">모두의 레시피</a> <span class="all_r">All Rights Reserved.</span></address>	
				</div>
				<!-- //footer -->
			</div>
			<!-- 로그인 끝 -->


		</div>
	</div>
	
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#label_id_area').focus();
	$('#submit').button().on('click', function() {
		var id = $('#id').val();
		var password = $('#pw').val();
		console.log(id);
		console.log(password);
		
		$.ajax({
	    	type: 'POST',
	    	data: {
				id : id,
				password : password
			},
		    dataType: 'JSON',
		    url: 'login_ok.do',
		    success: function(json) {
		    	if(json.flag == 1){
		    		alert('로그인 되었습니다.');
		    		location.href="./main.do?id="+id;
		    	}else{
		    	 	alert('아이디와 비밀번호를 확인해주세요.');
		    	}
		    	
			},    
		    error: function() {
		    	//에러처리
		    }             
		});
	});	
	
	$("#pw").keydown(function(key) {

	      if (key.keyCode == 13) {
	         //alert('11');
	         var id = $('#id').val();
	         var password = $('#pw').val();
	         console.log(id);
	         console.log(password);
	         
	         $.ajax({
	             type: 'POST',
	             data: {
	               id : id,
	               password : password
	            },
	             dataType: 'JSON',
	             url: 'login_ok.do',
	             success: function(json) {
	                if(json.flag == 1){
	                   alert('로그인 되었습니다.');
	                   location.href="./main.do?id="+id;
	                }else{
	                    alert('아이디와 비밀번호를 확인해주세요.');
	                }
	                
	            },    
	             error: function() {
	                //에러처리
	             }             
	         });
	 
	      }

	   });
	
});


</script>
</body>
<!-- script -->
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/skel.min.js"></script>
<script type="text/javascript" src="./js/util.js"></script>
<script type="text/javascript" src="./js/main.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<!-- script -->
</html>