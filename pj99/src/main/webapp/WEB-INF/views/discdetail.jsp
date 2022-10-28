<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
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
<form method="post">
<h2>게시물 조회</h2>
<!-- ====================================================================== -->
<!-- =================================안쓰는거=============================== -->
<table class="type05" border="1" width="500" height="300" align="center"
style="text-align:center; border-collapse: collapse; margin-left: auto; margin-right: auto;">
<c:forEach items="${list }" var="de">

<tr>
	<th>글번호</th>
	<td><input type="hidden" name="dnum" value="${de.dnum }">${de.dnum }</td>
</tr>
<tr>
	<th>글제목</th>
	<td>${de.dtitle }</td>
</tr>
<tr>
	<th>작성일</th>
	<td>${de.ddate }</td>
</tr>
<tr>
	<th>영화제목</th>
	<td>${de.mtitle }</td>
</tr>
<tr>
	<th>비평란</th>
	<td>${de.dcontent }</td>
</tr>
<tr>
<td colspan="2">
<a href="disc_update1?dnum=${de.dnum }">수정</a>
<button type="button" onclick="location.href='#'">삭제</button>
</td></tr>
</c:forEach>
</table>
<!--댓글-->
<ul>
    <li>첫번째 댓글</li>
    <li>두번째 댓글</li>
    <li>세번째 댓글</li>
</ul>

<div>
    <p>
        <label>댓글 작성자</label> <input type="text" name="replyer">
    </p>
    <p>
        <textarea rows="5" cols="50"></textarea>
    </p>
    <p>
        <button type="button">댓글 작성</button>
    </p>
</div>
<!-- 댓글끝 -->
			<td colspan="2" align="center">
			<input type="button" value="목록" onclick="location.href='disc_list'">
			<input type="button" value="메인" onclick="location.href='index'">
			 </td>
			
		</tr>

</form>
</body>
</html>