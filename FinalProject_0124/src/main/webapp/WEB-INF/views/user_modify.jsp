<%@page import="java.util.ArrayList"%>
<%@page import="model1.memberTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   	String login_id = (String) session.getAttribute("id");
	String login_state = "";
	StringBuffer login_user = new StringBuffer();
//StringBuffer modify = new StringBuffer();
//memberTO to = (memberTO)request.getAttribute("to");
	String id_l = (String)request.getAttribute("id");
	if (session.getAttribute("id") != null) {
	
	   login_id = (String) session.getAttribute("id");
	   //login_id = "<a>" + id + "님</a>";
	   // login_state = "<a href='./logout.do'><span class='label'>로그아웃</span></a>";
	
	   login_user.append("<li id='drop_nav' class='wrapper-dropdown-5'><a style='padding-right:20px'>" + login_id + "님</a>");
	   login_user.append("   <ul class='dropdown'>");
	   login_user.append("      <li><a href='./mypage_public.do'><span class='label'>마이페이지</span></a></li>");
	   login_user.append("      <li><a href='./user_modify.do'><i class='icon-remove'></i>회원정보수정</a></li>");
	   login_user.append(login_state = "<li><a href='./logout.do'><span class='label'>로그아웃</span></a></li>");
	   login_user.append("   </ul>");
	   login_user.append("</li>");
	   login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
	   login_user.append("<li><a href='./admin.do'><span class='label'>관리자</span></a></li>");
	
	} else {
	   login_user.append("<li><a href='./login.do'><span class='label'>로그인</span></a></li>");
	   login_user.append("<li><a href='./recipe_write.do'><span class='label'>레시피 등록</span></a></li>");
	   login_user.append("<li><a href='./admin.do'><span class='label'>관리자</span></a></li>");
	   //login_state = "<a href='./login.do'><span class='label'>로그인</span></a>";
	}
	
	
	
	if (session.getAttribute("id") != null) {
	   String id = (String) session.getAttribute("id");
	   /* 
	   modify.append( "<p style='margin: 15px 0; line-height: 34px;'>");
	   modify.append( "   <strong>" + to.getEmail() + "&nbsp;</strong>");
	   modify.append( "   <button id='btnUpdEmail' type='button' onclick='$('#updEmail').show()' class='btn btn-default' style='float: right;'>이메일 수정</button>");
	   modify.append("</p>");
	   modify.append("<div id='updEmail' style='display: none; margin-top: 20px;'>");
	   modify.append("   <div id='emailFrms' class='form-group has-feedback'>");
	   modify.append("   <input type='text' name='frm[pro_id_email]'class='form-control' id='id_email' placeholder='이메일'>");
	   modify.append("      <span id='emailStatus' class='glyphicon form-control-feedback' aria-hidden='true'></span> <span id='emailMsg' style='display: none;'></span>");
	   modify.append("   </div>");
	   modify.append("   <p style='text-align: center'>");
	   modify.append("   <button id='btnEmail' type='button' onclick='chkEmailSSL()'   class='btn' style='width: 150px'>변경</button>");
	   modify.append("   </p>");
	   modify.append("   <p class='help-block'>");
	   modify.append("      변경 신청하시면 확인메일이 새로운 메일주소로 발송됩니다.<br>메일이 도착하지 않는다면 스팸편지함도");
	   modify.append("      확인해 주세요.");
	   modify.append("   </p>");
	   modify.append("</div>");
	   
	   modify.append("<div class='etc_line'></div>");
	   modify.append("<p style='margin: 15px 0; line-height: 34px;'>");
	   modify.append("   <span id='cur_nick'><strong>"+to.getNickname()+"</strong>");
	   modify.append("   <button type='button' onclick='$('#updNick').show()' class='btn btn-default' style='float: right;''>닉네임 수정</button>");
	   modify.append("   </span></p>");
	   modify.append("<div id='updNick' style='display: none; margin-top: 20px;'>");
	   modify.append("   <div id='nickFrms' class='form-group has-feedback'>");
	   modify.append("      <input type='text' name='frm[pro_nm_user]' class='form-control' id='nm_user' placeholder='닉네임'> <span id='nickStatus' class='glyphicon form-control-feedback' aria-hidden='true'></span>");
	   modify.append("      <span id='nickMsg' style='display: none;'></span>");
	   modify.append("   </div>");
	   modify.append("   <p style='text-align: center'>");
	   modify.append("      <button type='button' onclick='chkNick()' class='btn' style='width: 150px'>변경</button>");
	   modify.append("   </p>");
	   modify.append("   <p class='help-block'>");
	   modify.append("      닉네임은 변경후 24시간동안 다시 변경할 수 없습니다.<br>변경전에 잘 확인해 주세요.");
	   modify.append("   </p></div>");
	   
	   modify.append("<div class='etc_line'></div>");
	   modify.append("<p style='margin: 15px 0; line-height: 34px;'>");
	   modify.append("   회원탈퇴");
	   modify.append("   <button type='button' onclick='location.href='/user/out.html'");
	   modify.append("      class='btn btn-default' style='float: right;'>탈퇴하기</button>");
	   modify.append("</p>");  */
	}

