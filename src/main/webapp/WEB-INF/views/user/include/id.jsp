<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#error {text-align: center; margin:300px;}
.message {
	color: red;
	font-size: 1.5em;
	margin-bottom: 40px;
}
button {
    padding: 8px;
    text-align: center;
    line-height: 22px;
    font-size: 14px;
    background: #445da5;
    color: white;
    border: 1px;
    cursor: pointer;
}
</style>
<div id="error">
    <div>
        <p class="message">회원님의 아이디는 <%=request.getParameter("data") %>입니다.</p>
       	<button type="button" onclick="location.href='${pageContext.request.contextPath}/login';">로그인 페이지 이동</button>
       	<button type="button" onclick="location.href='${pageContext.request.contextPath}/main';">메인 페이지 이동</button>
    </div>
</div>
