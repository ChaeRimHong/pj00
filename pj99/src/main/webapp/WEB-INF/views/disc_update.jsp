<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
	width: 100px;
	background-color: #dddddd;
}

td {
	width: 800px;
}
</style>
</head>
<body>
<br><br><br><br>
	<form action="disc_update2" method="post" style="margin-bottom: 200px;">
		<table border="1" align="center"
				style="	text-align: center; 
						border-collapse: collapse;
						margin-left:auto; 
						margin-right:auto;">
			<c:forEach items="${list }" var="u">
				<tr height="50px;">
					<th style="vertical-align:middle; text-align:center;">글번호</th>
					<td><input type="text" name="dnum" value="${u.dnum }" style="border:0 solid black; width: 700px;" readonly></td>
				</tr>
				<tr height="50px;">
					<th style="vertical-align:middle; text-align:center;">글제목</th>
					<td><input type="text" name="dtitle" value="${u.dtitle }" style="border:0 solid black; width: 700px;"></td>
				</tr>
				<tr height="50px;">
					<th style="vertical-align:middle; text-align:center;">작성일자</th>
					<td><input type="date" name="ddate" value="${u.ddate }"></td>
				</tr>
				<tr height="50px;">
					<th style="vertical-align:middle; text-align:center;">영화제목</th>
					<td><input type="text" name="mtitle" value="${u.mtitle }" style="border:0 solid black; width: 700px;"></td>
				</tr>
				<tr height="400px;">
					<th style="vertical-align:middle; text-align:center;">비평란</th>
					<td><textarea name="dcontent" rows="15" cols="90" style="border:0 solid black; width: 700px;">${u.dcontent }</textarea></td>
				</tr>
			</c:forEach>
		</table>
		<br> 
		<input type="submit" value="수정"> 
		<input type="reset" value="취소">



	</form>
</body>
</html>