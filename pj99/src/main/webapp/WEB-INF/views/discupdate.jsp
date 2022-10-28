<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="disc_update2" method="post">
		<table border="1" align="center">
			<caption>${dlist.dnum }의자료 수정</caption>
			<tr>
				<th>글번호</th>
				<td><input type="text" name="dnum" value="${dlist.dnum }"
					readonly></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="dtitle" value="${dlist.dtitle }"></td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td><input type="date" name="ddate" value="${dlist.ddate }"></td>
			</tr>
			<tr>
				<th>영화제목</th>
				<td><input type="text" name="mtitle" value="${dlist.mtitle }"></td>
			</tr>
			<tr>
				<th>비평란</th>
				<td><textarea name="dcontent" rows="10" cols="50"
						value="${dlist.mtitle }"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>