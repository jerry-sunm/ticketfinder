<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Finder</title>

<%-- jQuery 라이브러리 및 Fontawesome 라이브러리 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<%-- 공통 CSS 및 JS 파일 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/style.css"/>

<%-- 파비콘 link 태그 --%>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/common/favicon.ico" type="image/x-icon">

</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
	
	<a href="#" class="moveTopBtn">
		<img src="${pageContext.request.contextPath}/images/common/topBtn.png" alt="move top button">
	</a>
	
	<script src="${pageContext.request.contextPath}/common/common.js"></script>
</body>
</html>