%>
<!DOCTYPE html>
<html>
<head>
<title>모두의 레시피</title>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./css/jquery.modal.min.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<!-- <link rel="stylesheet" href="./css/main.css" /> -->
<link rel="stylesheet" href="./css/modoo/drop_nav.css" />
<link rel="stylesheet" href="./css/modoo/tabs.css" />
<link rel="stylesheet" href="./css/modoo/tabstyles.css" />
<link rel="stylesheet" href="./css/modoo/user_info.css" />
<link rel="stylesheet" href="./css/modoo/top_button.css" />
<!-- <link rel="stylesheet" href="./css/modoo/join.css" /> -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">


<style type="text/css">
.modal {
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);   
   
}

#name::selection{
   background-color: #FFBB00;
}

#emailFrms{
   text-align: center;
}

#id_email{
   display: inline-block;
}

#id_email::selection{
   background-color: #FFBB00;
}

#authNo{   
   width: 200px;
   height: 40px;
   display: inline-block;
}
#authNoDiv{
   text-align: center;
}
</style>
<script type="text/javascript" src="./js/jquery-3.5.1.js"></script> 
<script type="text/javascript" src="./js/jquery-ui.js"></script> 
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

<script>
var authFlag = false;
var nameFlag = false;
var inNum = '';
$(document).ready(function(){
   getData();
   
   $('#btnSend').on('click', function() {
         
         var oMsg = $("#emailMsg");
         var oInput = $("#id_email");
         
         if($('#id_email').val() == ''){
            alert('메일을 입력해주세요');
            return false;
         }else{
            var email = $('#id_email').val();
            inNum = parseInt(Math.random() * 10000);
            //console.log(inNum);
            //console.log(email);
            
            sendEmail(email, inNum);
            
            $('#id_email').focus();
            $('#authNo').removeAttr('disabled');
            
            oMsg = $("#emailMsg");
            oInput = $("#email");
            
            if (email != "") {
               showErrorMsg(oMsg,"인증번호를 입력해주세요.<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.");
               return false;
            }
         }
      });
   
   
   /* 인증번호 */
      $("#authNo").blur(function() {
         //authFlag = false;
         checkAuthNo(inNum, authFlag);
      });
   
   /* 닉네임 */
   $("#name").blur(function() {
            
        //nameFlag = false;
        checkName(nameFlag);
     });
   
   
   /* 닉네임 */
    $("#mbtn").button().on('click', function() {
          
       var nickname = $('#name').val();
       var nameMsg = $('#nameMsg').val();
       
       var email = $('#email').val();                    
       var emailMsg = $('#emailMsg').val();   
     
       if(nickname == ''){
          $('#name').focus();                       
          showErrorMsg($('#nameMsg'), "필수 입력 정보입니다.");
       }else{
          if(nameFlag == false){
               $('#name').focus();       
          }else{
             //alert('11');
             var id = "<%=login_id %>"; 
             $.ajax({
                url: 'user_modify_nickname.do',
                data:{
                  id : id,
                   nickname : nickname                   
                },
                type: 'get',
                dataType: 'json',
                success: function( json ) {
                   if(json.flag == 1){
                      alert('변경되었습니다!');
                      //location.href = './login.do';
                   }
                   console.log( json );
                },
                error: function( error ) {
                   console.log( '[에러] ' + error.status );
                   console.log( '[에러] ' + error.responseText );
                }
             });
          }
       }
    });
   
    /* 이메일 */
    $("#btnEmail").button().on('click', function() {
         
      
       var email = $('#id_email').val();                    
       var emailMsg = $('#emailMsg').val();   
     
       if(email == ''){
          $('#id_email').focus();                       
          showErrorMsg($('#emailMsg'), "필수 입력 정보입니다.");
       }else{
          if(authFlag == false){
               $('#id_email').focus();       
          }else{
             //alert('11');
             var id = "<%=login_id %>";              
             $.ajax({
                url: 'user_modify_email.do',
                data:{
                  id : id,
                   email : email                   
                },
                type: 'get',
                dataType: 'json',
                success: function( json ) {
                   if(json.flag == 1){
                      alert('변경되었습니다!');
                      //location.href = './login.do';
                   }
                   console.log( json );
                },
                error: function( error ) {
                   console.log( '[에러] ' + error.status );
                   console.log( '[에러] ' + error.responseText );
                }
             });
          }
       }
    });
    
      //listServer();   
   
   $('#userDel').on('click', function() {
      var confirmTest = confirm('정말로 탈퇴하시겠습니까');
      var id = "<%=login_id %>"; 
      
      if(confirmTest == true){
         
         $.ajax({
                url: 'user_del.do',
                data:{
                  id : id                                   
                },
                type: 'get',
                dataType: 'json',
                success: function( json ) {
                   if(json.flag == 1){
                      alert('탈퇴되었습니다.');
                      location.href = './main.do';
                   }
                   //console.log( json );
                },
                error: function( error ) {
                   console.log( '[에러] ' + error.status );
                   console.log( '[에러] ' + error.responseText );
                }
             });
         
         
      }else if(confirmTest == false){
         
      }
   });
   
   
});
/* 입력 확인 스크립트 */
 /* 만개에서 가져온 스크립트 */
