<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.table table-hover {
	align-content: center;
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
	border-collapse: separate;
}

table.table table-hover th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #efefef;
}

table.table table-hover td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>

<div class="row">
		<nav class="navbar navbar-light bg-light">
				<div class="container-fluid">
						<form class="form-inline" action="/action_page.php">
							<div class="form-group">
								<span class="input-group-btn btn-block active"> 
									<input type="text" class="form-control" id="repcontent"	name="repcontent" placeholder="Search" width="30px">   
									<button type="button" class="btn btn-default" onclick="location.href='searchAll'">Search</button>
								</span>
							</div>
						</form>
						
<blockquote type="hidden" >       </blockquote>
	<table class="table table-hover" border="1"
		style="text-align: center; border-collapse: collapse; margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">영화 포스터</th>
				<th scope="col">영화 제목</th>
				<th scope="col">감독</th>
				<th scope="col">출연자</th>
				<th scope="col">기본 정보</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="r">
				<tr>
					<th scope="row">${r.rno}</th>	<!-- 글번호 -->
					<td><img src="img/${r.rposter }" width="40" height="60" ></td>
					<td>
						<a href="record_detail?rno=${r.rno }">${r.rtitle}</a>
					</td>
					<td>${r.rpd}</td>
					<td>${r.ractor}</td>
					<td>${r.rjenre}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
					</div>
		</nav>
</div>
</body>
</html>