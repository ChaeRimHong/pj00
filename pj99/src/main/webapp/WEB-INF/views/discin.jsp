<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.type05 {
	align-content: center; border-collapse : separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
	border-collapse: separate;
}

table.type05 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #efefef;
}

table.type05 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
	
	<form action="disc_save" method="post">
		<table class="type05" border="1"
			style="text-align: center; border-collapse: collapse;margin-left:auto;margin-right:auto;">
				<h3 style="margin-left: auto; margin-right: auto;">비평 등록</h3>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="dtitle" ></td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td><input type="date" name="ddate"></td>
			</tr>
			<tr>
				<th>영화제목</th>
				<td><input type="text" name="mtitle"></td>
			</tr>
			<tr>
				<th>비평란</th>
				<td><textarea name="dcontent" rows="10" cols="50"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="등록"> 
					<input type="button" value="목록으로 가기" onClick="location.href='disc_list'">
				</td>
			</tr>
			
			
</table>
</form>
</body>
</html>