/*  
var opwFlag = false;

function chkEmailSSL() {
    emailFlag = false;
    var email = $("#id_email").val();
    if( !email )
    {
        viewMsg("email","이메일을 입력해 주세요.","error");
        return ;
    }
    var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var isHan = /[ㄱ-ㅎ가-힣]/g;
    if (!isEmail.test(email) || isHan.test(email))
    {
        viewMsg("email","이메일 주소가 올바르지 않습니다.","error");
        return ;
    }
    if( email.length < 4 || email.length > 100 )
    {
        viewMsg("email","100자 이내로 입력해 주세요.","error");
        return ;
    }
    $.ajax({
        type: "POST",
        url: "https://www.10000recipe.com/user/ajax.html",
        dataType: 'jsonp',
        jsonpCallback: 'jsonEzCallback',
        data: "q_mode=checkDuplicateSSL&item=email&id="+btoa(unescape(encodeURIComponent(email))),
        success: function(result) {
            result = result['result'];
            switch(result)
            {
                case 'NO_USE' :
                    if($("#updNick").html()) emailSubmit(); //update 용
                    viewMsg("email","사용할 수 있는 이메일입니다.","success");
                    emailFlag = true;
                break;
                case 'DUPLICATE':
                    viewMsg("email","이미 사용중인 이메일입니다.","error");
                break;
                case 'ERROR':
                    viewMsg("email","오류입니다. 다시 시도해 주세요.","error");
                break;
            }
        }
    });
}

function chkPasswdOld()
{
    opwFlag = false;
    var oldPassword1 = $("#tx_passwd_old").val();
    if( !oldPassword1 )
    {
        viewMsg("opw","현재 비밀번호를 입력해주세요.","error");
        return ;
    }
    $.ajax({
        type: "POST",
        url: "/user/ajax.html",
        data: {q_mode:"checkPassword",id:oldPassword1},
        success: function(result) {
            switch(result)
            {
                case 'OK' :
                    viewMsg("opw","확인되었습니다.","success");
                    opwFlag = true;
                break;
                case 'WRONG' :
                    viewMsg("opw","비밀번호가 일치하지 않습니다.","error");
                break;
                case 'ERROR':
                    viewMsg("opw","오류입니다. 다시 시도해 주세요.","error");
                break;
            }
        }
    });
}

function doChangePassword()
{
    if(!opwFlag)
    {
        chkPasswdOld();
        return ;
    }
    if(!pwFlag)
    {
        chkPasswd1();
        return ;
    }
    
    $.ajax({
        type: "POST",
        url: "user_modify_info.do",
        data: {q_mode:"checkPassword",id:newPassword1},
        success: function(result) {
            switch(result)
            {
                case 'OK' :
                    viewPWMsg("현재 비밀번호와 같은 비밀번호입니다.","error");
                    return ;
                break;
                case 'WRONG' :
                break;
                case 'ERROR':
                    viewPWMsg("오류입니다. 다시 시도해 주세요.","error");
                    return ;
                break;
            }
        }
    });
    if(!chkPasswd2())
    {
        return ;
    }

    var newPassword1 = $("#tx_passwd").val();
    $.ajax({
        type: "POST",
        url: "user_modify_info.do",
        data: {q_mode:"updateUser",item:"password",id:newPassword1},
        success: function(result) {
            if(result == 'SUCCESS')
            {
                $("#pwResult").addClass("text-success");
                $("#pwResult").html("비밀번호가 변경되었습니다.");
                $("#updPw").hide();
            }
            else
            {
                $("#pwResult").addClass("text-danger");
                $("#pwResult").html("비밀번호 변경을 실패했습니다. 다시 시도해 주세요.");
            }
        }
    });
}

function nickSubmit(){
    var nick = $("#nm_user").val();
    $.ajax({
        type: "POST",
        url: "user_modify_info.do",
        data: {q_mode:"updateUser",item:"nick",id:nick},
        success: function(result) {
            if(result == 'SUCCESS')
            {
                $("#cur_nick").html('<strong>'+nick+'</strong>');
                $("#cur_nick").addClass('text-success');
                $('#updNick').hide();
            }
            else if(result == 'LIMITED')
            {
                viewMsg("nick","닉네임은 24시간내 재변경할 수 없습니다.","error");
            }
            else if(result == 'DUPLICATE')
            {
                viewMsg("nick","사용중인 닉네임입니다. 다시 확인해 주세요.","error");
            }
            else
            {
                viewMsg("nick","닉네임 변경을 실패했습니다. 다시 시도해 주세요.","error");
            }
        }
    });
}

function emailSubmit()
{
    var email = $("#id_email").val();
    $.ajax({
        type: "POST",
        url: "user_modify_info.do",
        data: {q_mode:"sendConfirmUpdateEmail",email:btoa(unescape(encodeURIComponent(email)))},
        success: function(result) {
            if(result == 'SUCCESS')
            {
                $("#updEmail").addClass("text-success");
                $("#updEmail").html('<p class="text-center">'+email+'로 확인 메일이 발송되었습니다.</p>');
            }
            else if(result == 'DUPLICATE')
            {
                viewMsg("email","사용중인 이메일입니다. 다시 확인해 주세요.","error");
            }
            else
            {
                viewMsg("email","확인 메일 발송을 실패했습니다. 다시 시도해 주세요.","error");
            }
        }
    });
}
 */
 

