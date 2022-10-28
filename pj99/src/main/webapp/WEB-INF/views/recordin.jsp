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
	<!-- 영화 한줄평을 위해 미리 영화를 등록해놓는 페이지(master전용) -->
	<form action="recordinsave" method="post"  enctype="multipart/form-data">
		<table class="type05" border="1"
			style="text-align: center; border-collapse: collapse;margin-left:auto;margin-right:auto;">
				<h3 style="margin-left: auto; margin-right: auto;">영화 등록</h3>
			<tr>
				<th style="vertical-align:middle; text-align:center;">글번호</th>
				<td><input type="hidden" name="rno" readonly="readonly"></td>
			</tr>
			<tr>
				<th style="vertical-align:middle; text-align:center;">영화 포스터</th>
				<td><input type="file" name="rposter"></td>
			</tr>
			<tr>
				<th style="vertical-align:middle; text-align:center;">영화 제목</th>
				<td><input type="text" name="rtitle" style="border:0 solid black; width: 700px;" placeholder="조커(2019)"></td>
			</tr>
			<tr>
				<th style="vertical-align:middle; text-align:center;">감독</th>
				<td><input type="text" name="rpd" style="border:0 solid black; width: 700px;" placeholder="토드 필립스"></td>
			</tr>
			<tr>
				<th style="vertical-align:middle; text-align:center;">출연자</th>
				<td><input type="text" name="ractor" style="border:0 solid black; width: 700px;" placeholder="호아킨 피닉스, 로버트 드 니로 "></td>
			</tr>
			<tr>
				<th style="vertical-align:middle; text-align:center;height: 200px;">기본 정보</th>
				<td>
					 &emsp;<input type="checkbox" name="rjenre" value="로맨스">	로맨스
					 &emsp;<input type="checkbox" name="rjenre" value="액션">액션 
					 &emsp;<input type="checkbox" name="rjenre" value="스릴러">스릴러 
					 &emsp;<input type="checkbox" name="rjenre" value="코미디">코미디 
					 &emsp;<input type="checkbox" name="rjenre" value="로맨틱 코미디">로맨틱코미디
					 &emsp;<input type="checkbox" name="rjenre" value="드라마">드라마 
					 &emsp;<input type="checkbox" name="rjenre" value="다큐멘터리">다큐멘터리 
					 &emsp;<input type="checkbox" name="rjenre" value="판타지">판타지 <br><br>
					 &emsp;<input type="checkbox" name="rjenre" value="느와르">느와르 
					 &emsp;<input type="checkbox" name="rjenre" value="공포">공포 
					 &emsp;<input type="checkbox" name="rjenre" value="뮤지컬">뮤지컬 
					 &emsp;<input type="checkbox" name="rjenre" value="SF">SF 
					 &emsp;<input type="checkbox" name="rjenre" value="밀리터리">밀리터리 
					 &emsp;<input type="checkbox" name="rjenre" value="우주">우주 
					 &emsp;<input type="checkbox" name="rjenre" value="범죄">범죄 
					 &emsp;<input type="checkbox" name="rjenre" value="피카레스크">피카레스크 
					 &emsp;<input type="checkbox" name="rjenre" value="재난">재난 <br><br>
					 &emsp;<input type="checkbox" name="rjenre" value="시대극">시대극 
					 &emsp;<input type="checkbox" name="rjenre" value="괴수">괴수 
					 &emsp;<input type="checkbox" name="rjenre" value="스포츠">스포츠 
					 &emsp;<input type="checkbox" name="rjenre" value="슈퍼히어로">슈퍼히어로 
					 &emsp;<input type="checkbox" name="rjenre" value="좀비물"> 좀비물 
					 &emsp;<input type="checkbox" name="rjenre" value="전쟁">전쟁 
					 &emsp;<input type="checkbox" name="rjenre" value="스너프필름">스너프필름 
					 &emsp;<input type="checkbox" name="rjenre" value="법률">법률 <br><br>
					 &emsp;<input type="checkbox" name="rjenre" value="애니메이션">애니메이션
					 &emsp;<input type="checkbox" name="rjenre" value="스톱모션">스톱모션
					 &emsp;<input type="checkbox" name="rjenre" value="블록버스터">블록버스터
					 &emsp;<input type="checkbox" name="rjenre" value="저예산">저예산
					 &emsp;<input type="checkbox" name="rjenre" value="할리우드">할리우드
					 &emsp;<input type="checkbox" name="rjenre" value="발리우드">발리우드
					 &emsp;<input type="checkbox" name="rjenre" value="흑백영화">흑백영화  <br><br>
					 &emsp;<input type="checkbox" name="rjenre" value="독립영화">독립영화
					 &emsp;<input type="checkbox" name="rjenre" value="전체 관람가">전체 관람가
					 &emsp;<input type="checkbox" name="rjenre" value="15세 관람가">15세 관람가
					 &emsp;<input type="checkbox" name="rjenre" value="18세 관람가">18세 관람가
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="올리기"> 
					<input type="button" value="목록으로 가기" onClick="location.href='recordController'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>