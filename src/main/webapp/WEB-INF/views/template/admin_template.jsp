<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
<!-- 태그 초기화 작업 -->
<link rel="stylesheet" href="/resources/common/css/reset.css">

<!-- 제이쿼리 문법을 로딩... -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 사용을 위해 css, js를 로딩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@font-face {
    font-family: 'Manse';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Manse.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body {
  line-height: 1;
  font-family: 'EliceDigitalBaeum_Bold'; 
  font-size: 18px;
}
.col-2{
	padding: 0px;
	background-color: #ffffff;
}
.col-10{
	padding: 0px;
}
</style>
</head>
<body>
<div>
	<div class="row">
		<div class="col">
			<tiles:insertAttribute name="menu"/>
		</div>
	</div>
	<div class="row" style="padding-top: 10px;">
		<div class="col-2">
			<tiles:insertAttribute name="side"/>
		</div>
		<div class="col-10">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
</div>
</body>
</html>


















