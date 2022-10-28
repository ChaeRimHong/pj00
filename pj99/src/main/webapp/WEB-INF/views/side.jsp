<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>

	<div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width: 200px;">
		
		<!-- 
		<a href="notice" class="w3-bar-item w3-button"><h4>공지사항</h4></a>
 		-->
 				
		<a href="go_mypage" class="w3-bar-item w3-button"><h4>MyPage</h4></a>						<!-- 마이페이지 -->
		
		<a href="record_notice" class="w3-bar-item w3-button"><h4>한줄평</h4></a>				<!-- 한줄평 -->
		<!-- <a href="recordinController" class="w3-bar-item w3-button"><h4>한줄평입력</h4></a> -->		<!-- 한줄평입력 -->

		<a href="disc_notice" class="w3-bar-item w3-button"><h4>비평광장</h4></a>				<!-- 비평광장 -->
	
	
	<!-- 
		<div class="w3-dropdown-hover">
			<button class="w3-button">
				<h4>무비투게더</h4><i class="fa fa-caret-down"></i>						
			</button>
			<div class="w3-dropdown-content w3-bar-block">
				<a href="search" class="w3-bar-item w3-button"><h5>검색</h5></a> 
				<a href="#"	class="w3-bar-item w3-button"><h5>비평 보기</h5></a>
			</div>
		</div>
	 -->
	</div>

	<script>
		function myAccFunc() {
			var x = document.getElementById("demoAcc");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
				x.previousElementSibling.className += " w3-green";
			} else {
				x.className = x.className.replace(" w3-show", "");
				x.previousElementSibling.className = x.previousElementSibling.className
						.replace(" w3-green", "");
			}
		}

		function myDropFunc() {
			var x = document.getElementById("demoDrop");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
				x.previousElementSibling.className += " w3-green";
			} else {
				x.className = x.className.replace(" w3-show", "");
				x.previousElementSibling.className = x.previousElementSibling.className
						.replace(" w3-green", "");
			}
		}
	</script>

</body>
</html>
