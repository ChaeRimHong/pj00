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
	

	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-sm-4" align="left">
					<!-- 
						<button class="btn btn-default"
							onclick="location.href='recordinController'">콘텐츠 등록</button>
					 -->
					</div>
					<div class="col-sm-8" align="right">
						<div class="row">
							<nav class="navbar navbar-light bg-light">
								<div class="container-fluid">
									<!-- 
									<form class="form-inline" action="/action_page.php">
										<div class="form-group">
											
												<select class="form-select" aria-label="Default select example"  name="sname">
  													<option selected>제목</option>
  													<option value="1">내용</option>
  													<option value="2">제목+내용</option>
												 	<option value="3">작성자</option>
												</select>
											
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
					
					<!-- 
						System.out.println(discussion_list);
						System.out.println(record_list);
					 -->
					
					
					<table class="table table-hover" border="1"
						style="text-align: center; border-collapse: collapse; margin-left: auto; margin-right: auto;"
						class="table table-bordered table-hover dt-responsive">
						<thead>
							<tr>
								<th colspan="6"><a href="record_notice">한줄평 게시판</a></th>
							</tr>
							<tr>
								<th scope="col">글번호</th>
								<th style="text-align: center;" scope="col">영화 포스터</th>
								<th style="text-align: center;" scope="col">영화 제목</th>
								<th style="text-align: center;" scope="col">감독</th>
								<th style="text-align: center;" scope="col">출연자</th>
								<th style="text-align: center;" scope="col">기본 정보</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${record_list }" var="rec">
								<tr>
									<info>
									<th scope="row">${rec.rno}</th>
									<!-- 글번호 -->
									<td><img src="image/${rec.rposter }" width="40" height="60"></td>
									<td><a href="record_detail?rno=${rec.rno }">${rec.rtitle}</a></td>
									<td>${rec.rpd}</td>
									<td>${rec.ractor}</td>
									<td>${rec.rjenre}</td>
									</info>
								</tr>
						</c:forEach>
						</tbody>
					</table>
					
					
<!-- ============================================================================================================================================== -->					
					
					
					<table class="table table-hover" border="1"
						style="text-align: center; border-collapse: collapse; margin-left: auto; margin-right: auto;"
						class="table table-bordered table-hover dt-responsive">
						<thead>
							<tr>
								<th colspan="6"><a href="disc_notice">비평 게시판</a></th>
							</tr>
							<tr>
								<th scope="col">NO.</th>
								<th style="text-align: center;" scope="col">글제목</th>
								<th style="text-align: center;" scope="col">작성일</th>
								<th style="text-align: center;" scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${discussion_list }" var="d">
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
								</tr>
						
						</c:forEach>
						</tbody>
					</table>
	 				
					
				</div>
			</div>
		</div>

		
	</div>
</body>
</html>