/* 입력 확인 스크립트 */
 
 //데이터가져오기
 var getData = function() {
   var id = "<%=login_id %>"; 
   //console.log(id);
    $.ajax({
           type:"POST",   
           data : {
            id : id  
           },
           url: "user_modify_data.do",
           success : function(json) {
              //console.log(json[0]["nickname"]);
              $('#u_email').append(json[0]["email"]);      
              $('#u_nick').append(json[0]["nickname"]);
              
           }
   });  
}

 /* 이메일 */
 var sendEmail = function(email, inNum){
    $.ajax({
       url: './email.do',
         type: 'post',
         data:{
            email: email,
            inNum : inNum
         },
         dataType: 'text',
         success: function(result){
            if(result === "o"){
               alert('메일을 전송했습니다');
            }else if(result === "x"){
            alert('실패');
            }
         },
         error : function(error) {
            console.log('[에러] : ' + error.status);
            console.log('[에러] : ' + error.responseText);
         }
    });
 }; 
 
 /* 인증번호 */
 var checkAuthNo = function(inNum) {
    var oMsg = $("#emailMsg");
    if($('#authNo').val() == inNum ){
       showCorrectMsg(oMsg,"인증되었습니다.");
       authFlag = true;
    }else{
       showErrorMsg(oMsg,"인증번호가 일치하지 않습니다.");
       return false;
    }
    return true;
 }
 
 //닉네임체크
 var checkName = function() {
      var name = $("#name").val();
       var nameMsg = $('#nameMsg');
       var isName = /^[가-힣a-zA-Z0-9]{3,9}$/gi;
       
       if(name == ''){
          showErrorMsg(nameMsg, "필수 입력 정보입니다.");
          return false;
       }
       
       if(!isName.test(name)) {
          showErrorMsg(nameMsg,"3~9자의 한글과 숫자, 영문 대 소문자를 사용하세요.");
          return false;
       }
       
       $.ajax({
          type:"POST",
          data : {
             name : name
          },
          url: "nameCheck.do",
          success : function(data) {
             if(data.flag == 1){
                showErrorMsg(nameMsg,"이미 사용중인 닉네임입니다.");
                return false;
             }else if(data.flag == 0){
                showCorrectMsg(nameMsg,"사용 가능한 닉네임입니다.");
                nameFlag = true;
             }
          }
       });
       return true;
   }
 
 /* 에러메세지 */
 function showErrorMsg(obj, msg) {
    obj.attr("class", "error_next_box");
    obj.html(msg);
    obj.show();
 }
 
 /* 성공메세지 */
 function showCorrectMsg(obj, msg) {
    obj.attr("class", "correct_next_box");
    obj.html(msg);
    obj.show();
 }
 
 /* 탈퇴 */
 var userDel = function() {
   
}

