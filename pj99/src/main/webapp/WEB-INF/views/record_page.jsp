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
table {
	vertical-align: middle;
	text-align: center;
	border-left: none;
	border-right: none;
}

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
	margin: auto;
	border-collapse: collapse;
}

table.table table-hover th {
	width: 150px;
	margin: auto;
	font-weight: bold;
	background: #efefef;
	
}

table.table table-hover td {
	width: 350px;
	margin: auto;
}

</style>
</head>
<body>

	<h2>한줄평</h2>

	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
				<!-- 컨텐츠등록 버튼 -->
				<c:set value="${user_id }" var="uid"/>
				<c:choose>
				<c:when test="${uid=='admin' || uid=='master'}">
					<div class="col-sm-4" align="left">
						<button class="btn btn-default" onclick="location.href='recordinController'">콘텐츠 등록</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-sm-4" align="left">
						<button class="btn btn-default disabled" onclick="location.href=''">콘텐츠 등록</button>
					</div>
				</c:otherwise>
				</c:choose>	
					<div class="col-sm-8" align="right">
						<div class="row">
							<nav class="navbar navbar-light bg-light">
								<div class="container-fluid">
								<!-- 
									<form class="form-inline" action="/action_page.php">
										<div class="form-group">
							검색 옵션 설정
												<select class="form-select" aria-label="Default select example"  name="sname">
  													<option selected>제목</option>
  													<option value="1">내용</option>
  													<option value="2">제목+내용</option>
												 	<option value="3">작성자</option>
												</select>
							검색 상자, 버튼
											<span class="input-group-btn btn-block active">
												<input type="text" class="form-control" id="keyword"  name="svalue" placeholder="Search" width="30px">
												<button type="button" class="btn btn-default" onclick="location.href='searchAll'">Search</button>
											</span>
										</div>
									</form>
								 -->
								</div>
							</nav>
						</div>
					</div>
					<table class="table table-hover" border="1"
						style="text-align: center; border-collapse: collapse; margin-left: auto; margin-right: auto;border-left: none; border-right: none;"
						class="table table-bordered table-hover dt-responsive">
						<caption class="text-center">
							제목을 클릭하여 한줄평을 달아보세요! 	
						</caption>
						<thead>
							<tr style="text-align: center;background-color: EEEEEE;">
								<th scope="col" style="text-align: center;">No.</th>
								<th scope="col" style="text-align: center;">영화 포스터</th>
								<th scope="col" style="text-align: center;">영화 제목</th>
								<th scope="col" style="text-align: center;">감독</th>
								<th scope="col" style="text-align: center;">출연자</th>
								<th scope="col" style="text-align: center;">기본 정보</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${view}" var="r">
								<tr>
									<th scope="row" style="vertical-align: middle; text-align: center;"">${r.rno}</th>
									<!-- 글번호 -->
									<td style="vertical-align: middle;">
										<img src="image/${r.rposter }" width="40" height="60">
									</td>
									<th style="vertical-align: middle; text-align: center;">
										<a href="record_detail?rno=${r.rno }">${r.rtitle}</a>
									</th>
									<td style="vertical-align: middle;">${r.rpd}</td>
									<td style="vertical-align: middle;">${r.ractor}</td>
									<td style="vertical-align: middle;">${r.rjenre}</td>
									
								</tr>
							</c:forEach>
						</tbody>

						<!-- 페이징처리 4444444444-->
						<tr>
							<td colspan="6" style="border-bottom: none; border-left:none; border-right:none;  text-align: center;">
							<c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p}</b>
										</c:when>

										<c:when test="${p != paging.nowPage }">
											<a href="record_notice?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
										</c:when>
									</c:choose>
							</c:forEach></td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		
	</div>
</body>
</html>