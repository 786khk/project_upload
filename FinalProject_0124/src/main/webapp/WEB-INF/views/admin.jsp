<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<title>모두의 레시피</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./css/admin/admin_login.css" />

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
						<div class="check_info">
							<div class="login_check">
								<span class="login_check_box">
									<input type="checkbox" id="login_chk" name="nvlong" class="" value="off">
									<label for="login_chk" id="label_login_chk" class="ico_keep_check ">로그인 상태 유지</label>
								</span>
							</div>
						</div>
						<!-- 버튼 -->
						<button id="submit" class="btn_global">관리자 로그인</button>
						
					</fieldset>
				</div>
			</div>
			<!-- //container -->
		</div>
		<!-- 로그인 끝 -->
	</div>
</div>
	
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
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