<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="img/daram.png" rel="shortcut icon" type="image/x-icon">
<title>댕글댕글 : 회원관리</title>
<%------------------- 임시 홈페이지 CSS -------------------%>
<link href="css/memberList.css" rel="stylesheet" type="text/css">
<%---------------------------------------------------------%>
</head>
<body>
	<header>
		<!-- Login, Join 링크 표시 영역(inc/top.jsp 페이지 삽입) -->
		<jsp:include page="/inc/top.jsp"></jsp:include>
		<jsp:include page="/inc/main.jsp"></jsp:include>
	</header>
	
	<div class="clear"></div>
	
	<article>
		<!-------------------------- 회원목록 --------------------------->
		<h1 id="listName">회원목록</h1>
		<table border="1">
			<tr>
				<th width="150">아이디</th>
				<th width="150">이름</th>
				<th width="250">E-Mail</th>
				<th width="50">성별</th>
				<th width="100">우편번호</th>
				<th width="150">가입일</th>
				<th width="200"></th>
			</tr>
			<%-- List<Memberbean> 객체(memberList) 만큼 반복하면서 데이터 출력 --%>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td>${member.member_id }</td>
					<td>${member.member_name }</td>
					<td>${member.member_email }</td>
					<td>${member.member_gender }</td>
					<td>${member.member_postcode }</td>
					<td>${member.member_join_date }</td>
					<td>
						<input type="button" value="상세정보" onclick="location.href='MemberInfo.me?id=${member.member_id}'">
						<!-- 주문내역 서블릿 수정 필요! -->
						<input type="button" value="주문내역" onclick="location.href='MemberInfo.me?id=${member.member_id}'">
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-------------------------- 회원명 검색버튼 --------------------------->
		<section id="buttonArea">
			<form action="MemberList.me">
				<%-- 관리자만 검색 (관리자만 페이지 볼 수 있지만 JSTL 사용법 쫌 더 익숙해지길 바라며!!)--%>
				<c:if test="${!empty sessionScope.sId && sessionScope.sId eq 'admin'}">
					<input type="text" name="keyword" placeholder="회원명을 입력하세요">
					<input type="submit" value="검색">
				</c:if>
			</form>
		</section>
		
		<!-------------------------- 페이지 이동버튼 --------------------------->
		<section id="pageList">
			<!-- 이전 페이지 -->
			<c:choose>
				<c:when test="${pageNum > 1}">
					<input type="button" value="이전" onclick="location.href='MemberList.me?pageNum=${pageNum - 1}'">
				</c:when>
				<c:otherwise>
					<input type="button" value="이전">
				</c:otherwise>
			</c:choose>
				
			<!-- 페이지 번호 목록 -->
			<c:forEach var="i" begin="${memberPageInfo.startPage }" end="${memberPageInfo.endPage }">
				<c:choose>
					<c:when test="${pageNum eq i}">
						${i }
					</c:when>
					<c:otherwise>
						<a href="MemberList.me?pageNum=${i }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<!-- 다음 페이지 -->
			<c:choose>
				<c:when test="${pageNum < memberPageInfo.maxPage}">
					<input type="button" value="다음" onclick="location.href='MemberList.me?pageNum=${pageNum + 1}'">
				</c:when>
				<c:otherwise>
					<input type="button" value="다음">
				</c:otherwise>
			</c:choose>
		</section>
	</article>
	
	<div class="clear"></div>
	<div class="clear"></div>
	
	<!------------------------------------ 바닥글 --------------------------------------->
	<footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
	<!----------------------------------------------------------------------------------->
	
	<!------------------------------ top, left, bottom 동작 관련 작업 빼지말것! ------------------------------>
	<!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
	<!------------------------------ top, left, bottom 동작 관련 작업 빼지말것! ------------------------------>
</body>
</html>