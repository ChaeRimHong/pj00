<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.table table-hover {
 	vertical-align: middle;
	border-collapse: separate;
	border-left: 3px solid #FFEFD5;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: none;
	border-bottom: none;
	margin: 20px 10px;
}

table.table table-hover th {
	text-align: center;
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	border-top: none;
	border-bottom: none;
	height: 50px;
}

table.table table-hover td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	border-top: none;
	border-bottom: none;
}
</style>
</head>
<body>
<form action="mypage_update" method="post">
<c:choose>
	<c:when test="${logindo==true}">	
	<h2>나의 정보</h2>
	<table class="table table-hover" align="center"
		style="border-collapse: separate; border-left: 3px solid #FFEFD5; border-spacing: 1px; text-align: left; line-height: 1.5; border-top: none; border-bottom: none; margin: 20px 10px;">
		<c:forEach items="${list }" var="my_info">
		<tr>
			<th scope="row"
				style="text-align: center; width: 60px; padding: 10px; font-weight: bold; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none; height: 50px; width: 50px;">
				아이디
			</th>
			<td
				style="width: 350px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none;">&emsp;&emsp;
				<input type="text" id="id" value="${my_info.id}" readonly="readonly" style="border:0 solid black;">
			</td>
		</tr>
		
		<tr>
			<th scope="row"
				style="text-align: center; width: 60px; padding: 10px; font-weight: bold; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none; height: 50px;">
				비밀번호
			</th>
			<td
				style="width: 350px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none;">&emsp;&emsp;
				<input type="password" id="pw" value="${my_info.pw}" style="border:0 solid black;">
			</td>
		</tr>
		
		<tr>
			<th scope="row"
				style="text-align: center; width: 60px; padding: 10px; font-weight: bold; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none; height: 50px;">
				이름
			</th>
			<td
				style="width: 350px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none;">&emsp;&emsp;
				<input type="text" id="name" value="${my_info.name}" style="border:0 solid black;">
			</td>
		</tr>
		
		<tr>
			<th scope="row"
				style="text-align: center; width: 60px; padding: 10px; font-weight: bold; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none; height: 50px;">
				이메일
			</th>
			<td
				style="width: 350px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none;">&emsp;&emsp;
				<input type="text" id="email" value="${my_info.email}" readonly="readonly" style="border:0 solid black;">
			</td>
		</tr>
		<!-- 
		<tr>
			<th scope="row"
				style="text-align: center; width: 100px; padding: 10px; font-weight: bold; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none; height: 50px;">
				주소
			</th>
			<td
				style="width: 350px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; border-top: none; border-bottom: none;">&emsp;&emsp;
				내용이 들어갑니다.
			</td>
		</tr>
		 -->
		</c:forEach>
	</table>
	</c:when>				
</c:choose>
<br><br>
<button class="btn btn-default" type="submit">정보 수정</button>
</form>
</body>
</html>