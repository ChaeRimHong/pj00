<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$('table').DataTable();

	//See:
	//http://www.sitepoint.com/responsive-data-tables-comprehensive-list-solutions
</script>
<style type="text/css">
h2 {
	text-align: center;
	padding: 20px 0;
}

table caption {
	padding: .5em 0;
}

table.dataTable th, table.dataTable td {
	white-space: nowrap;
}

.p {
	text-align: center;
	padding-top: 140px;
	font-size: 14px;
}

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
	<h2>비평 보기</h2>

	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-sm-4" align="left">
						<button class="btn btn-default"
							onclick="location.href='disc_input'">비평 등록</button>
					</div>
					<div class="col-sm-4"></div>
					<div class="col-sm-4" align="right">
						<div class="row">
							<nav class="navbar navbar-light bg-light">
								<div class="container-fluid">
								<!-- 
									<form class="form-inline" action="/action_page.php">
										<div class="form-group">
											<span class="input-group-btn btn-block active"> <input
												type="text" class="form-control" id="repcontent"
												name="repcontent" placeholder="Search" width="30px">
												  
												<button type="button" class="btn btn-default"
													onclick="location.href='searchAll'">Search</button>
											</span>
										</div>
									</form>
								 -->
								</div>
							</nav>
						</div>
					</div>
					<table class="table table-hover" border="1"
						style="text-align: center; border-collapse: collapse; margin-left: auto; margin-right: auto;"
						summary="This table shows how to create responsive tables using Datatables' extended functionality"
						class="table table-bordered table-hover dt-responsive">
						<caption class="text-center">
							비평을 등록하여 의견을 나눠보세요!
							<a href="https://datatables.net/extensions/responsive/" target="_blank"></a>
						</caption>
						
						<thead>
							<tr>
								<th scope="col">NO.</th>
								<th scope="col">글제목</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="d">
								<tr>
									<th scope="row">${d.dnum }</th>
									<!-- 글번호 -->
									<td><a href="disc_detail?dnum=${d.dnum }">${d.dtitle}</a>
									</td>
									<!--<fmt:parseDate value="${d.ddate }" var="dateValue" pattern="yyyyMMddHHmmss"/> 
				<td><fmt:formatDate value="${dateValue }" pattern="yyyy-MM-dd"/></td>
				
			</tr>-->
									<td>${d.ddate }</td>
									<td>${d.dreadcnt }</td>
							</c:forEach>
						</tbody>

					<!-- 페이징처리 4444444444-->
					<tr
						style="border-left: none; border-right: none; border-bottom: none">
						<td colspan="6" style="text-align: center;"><c:forEach
								begin="${paging.startPage }" end="${paging.endPage}" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p}</b>
									</c:when>

									<c:when test="${p != paging.nowPage }">
										<a
											href="record_notice?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
									</c:when>
								</c:choose>
							</c:forEach></td>
					</tr>
					</table>
				</div>
			</div>
		</div>

		<p class="p">
			Demo by George Martsoukos. <a
				href="http://www.sitepoint.com/responsive-data-tables-comprehensive-list-solutions"
				target="_blank">See article</a>.
		</p>
	</div>
</body>
</html>
