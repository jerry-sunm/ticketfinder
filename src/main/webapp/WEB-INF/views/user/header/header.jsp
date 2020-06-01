<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="nav_left">
	<h1>
		<a href="${pageContext.request.contextPath}/">
			<img src="${pageContext.request.contextPath}/images/common/logo2.png" alt="logo">
		</a>
	</h1>
</div>

<div class="nav_center">
	<ul>
		<li><a href="${pageContext.request.contextPath}/perform/concert">콘서트<span></span></a></li>
		<li><a href="${pageContext.request.contextPath}/perform/musical">뮤지컬<span></span></a></li>
		<li><a href="${pageContext.request.contextPath}/perform/play">연극<span></span></a></li>
		<li><a href="${pageContext.request.contextPath}/perform/classic">클래식<span></span></a></li>
		<li><a href="${pageContext.request.contextPath}/theater">공연장<span></span></a></li>
		<li><a href="${pageContext.request.contextPath}/rank">랭킹<span></span></a></li>
		<li><a href="${pageContext.request.contextPath}/region">지역<span></span></a></li>
	</ul>
</div>

<div class="nav_right">
	<ul>
		<c:choose>
			<c:when test="${empty(loginUserInfo) }"> <%-- 비로그인 회원일 경우 --%>
				<li>
					<a href="${pageContext.request.contextPath}/login">
						<i class="fas fa-sign-in-alt"></i>
						<span>로그인</span>
					</a>
				</li>
				
				<li>
			        <a href="${pageContext.request.contextPath}/join">
					<i class="fas fa-user-plus"></i>
						<span>회원가입</span>
					</a>
				</li>
			</c:when>
			<c:otherwise> <%-- 로그인 회원일 경우 --%>
				<li>
					<a href="${pageContext.request.contextPath}/logout">
						<i class="fas fa-sign-out-alt"></i>
						<span>로그아웃</span>
					</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${loginUserInfo.userState=='9'}"> <%-- 관리자 계정인 경우 --%>
			<li>
				<a href="${pageContext.request.contextPath}/login.admin">
					<i class="fas fa-user-cog"></i>
					<span>관리자</span>
				</a>
			</li>
		</c:if>
	
		<li>
			<a href="${pageContext.request.contextPath}/myticket">
				<i class="fas fa-ticket-alt"></i>
				<span>My티켓</span>
			</a>
		</li>
	
		<li>
	    	<a href="${pageContext.request.contextPath}/cs">
				<i class="fas fa-headset"></i>
				<span>고객센터</span>
	    	</a>
		</li>

		<li>
			<a href="#" class="searchBtn">
				<i class="fas fa-search"></i>
				<span>검색</span>
			</a>
			<div class="searchBox">
				<form action="${pageContext.request.contextPath}/search" method="post">
					<input type="text" name="search">
					<span class="noShowBtn"></span>
					<button type="submit" style="display: none;"></button>
				</form>
			</div>
		</li>
	</ul>
</div>