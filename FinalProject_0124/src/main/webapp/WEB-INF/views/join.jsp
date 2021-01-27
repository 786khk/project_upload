<%@page import="mailSender.MailSender"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./css/modoo/join.css" />
<title>모두의 레시피</title>
</head>
<body>
   <div id="wrapper">
      <div id="main">
         <div id="wrap">

            <!-- header -->
            <div id="header">
               <h1><a href="./main.do" class="sp r_logo" id="logo_mr"><span class="blind">모두의레시피</span></a></h1>
            </div>


            <!-- 회원가입 이용약관 동의 시작 -->

            <!-- container -->
            <div id="container" role="main">

               <!-- content -->
               <div id="content">
                  <!-- tg-text=title -->
                  <h2 class="blind">모두의레시피 회원가입</h2>
                  <div class="join_content">
                  
                     <!-- 아이디, 비밀번호 입력 -->
                     <div class="row_group">
                        <div class="join_row">
                           <h3 class="join_title">
                              <label for="id">아이디</label>
                           </h3>
                           <span class="ps_box int_id">
                              <input type="text" id="id" name="id" class="int" title="ID" maxlength="20">
                           </span> 
                           <span class="error_next_box" id="idMsg" style="display: none" aria-live="assertive"></span>
                        </div>

                        <div class="join_row">
                           <h3 class="join_title">
                              <label for="pswd1">비밀번호</label>
                           </h3>
                           <span class="ps_box int_pass" id="pswd1Img"> 
                              <input type="password" id="pswd1" name="pswd1" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                              <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
                           </span> 
                           <span class="error_next_box" id="pswd1Msg" style="display: none" aria-live="assertive">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>

                           <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                           <span class="ps_box int_pass_check" id="pswd2Img"> 
                              <input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20"> 
                              <span id="pswd2Blind" class="wa_blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
                           </span> 
                           <span class="error_next_box" id="pswd2Msg" style="display: none" aria-live="assertive"></span>
                        </div>
                        
                     </div>
                     <!-- // 아이디, 비밀번호 입력 -->

                     <!-- 닉네임 입력 -->
                     <div class="row_group">

                        <!-- lang = ko_KR -->
                        <div class="join_row">
                           <h3 class="join_title">
                              <label for="name">닉네임</label>
                           </h3>
                           <span class="ps_box box_right_space"> 
                              <input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
                           </span> 
                           <span class="error_next_box" id="nameMsg" style="display: none" aria-live="assertive"></span>
                        </div>
                        <!-- lang = ko_KR -->


                        <!-- 성별, 이메일 -->
                        <div class="join_row join_sex">
                           <h3 class="join_title"><label for="gender">성별</label></h3>
                           <div class="ps_box gender_code">
                              <select id="gender" name="gender" class="sel" aria-label="성별">
                                 <option value="" selected="">성별</option>
                                 <option value="M">남자</option>
                                 <option value="F">여자</option>
                              </select>
                           </div>
                        </div>
                        <span class="error_next_box" id="genderMsg" style="display: none" aria-live="assertive"></span>

                  <div class="join_row join_email">
                        <h3 class="join_title"><label for="email">본인 확인 이메일</label></h3>
   
                       <div class="int_email_area">                                             
                        <span class="ps_box int_email box_right_space"> 
                           <input type="text" id="email" name="email" placeholder="modoo@modoo.ml" aria-label="선택입력" class="int" maxlength="100">
                        </span>
                           <button id="btnSend" class="btn_verify btn_primary">인증번호받기</button>                        
                       </div>
  
                       <div class="ps_box_disable box_right_space" id="authNoBox">
                          <input type="tel" id="authNo" name="authNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="wa_verify" class="int" disabled="" maxlength="4"> 
                           <label id="wa_verify" for="authNo" class="lbl">
                              <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                              <span class="input_code" id="authNoCode" style="display: none;"></span>
                         </label>
                       </div>
                  </div>
                  <span class="error_next_box" id="emailMsg" style="display: none" aria-live="assertive"></span>
                     </div>
                     <!-- 성별, 이메일 -->


                     <!-- 휴대전화 번호 -->
                     <div class="join_row join_mobile" id="mobDiv">
                        <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                  <div class="int_mobile_area">
                           <span class="ps_box int_mobile"> 
                              <input type="tel" id="phone" name="phoneNo" placeholder="숫자만 입력" aria-label="전화번호 입력" class="int" maxlength="16"> 
                              <label for="phoneNo" class="lbl"></label>
                           </span>
                        </div>
                        <span class="error_next_box" id="phoneMsg" style="display: none" aria-live="assertive"></span>
                     </div>
                     <!-- // 휴대전화 번호, 인증번호 입력 -->

               <!-- 회원가입 버튼 -->
                     <div class="btn_area">
                        <button type="button" id="btnJoin" class="btn_type btn_primary">
                           <span>가입하기</span>
                        </button>
                     </div>
                     <!-- 회원가입 버튼 -->
                     
                  </div>
               </div>
               <!-- //content -->
            </div>
            <!-- //container -->
            <!-- 회원가입 이용약관 동의 끝 -->


            <!-- footer -->
            <div id="footer">
               <ul>
                  <li><a target="_blank" href="" id="fot.agreement">이용약관</a></li>
                  <li><strong><a target="_blank" href=""
                        id="fot.privacy">개인정보처리방침</a></strong></li>
                  <li><a target="_blank" href="" id="fot.disclaimer">책임의
                        한계와 법적고지</a></li>
                  <li><a target="_blank" href="" id="fot.help">회원정보 고객센터</a></li>
               </ul>
               <address>
                  <em class="copy">Copyright</em> <em class="u_cri">©</em> <a
                     target="_blank" href="./main.do" class="u_cra"
                     id="fot.모두의레시피corp">모두의 레시피</a> <span class="all_r">All
                     Rights Reserved.</span>
               </address>
            </div>
            <!-- //footer -->
         </div>
         <!-- 로그인 끝 -->


      </div>
   </div>

