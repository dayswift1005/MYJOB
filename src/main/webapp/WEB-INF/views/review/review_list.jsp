<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/review/js/review_list.js?ver=4"></script>
<style type="text/css">

.regCourseDiv{
	margin:0 auto;
	margin-top:50px;
}
.regCourseImg{
	width:100%;
	height:185px;
	margin:0 auto;
	cursor: pointer;
}

.reviewTitle{
	border-bottom: 3px solid #eeeeee;
	padding: 20px;
	margin: 0 auto;
	font-size: 30px;
}

.reviewMargin{
	margin: 0 auto;	
	margin-top:80px;
	padding: 0px;
	
}
.selectOrderBy{
	margin:0 auto;
	height:100px;
	text-align:right;
}
.selectOrderBy > span{
	font-size: 17px;
	display:inline-block;
	margin-top:10px;
	
}
.reviewTableDiv{
	width:100%;
	margin-left: 18px;
	border-bottom: 3px solid #eeeeee;
	margin-bottom: 20px;
}
.totalCnt{
 	text-align: left;
	margin-left: 15px;
	margin-top: 40px;
}

.reviewTableDiv > tbody > tr > td:last-child {
	width:70%;
}

.reviewTableDiv > tbody > tr:last-child{
	margin-bottom: 15px;
}

.selectOrderBy > span{
	margin-right: 8px;
}

.paddingTitle{
	font-size: 24px;
	vertical-align: top;
	padding: 20px;
}
.paddingTitle:hover{
	color: black;
}

.paddingReg{
	padding: 12px;
	padding-left: 18px;
	color: #707070;
}
.searchContainer{
	height:40px;
	margin:0 auto;
	margin-top:40px;
}
.reviewlist{
	margin-bottom: 10px;
}
.pagingDiv{
	margin: 0 auto;
	letter-spacing: 5px;
	text-align: center;
	font-size: 19px;
	font-weight: bold;
}
.pagingDiv a{
	display: inline-block;
    width: 30px;
    height: 30px;
    border: 1px solid #ccc;
    font-size: 14px;
    line-height: 30px;
    text-align: center;
    font-family: NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Tahoma,Sans-serif;
}
.selectPage{
    border: 1px solid #13294b;
    background-color: #13294b;
    color: #ffffff;
}
.searchBtn{											
width:70%;
height:100%;
border: 3px solid #1F50B5;
border-radius: 5px;
color: #fff;
background:#1F50B5;
text-transform: uppercase;
font-size: 1em;
line-height: 1.7em;
font-weight: bold;
letter-spacing: .1em;
font-family: "Roboto Condensed", sans-serif;
cursor: pointer;
text-align:center;
}

</style>
</head>
<body>
	<div class="col-12 bodyContainer">
		<div class="col-7 regCourseDiv">
			<div class="col-12 regCourseImg">
				<img src="/resources/images/파리지앵 컬렉션 엣시 배너 3333.png" class="regCourseImg" onclick="noticeCod('${sessionScope.loginInfo.memberId }', '${courseList.size() }', '${reviewVO.courseCode}')">
			</div>
		</div>

		<div class="col-7 reviewMargin">
			<div class="col-12 reviewTitle">후기 게시판</div>
			<!-- 추천수 인기순 -->
			<div class="col-12 selectOrderBy">
			<span>
				<a href="/review/selectReviewList">최신순</a> |
				<a href="/review/selectReviewList?orderByReadCnt='Y'">인기순</a>
			</span>
			<div class="col-12 totalCnt">
				<strong>총<span style="color: #0a97cd; text-align:left;">${reviewList.size()}</span>건</strong>
			</div>
			
			</div>
			<div class="col-12">
				<div class="reviewlist">
					<c:forEach items="${reviewList }" var="reviewVO">
						<table class="reviewTableDiv">
							<colgroup>
								<col width=25%>
								<col width=30%>
								<col width=*>
							</colgroup>
						<tbody>
							<tr class="ttl">
								<td rowspan="2">
									<a href="/review/detailReview?reviewBoardCode=${reviewVO.reviewBoardCode }&memberId=${sessionScope.loginInfo.memberId}&courseCode=${reviewVO.courseCode}">
										<img src="/resources/images/${reviewVO.reviewImgList[0].reviewImgAttachedName }" width="250" height="250">
									</a>
								</td>
								<td colspan="2" class="paddingTitle">
									<a href="/review/detailReview?reviewBoardCode=${reviewVO.reviewBoardCode }&memberId=${sessionScope.loginInfo.memberId}&courseCode=${reviewVO.courseCode}">
										${reviewVO.reviewBoardTitle }
									</a>
								</td>
							</tr>
							<tr>
								<td class="paddingReg">${reviewVO.reviewBoardRegDate }</td>
								<td class="paddingTag"></td>
							</tr>
						</tbody>
						</table>
					</c:forEach>
				</div>

					<div class="col-12 pagingDiv">
						<c:if test="${reviewVO.prev }">
							<a href="/review/selectReviewList?nowPage=${reviewVO.beginPage - 1 }">prev</a>
						</c:if>
						<c:forEach begin="${reviewVO.beginPage }" end="${reviewVO.endPage }" var="pageNumber">
							<a href="/review/selectReviewList?nowPage=${pageNumber }&searchKeyword=${reviewVO.searchKeyword}&searchValue=${reviewVO.searchValue}"
								<c:if test="${reviewVO.nowPage eq pageNumber }">class="selectPage"</c:if>>
								${pageNumber }
							</a>
						</c:forEach>
						<c:if test="${reviewVO.next }">
							<a href="/review/selectReviewList?nowPage=${reviewVO.endPage + 1 }">next</a>
						</c:if>
					</div>
				</div>
				
				<div class="col-6 searchContainer">
					<form class="row align-items-center" action="/review/selectReviewList" method="post">
						<div class="col-4">
							<select class="form-select"  name="searchKeyword">
								<option value="REVIEW_BOARD_TITLE"
									<c:if test="${reviewVO.searchKeyword eq 'REVIEW_BOARD_TITLE'}">selected</c:if>>제목</option>
								<option value="REVIEW_BOARD_WRITER"
									<c:if test="${reviewVO.searchKeyword eq 'REVIEW_BOARD_WRITER' }">selected</c:if>>작성자</option>
							</select>
						</div>
						<div class="col-5">
							<input type="text" name="searchValue" class="form-control" value="${reviewVO.searchValue }">
						</div>
						<div class="col-3">
							<button type="submit" class="searchBtn" id="">검&nbsp;색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>