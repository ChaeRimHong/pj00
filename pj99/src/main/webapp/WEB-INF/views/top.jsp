<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="cdn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px;
	border-collapse: collapse;
	text-align: center;
}
select{
width: 100px; 
height: 30px; 
font-size: 16px;
}
</style>
</head>
<c:set var="result" value="${param.result}" />
<c:choose>
	<c:when test="${result=='loginfail'}">
		<script type="text/javascript">
			window.onload = function() {
				alert("로그인 확인 해주세요!!");
			}
		</script>
	</c:when>
</c:choose>

<!-- 로그인은 grid만들어서 위치 조정하기 -->
<header>
	<div class="row"
		style="padding-top: 30px; padding-left: 20px; position: fixed;">
		<div class="col-sm-4">
			<div class="container">
				<h1>
					Film <a href="index"><span class="glyphicon glyphicon-pencil"></span></a>
				</h1>
			</div>
		</div>
	</div>

	<div class="row" >
		<div class="col-sm-4" style="padding-top: 30px; margin: auto;"></div>




		<div class="col-sm-4" style="padding-top: 50px;">
			<nav class="navbar navbar-light bg-light">
				<div class="container-fluid">
					<div class="container">
						<!-- ===SEARCH=========================================== -->
						<form class="form-inline" action="search" method="post">
								<!-- sname -->
									<select name="sname">
										<option value="comment">한줄평</option>
										<option value="discussion">비평</option>
									</select>
								<!-- svalue -->
									<input type="text" name="svalue" style="width: 400px; height: 30px;">
									<button type="submit" class="btn btn-default" 
													style="width: 50px; height: 30px;" > 
										<span class="glyphicon glyphicon-search" align="center"></span>
									</button>
						</form>
						<!-- ===================================================== -->
					</div>
				</div>
			</nav>
		</div>

		<div class="col-sm-4"
			style="padding-top: 50px; text-align: right; padding-right: 50px">
			<c:choose>
				<c:when test="${logindo==true}">
					<a href=""><span>환영합니다!!${pj09_login.id }님</span></a>
					&emsp;
					<a href="logout">로그아웃 <span class="glyphicon glyphicon-log-out"></span></a>
				</c:when>
				<c:otherwise>
					<a href="logina">로그인 <span class="glyphicon glyphicon-log-in"></span></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</header>
<!--  -->

</body>
</html>