</body>

<script src="./js/jquery.min.js"></script>
<script src="./js/skel.min.js"></script>
<script src="./js/util.js"></script>
<script src="./js/main.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script type="text/JavaScript">

var idFlag = false;
var pw1Flag = false;
var pw2Flag = false;
var authFlag = false;
var nameFlag = false;
var phoneFlag = false;
var inNum = '';
$(document).ready(function() {
   
   $('#btnSend').on('click', function() {
      
      var oMsg = $("#emailMsg");
      var oInput = $("#email");
      
      if($('#email').val() == ''){
         alert('메일을 입력해주세요');
         return false;
      }else{
         var email = $('#email').val();
         inNum = parseInt(Math.random() * 10000);
         //console.log(inNum);
         //console.log(email);
         
         sendEmail(email, inNum);
         
         $('#email').focus();
         $('#authNo').removeAttr('disabled');
         
         oMsg = $("#emailMsg");
         oInput = $("#email");
         
         if (email != "") {
            showErrorMsg(oMsg,"인증번호를 입력해주세요.<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.");
            return false;
         }
      }
   });
   
   checkPhoneNo();
   
   /* 인증번호 */
   $("#authNo").blur(function() {
      //authFlag = false;
      checkAuthNo(inNum, authFlag);
   });
   
   /*아이디  */
   $("#id").blur(function() {
      //idFlag = false;
      checkId(idFlag);
   });
   
   /* 비번1 */
   $('#pswd1').blur(function() {
      //pw1Flag = false;
      checkPswd1(pw1Flag);
   });   
            
   /* 비번2 */
   $('#pswd2').blur(function() {  
      //pw2Flag = false;
      checkPswd2(pw2Flag);       
   });
               
   /* 닉네임 */
   $("#name").blur(function() {
         //nameFlag = false;
         checkName(nameFlag);
   });
               
   /* 휴대전화 */
   $("#phone").blur(function() {
    //phoneFlag = false;
      checkPhone(phoneFlag);  
   });
   
   /* 가입 */
   $("#btnJoin").button().on('click', function() {
      var id = $('#id').val();
      var idMsg = $('#idMsg').val();
      
      var pw1 = $('#pswd1').val();
      var pswd1Msg = $('#pswd1Msg').val();
      
      var pw2 = $('#pswd2').val();
      var pswd2Msg = $('#pswd2Msg').val();
      
      var nickname = $('#name').val();
      var nameMsg = $('#nameMsg').val();
      
      var email = $('#email').val();                    
      var emailMsg = $('#emailMsg').val();
      
      var gender = $('#gender').val();
      
      var authNo = $('#authNo').val();
      
      var phone = $('#phone').val();
      var phoneMsg = $('#phoneMsg').val();   
       
      if(id == ''){
         $('#id').focus();                       
         showErrorMsg($('#idMsg'), "필수 입력 정보입니다.");
      }else if(pw1 == ''){
         $('#pswd1').focus();                       
         showErrorMsg($('#pswd1Msg'), "필수 입력 정보입니다.");
      }else if(pw2 == ''){
         $('#pswd2').focus();                       
         showErrorMsg($('#pswd2Msg'), "필수 입력 정보입니다.");
      }else if(nickname == ''){
         $('#name').focus();                       
         showErrorMsg($('#nameMsg'), "필수 입력 정보입니다.");
      }else if(gender == ''){
         $('#gender').focus();
      }else if(email == ''){
         $('#email').focus();
      }else if(phone == ''){
         $('#phone').focus();                       
         showErrorMsg($('#phoneMsg'), "필수 입력 정보입니다.");
      }else if(authNo == ''){
         alert('이메일 확인 인증을 해야합니다.');
      }else{
         //console.log(idFlag);
         if(idFlag == false){
            $('#id').focus();
         }else if(pw1Flag == false){
               $('#pswd1').focus();
         }else if(pw2Flag == false){
               $('#pswd2').focus();
         }else if(nameFlag == false){
              $('#name').focus();
         }else if(phoneFlag == false){
               $('#phone').focus();
         }else if(authFlag == false){
               $('#authNo').focus();
         }else{
            
            $.ajax({
               url: 'join_ok.do',
               data:{
                  id : id,
                  password : pw1,
                  nickname : nickname,
                  email : email,
                  gender : gender,
                  phone : phone
               },
               type: 'get',
               dataType: 'json',
               success: function( json ) {
                  if(json.flag == 1){
                     alert('회원가입을 축하드립니다!');
                     location.href = './login.do';
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
}); 
   

/* 아이디 중복검사 */
var checkId = function() {
   var id = $("#id").val();
   var idMsg = $('#idMsg');
   var isID = /^[a-z0-9]{5,15}$/;
   
   if(id == ''){
      showErrorMsg(idMsg, "필수 입력 정보입니다.");
      return false;
   }
   
   if(!isID.test(id)) {
      showErrorMsg(idMsg,"5~16자의 영문 소문자, 숫자만 사용 가능합니다.");
      return false;
   }
   
   $.ajax({
      type:"POST",
      data : {
         id : id
      },
      url: "idCheck.do",
      success : function(data) {
         if(data.flag == 1){
            showErrorMsg(idMsg,"이미 사용중인 아이디입니다.");
            return false;
         }else if(data.flag == 0){
            showCorrectMsg(idMsg,"사용 가능한 아이디입니다.");
            idFlag = true;
         }
      }
   });
   return true;
}


/* 비번1 체크 */
var checkPswd1 = function() {
   
   var pw1 = $("#pswd1").val();
   var pswd1Msg = $('#pswd1Msg');
    //var isPW11 = /^[A-Za-z0-9]{8,15}$/;
    //var isPW12 = /^[~!@#$%^&*()_+|<>?:]{8,15}$/;
    var pattern1 = /[0-9]/;
    var pattern2 = /[a-z]/;
    var pattern3 = /[A-Z]/;
    var pattern4 = /[~!@#$%^&*()_+|<>?:{}]/;
    
    if(pw1 == ''){
       showErrorMsg(pswd1Msg, "필수 입력 정보입니다.");
       return false;
    }
    
    if(pw1.length < 8 || pw1.length > 16) {
       showErrorMsg(pswd1Msg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
       return false;
    }else if(pattern1.test(pw1) == false){
       showErrorMsg(pswd1Msg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
       return false;
    }else if(pattern2.test(pw1) == false){
       showErrorMsg(pswd1Msg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
       return false;
    }else if(pattern3.test(pw1) == false){
       showErrorMsg(pswd1Msg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
       return false;
    }else if(pattern4.test(pw1) == false){
       showErrorMsg(pswd1Msg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
       return false;
    }else{
       showCorrectMsg(pswd1Msg,"사용 가능한 비밀번호입니다.");
       pw1Flag = true;
    }
    return true;
}

/* 비번2 체크 */
var checkPswd2 = function() {
   
   var pw1 = $("#pswd1").val();
   var pw2 = $("#pswd2").val();
    var pswd2Msg = $('#pswd2Msg');
                     
    if(pw2 == ''){
       showErrorMsg(pswd2Msg, "필수 입력 정보입니다.");
       return false;
    }
    
    if(pw1 != pw2){
       showErrorMsg(pswd2Msg, "비밀번호가 일치하지않습니다.");
       return false;
    }else{
       showCorrectMsg(pswd2Msg,"비밀번호가 일치합니다.");
       pw2Flag = true;
    }
    return true;
}

/*닉네임체크  */
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

/* 전화번호 */
var checkPhone = function() {
   
   var phone = $("#phone").val();
   var phoneMsg = $('#phoneMsg');
   var isPhone = /^[0-9]{11,11}$/gi;
   
   if(phone == ''){
      showErrorMsg(phoneMsg, "필수 입력 정보입니다.");
      return false;
   }
   
   if(!isPhone.test(phone)) {
      showErrorMsg(phoneMsg,"11자리 숫자만 사용 가능합니다.");
      return false;
   }else{
      showCorrectMsg(phoneMsg,"사용 가능합니다.");
      phoneFlag = true;
   }
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

function checkPhoneNo() {
   var email = $("#email").val();
    var oMsg = $("#emailMsg");
    var oInput = $("#email");
    
    if (email == "") {
       showErrorMsg(oMsg,"(필수)인증받은 후 인증번호를 입력해야 합니다.");
       return false;
    }
    hideMsg(oMsg);
    return true;
}
</script>
</html>