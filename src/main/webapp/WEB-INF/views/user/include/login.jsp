<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.error{color: red;}
</style>
<div id="login">
	<div id="section">
	    <div class="loginHeader">
	        <div id="headerArea">
	            <img src="images/common/login_logo.jpg">
	        </div>
	    </div>
	    <div class="cont">
	    <form name="f" method="post" action="login">
	        <div class="loginForm">
	            <div>
	                <div class="login_input">
	                    <div class="login_insert">
	                        <input type="text" name="userId" id="id" class="id" placeholder="아이디" value="${loginUserInfo.userId }">
	                        <span id="idMsg" class="error"></span>
	                        <input type="password" name="userPw" id="passwd" class="passwd" placeholder="비밀번호">
	                        <span id="passwdMsg" class="error"></span>
	                        <span id="errorMsg" class="error">${message}</span>
	                        <div class="save">
	                            <div class="login_info">
	                                <a href="${pageContext.request.contextPath }/findId" class="lnk">아이디 찾기</a>
	                                <span class="bar">|</span>
	                                <a href="${pageContext.request.contextPath }/findPw">비밀번호 찾기</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            <div class="wrap_btn">
	                <button type="submit" class="login_btn" onclick="userLogin();">로그인</button>
	            </div>
	        </div>
	    </form>
	    </div>
	</div>
<script language="JavaScript">
function userLogin() {
	$(".error").text("");
	
	if ( f.id.value == "" ) {
		$("#idMsg").text("아이디를 입력해 주세요.");
		$("#id").focus();
		f.id.focus();
		return false;
	} 
	if ( f.passwd.value == "" ) {
		$("#passwdMsg").text("비밀번호를 입력해 주세요.");
		$("#passwd").focus();
		f.passwd.focus();
		return false;
	}	
	
	//f.action = "${pageContext.request.contextPath }/login";
	f.submit();
}
</script>
</div>
