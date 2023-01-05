<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script src ="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
$(function() {
	$('.recent-three').fadeIn(300);
});
</script>
<div class="recent-three" style=" display: none; left: 30px; bottom: 30px; position: fixed; background: white; z-index: 1000;" align="center">
	<h5 style="font-family: sans-serif;">최근본 상품목록</h5>
	<button style="width: 30px; background: #513e30; border: none;"><i class="fas fa-solid fa-chevron-up" style="color: #c9b584;"></i></button><br>
	<c:forEach begin="1" end="${sessionScope.recentImgList.size()>3? 3:sessionScope.recentImgList.size()}" var="i">
		<a href="ProductDetail.go?product_idx=${sessionScope.recentIdxList.toArray()[sessionScope.recentIdxList.size()-i]}">
			<img src="${sessionScope.recentImgList.toArray()[sessionScope.recentImgList.size()-i]}" style="width: 120px; height: 120px; object-fit: cover;" >
		</a>
		<br>
	</c:forEach>
	<button style="width: 30px; background: #513e30; border: none;"><i class="fas fa-solid fa-chevron-down" style="color: #c9b584;"></i></button><br>
</div>
