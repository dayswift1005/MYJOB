<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'Bareun_hipi';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/naverfont_01@1.0/Bareun_hipi.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.userInterface{
	font-size: 15px;
}
span{
   cursor: pointer;
}
li{
	border:1px solid white;
	display:inline-block;
	width:250px;
}
ul{
	text-decoration: none;
}
.menuLayout{

	border:1px solid white;
	margin:0 auto;
	margin-top:40px;
	font-size:25px;
	font-weight:bold;
	font-family: 'Bareun_hipi'; 
	letter-spacing:1px;
	color:black;
	
}
a{
	color:#333333;
	text-decoration: none;
}
.mainTitle{
	border:1px solid white;
	color: navy; 
	text-decoration-line: none;
	font-family: 'Manse';
	font-size:70px;
}
.loginLayout{
	color: #828282; 
	text-decoration-line: none;
	font-size:17px;
	font-family: 'Bareun_hipi';
	font-weight:bold; 
}
</style>
</head>
<body>
<div class="row">
	<div class="col text-end userInterface">
		<c:choose>
			<c:when test="${not empty sessionScope.loginInfo }">
				<div>
					${sessionScope.loginInfo.memberName }님 반가워요~!
					<a href="/member/logout" style="color: black; text-decoration-line: none;">Logout</a>
					<div>&nbsp;</div>
					<c:choose>
						<c:when test="${sessionScope.loginInfo.memberIsAdmin eq 'N' }">
							<a href="/member/myPage?memberCode=${sessionScope.loginInfo.memberCode }" style="color: black; text-decoration-line: none;">마이페이지</a>
						</c:when>
						<c:otherwise>
							<a href="/admin/memberManage" style="color: black; text-decoration-line: none;">관리자페이지</a>
						</c:otherwise>
					</c:choose>
				</div>
			</c:when>
			<c:otherwise>
				<a href="/member/join" class="loginLayout">회 원 가 입</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="/member/login" class="loginLayout">로 그 인</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="row">
   <div class="col-12 text-center">
      <a href="/common/main" class="mainTitle">여행레시피</a>
   </div>
</div>
	<div class="row">
		<div class="col-12 text-center mb-3">
			<div class="col-12 menuLayout">
				<ul>
					<li><a href="/common/main">홈</a></li>
					<li><a href="/course/courseSearch">코스검색</a></li>
					<li><a href="/course/myCourseList?memberId=${sessionScope.loginInfo.memberId }">내코스보기</a></li>
					<li><a href="/review/selectReviewList?memberId=${sessionScope.loginInfo.memberId }">코스후기</a></li>
					<li><a href="/common/noticeBoard">공지사항</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>











