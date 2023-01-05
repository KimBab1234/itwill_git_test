<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script>
$(function() {
	$('.recent-three').fadeIn(300);
});

$('.recentUp').click(function () {
    $('.recentList').animate({scrollTop: 0}, 500, 'easeInOutExpo');
    return false;
});
</script>
<style>
.recentList::-webkit-scrollbar { 
  width: 0 !important;
  display: none; 
}
</style>
<div class="recent-three" style="display: none; left: 30px; bottom: 30px; position: fixed; background: white; z-index: 1000;" align="center" id="recentDiv">
	<h6 style="font-family: 'Poppins', sans-serif;">최근본 상품목록</h6>
	<button style="width: 120px; background: #513e30; border: none;" id="recentUp"><i class="fas fa-solid fa-chevron-up" style="color: #c9b584;"></i></button><br>
	<div style="height:360px; overflow: scroll;" class="recentList">
	<c:forEach begin="1" end="${sessionScope.recentImgList.size()>3? 3:sessionScope.recentImgList.size()}" var="i">
		<a href="ProductDetail.go?product_idx=${sessionScope.recentIdxList.toArray()[sessionScope.recentIdxList.size()-i]}">
			<img src="${sessionScope.recentImgList.toArray()[sessionScope.recentImgList.size()-i]}" style="width: 120px; height: 120px; object-fit: cover;" >
		</a>
		<br>
	</c:forEach>
	</div>
	<button style="width: 120px; background: #513e30; border: none;" id="recentDown"><i class="fas fa-solid fa-chevron-down" style="color: #c9b584;"></i></button><br>
</div>
