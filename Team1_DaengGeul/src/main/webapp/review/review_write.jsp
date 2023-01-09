<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 게시판</title>
<!-- <link href="review/css/review_write.css" rel="stylesheet" type="text/css"> -->
<script src ="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
 	h2 { 
 		text-align: left; 
 	} 
	
 	table { 
 		align:left; 
 		width: 600px; 
 		height: 300px;
 		border-color: #b09f76;
 		color:  #575754;
 	} 
	/* 리뷰 설명란 */
 	.d1 { 
	 	text-align:left; 
	 	background-color: #fff5e6; 
	 	color:  #575754;
	 	width: 600px; 
	 	border-radius: 20px;
 	} 
	/* 테이블 왼쪽 */
 	.td_left { 
 		width: 200px; 
 		background: #c9b584; 
 		text-align: center; 
 		font-weight: bold;
 	} 
	/* 테이블 오른쪽 */
 	.td_right { 
 		width: 400px; 
 	} 
	/* 테이블 입력란 */
 	.r1 { 
 		width: 400px; 
 	} 
	/* 등록버튼 */
	#s1 {
		background-color: #513e30;
		width: 100px;
		height: 50px;
		color: #fae37d;
		border-radius: 20px;
		border-color: transparent;
		font-weight: bold; 
		font-size: 20px;
	}
	/* 초기화버튼 */
	#s2 {
		background-color: #b38600;
		width: 100px;
		height: 50px;
		color: #fae37d;
		border-radius: 20px;
		border-color: transparent;
		font-weight: bold; 
		font-size: 20px;
	}
	/* 취소버튼 */
	#s3 {
		background-color: #fff5e6;
		width: 100px;
		height: 50px;
		color: #575754;
		border-radius: 20px;
		border-color: transparent;
		font-weight: bold; 
		font-size: 20px;
		
	}
	/* 별점 */
	#myform fieldset{
	    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	    direction: rtl; /* 이모지 순서 반전 */
	    border: 0; /* 필드셋 테두리 제거 */
	}
	#myform input[type=radio]{
	    display: none; /* 라디오박스 감춤 */
	}
	#myform fieldset label{
	    font-size: 2em; /* 이모지 크기 */
	    color: transparent; /* 기존 이모지 컬러 제거 */
	    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
	}
	#myform fieldset label:hover{
		color: transparent; /* 기존 이모지 컬러 제거 */
	    text-shadow: 0 0 0 #ffcc00; /* 마우스 호버 */
	}
	#myform fieldset label:hover ~ label{
		color: transparent; /* 기존 이모지 컬러 제거 */
	    text-shadow: 0 0 0 #ffcc00; /* 마우스 호버 뒤에오는 이모지들 */
	}
	#myform fieldset input[type=radio]:checked ~ label{
		color: transparent; /* 기존 이모지 컬러 제거 */
	    text-shadow: 0 0 0 #ffcc00; /* 마우스 클릭 체크 */
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<jsp:include page="../inc/main.jsp"></jsp:include> <!-- 본문1 -->
	</header>
	<!-- 게시판 등록 -->
	<div align="center">
	<div style="width: 1000px; margin-top: 50px;">
	<section id="writeForm">
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="border-left: 10px solid #795548">&nbsp;&nbsp;리뷰 작성</b></h2>
		<br>
		<div class="d1">
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구입하신 상품의 리뷰에 대해 아래와 같이 댕글포인트가 지급됩니다.<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 저작권, 재고 등의 문제로 판매금지된 상품은 리워드 대상에서 제외 됩니다.<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1,000원 미만 상품은 리워드 대상에서 제외됩니다.<br>
			<br>
			<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;리뷰 : 그린 도토리 300원 / 브라운 도토리 500원 / 골드 도토리 700원</b><br>
			<br>
		</div>
		<br>
		
		<table>
			<tr>
				<td><img src="img/product/${review.product_img }" width="200"></td>
				<td><h4>${review.product_name }</h4></td>
			</tr>
		</table>
		<br>
		<form action="ReviewWritePro.re" name="reviewForm" id="myform" method="post" action="./save">
			<input type="hidden" name="member_id" value="${sessionScope.sId}">
			<input type="hidden" name="product_idx" value="${param.product_idx}">
			<input type="hidden" name="order_idx" value="${param.order_idx}">
			
			<table border="2" class="b1">
				<tr>
					<td class="td_left"><label for="review_subject"><b>제목</b></label></td>
					<td class="td_right"><input type="text" name="review_subject" required="required" class="r1"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_passwd"><b>비밀번호</b></label></td>
					<td class="td_right"><input type="password" name="review_passwd" required="required" class="r1"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="review_score"><b>별점</b></label></td>
					<td>
				    <fieldset name="review_score" class="score" >
				        <input type="radio" name="review_score" value="5" id="rate1"><label for="rate1">⭐</label>
				        <input type="radio" name="review_score" value="4" id="rate2"><label for="rate2">⭐</label>
				        <input type="radio" name="review_score" value="3" id="rate3"><label for="rate3">⭐</label>
				        <input type="radio" name="review_score" value="2" id="rate4"><label for="rate4">⭐</label>
				        <input type="radio" name="review_score" value="1" id="rate5"><label for="rate5">⭐</label>
				    </fieldset>
					</td> 
				</tr>
				<tr>
					<td class="td_left"><label for="review_content"><b>내용</b></label></td>
					<td class="td_right">
						<textarea id="review_content" class="r1" name="review_content" cols="40" rows="10" required="required"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<section id="commandCell">
				<input type="submit" value="등록" id="s1">&nbsp;&nbsp;
				<input type="reset" value="초기화" id="s2">&nbsp;&nbsp;
				<input type="button" value="취소" id="s3" onclick="history.back()">
			</section>
		</form>
	</section>
	</div>
</div>
	
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
















