<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:if test="${regNoticeBoardResult }">
		<script type="text/javascript">
			alert('공지사항이 등록되었습니다.')
			location.href='/common/noticeBoard';
		</script>
	</c:if>
</head>
<body>

</body>
</html>