</script>
</head>
<body>
   <!-- Wrapper -->
   <div id="wrapper">

      <!-- 메인 -->
      <div id="main">
         <div class="inner">
            <!-- 상단 -->
            
            <header id="header">
            <!-- logo2 -->
            <!-- <div class="nav_etc">
            <a href="./main.do">
            <img src="./images/bg_wave.png">
            </a>
            </div> -->
                <div class="logo_wrap">
                  <p class="logo_p">
                     <a href="./main.do" class="logo"><img
                        src="./images/logo/modoo_logo07.svg" alt="logo" /></a>
                  </p>
               </div> 

               
            </header>
            <!-- 상단 끝 -->
            
            <!-- 회원정보 수정 -->
            
            <section style="overflow: hidden;">
            
               <div id="contents_area">
                  <!--지우지 마세요  정보수정 콘텐츠 -->
                  <!-- <h2>회원정보 수정</h2> -->
                  <h2>회원정보 수정</h2>

                  <div class="panel-body etc_wrap">
                  <%-- <%=modify %> --%>
                     <!-- 메일수정 -->
                      <p style="margin: 15px 0; line-height: 34px;">
                        <strong id="u_email"></strong>
                        <button id="btnUpdEmail" type="button" onclick="$('#updEmail').show()" class="btn btn-default" style="float: right;">이메일 수정</button>
                     </p>
                     <div id="updEmail" style="display: none; margin-top: 20px;">
                        <div id="emailFrms" class="form-group has-feedback">
                           <input type="text" name="frm[pro_id_email]"class="form-control" id="id_email" placeholder="이메일">                           
                           <span id="emailStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span> <span id="emailMsg"style="display: none;"></span>
                        </div>
                        <div id="authNoDiv">
                           <input type="tel" id="authNo" name="authNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="wa_verify" class="int" disabled="" maxlength="4">
                           <button id="btnSend" type="button" class="btn " style="width: 120px; height: 40px;">인증번호받기</button>
                        </div>
                        <span class="error_next_box" id="emailMsg" style="display: none" aria-live="assertive"></span>
                        <p style="text-align: center">
                           
                           <button id="btnEmail" type="button" class="btn " style="width: 150px">변경</button>
                        </p>
                        <p class="help-block">
                           변경 신청하시면 확인메일이 새로운 메일주소로 발송됩니다.<br>메일이 도착하지 않는다면 스팸편지함도
                           확인해 주세요.
                        </p>
                     </div> 
                     
                     <!-- 메일수정 -->
                     
                     
                     <!-- 닉네임 수정 -->
                     
                  <div class="etc_line"></div>
                     <p style="margin: 15px 0; line-height: 34px;">
                        <span id="cur_nick"><strong id="u_nick"></strong>
                           <button type="button" onclick="$('#updNick').show()" class="btn btn-default" style="float: right;">닉네임 수정</button>
                        </span>
                     </p>
                     <div id="updNick" style="display: none; margin-top: 20px;">
                        <div id="nickFrms" class="form-group has-feedback">
                           <input type="text" name="frm[pro_nm_user]" class="form-control" id="name" placeholder="닉네임"> <span id="nickStatus" class="glyphicon form-control-feedback" aria-hidden="true"></span>
                           
                        </div>
                        <span class="error_next_box" id="nameMsg" style="display: none; text-align: center;" aria-live="assertive" ></span>
                        <p style="text-align: center">
                           <button type="button" id="mbtn" class="btn" style="width: 150px">변경</button>
                        </p>
                       <!--  <p class="help-block">
                           닉네임은 변경후 24시간동안 다시 변경할 수 없습니다.<br>변경전에 잘 확인해 주세요.
                        </p> -->
                     </div>
                     
                     <!-- 닉네임 수정-->
                     <!--회원탈퇴 -->
                     
                      <div class="etc_line"></div>
                     <p style="margin: 15px 0; line-height: 34px;">
                        회원탈퇴
                        <button type="button" id="userDel" class="btn btn-default" style="float: right;">탈퇴하기</button>
                     </p>
                     <!-- 회원탈퇴 -->
                     
                                          
                  </div>
                  
                  <br/><br/><br/>
                  <!--지우지마세요 정보수정 콘텐츠 끝 -->
                  
               </div>

               <!-- 회원 정보 -->
               


            </section>
            <!-- 회원정보 수정 -->
      
            
            <!-- 푸터 -->
            <footer id="footer"><p class="copyright">&copy; Copyright 모두의 레시피. All Rights Reserved  </p>
            <p class="copyright">개발자 : 이유준 , 송지연, 김현경, 금경호</p></footer>
            <!-- 푸터 끝 -->
         </div>
      </div>


      <!-- 지우지 마세요 -->
      <div class="wrap_default">
         <a href="#none" id="on_top" style="display: none"> <img
            src="http://skin-skin110.jyeon89.cafe24.com/web/upload/category/editor/2020/03/26/ed3c9f3ebbcebd49e47031acad6287a9.png"
            alt="맨 위로" /></a>
      </div>
      <!-- 지우지 마세요 -->

      <!-- 사이드바/푸터 -->
      <%-- <div id="sidebar">
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
         <nav id="menu" style="border-bottom:0;">
      
            <header class="major">
               <h2>카테고리</h2>
            </header>
            <ul>
               <li><a href="./main.do">홈</a></li>
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
               <ul class="modoo_thumbnail">
                  <li class="md_thum"><a href="#"><img src="http://54.180.71.253:8080/FinalProject/picture/15/Thumb/15_thumb_1.jpg"/></a></li>
                  <li class="md_thum"><a href="#"><img src="http://54.180.71.253:8080/FinalProject/picture/15/Thumb/15_thumb_1.jpg"/></a></li>
                  <li class="md_thum"><a href="#"><img src="http://54.180.71.253:8080/FinalProject/picture/15/Thumb/15_thumb_1.jpg"/></a></li>
                  <li class="md_thum"><a href="#"><img src="http://54.180.71.253:8080/FinalProject/picture/15/Thumb/15_thumb_1.jpg"/></a></li>
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
            <ul id="rankingList" class="recipestore" style="height:160px;">
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
         <footer><p class="copyright">&copy; Copyright 모두의 레시피. All Rights Reserved</p></footer>
         <!-- 푸터 끝 -->
      </div>
   </div>  --%>
      <!-- 사이드바 -->

   </div>

   <!-- script -->
   

</body>
</html>