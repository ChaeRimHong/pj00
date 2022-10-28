<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th{

width: 100px;
}

td{
width: 800px;
}
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
				<th style="vertical-align:middle; text-align:center;">글제목</th>
				<td>
					<input type="text" name="dtitle" style="border:0 solid black; width: 700px;" placeholder="선덕여왕은 얼마나 역사를 잘 고증했을까?">
				</td>
			</tr>
			<tr>
				<th style="vertical-align:middle; text-align:center;">작성일자</th>
				<td><input type="date" name="ddate"></td>
			</tr>
			<tr>
				<th style="vertical-align:middle; text-align:center;">영화제목</th>
				<td><input type="text" name="mtitle" style="border:0 solid black; width: 700px;" placeholder="선덕여왕(2009)"></td>
			</tr>
			<tr>
				<th style="vertical-align:middle; text-align:center;">비평란</th>
				<td><textarea name="dcontent" rows="10" cols="80" style="border:0 solid black; width: 700px;" placeholder="내용"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="등록"> 
					<input type="button" value="목록으로 가기" onClick="location.href='disc_notice'">
				</td>
			</tr>
			
			
</table>
</form>
</body>
</html>