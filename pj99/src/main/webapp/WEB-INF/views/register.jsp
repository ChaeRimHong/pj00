<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.table table-hover {
	border-collapse: separate;
	border-left: 3px solid #FFEFD5;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: none;
	border-bottom: none;
	margin: 20px 10px;
}

table.table table-hover th {
	text-align: center;
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	border-top: none;
	border-bottom: none;
	height: 50px;
}

table.table table-hover td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	border-top: none;
	border-bottom: none;
}
</style>
</head>
<body>
<form action="joinb" method="post">
	<h2></h2>
	<div class="a" align="center">
	<table class="table table-hover"
		style="	border-collapse: separate; 
				border-left: 3px solid #FFEFD5; 
				border-spacing: 1px; 
				text-align: left; 
				line-height: 1.5; 
				border-top: none; 
				border-bottom: none; 
				margin: 20px 10px;">
		<tr>
			<th scope="row"	style="	text-align: center; 
									width: 60px; 
									height: 50px; 
									padding: 10px; 
									font-weight: bold; 
									vertical-align: top; 
									border-bottom: 1px solid #ccc; 
									border-top: none; 
									border-bottom: none; ">
				아이디
			</th>
			<td style="	width: 350px; 
						padding: 10px; 
						vertical-align: top; 
						border-bottom: 1px solid #ccc; 
						border-top: none; 
						border-bottom: none;">&emsp;&emsp;
				<input type="text" name="id" placeholder="ID">
				<input type="button" value="중복확인" onclick=="location.href=''">
			</td>
		</tr>
		
		<tr>
			<th scope="row" style="	text-align: center; 
									width: 60px; 
									padding: 10px; 
									font-weight: bold; 
									vertical-align: top; 
									border-bottom: 1px solid #ccc; 
									border-top: none; 
									border-bottom: none; 
									height: 50px;">
				비밀번호
			</th>
			<td style="	width: 350px; 
						padding: 10px; 
						vertical-align: top; 
						border-bottom: 1px solid #ccc; 
						border-top: none; 
						border-bottom: none;">&emsp;&emsp;
				<input type="password" name="pw" placeholder="PassWord">
			</td>
		</tr>
		
		<tr>
			<th scope="row" style="	text-align: center; 
									width: 60px; 
									padding: 10px; 
									font-weight: bold; 
									vertical-align: top; 
									border-bottom: 1px solid #ccc; 
									border-top: none; 
									border-bottom: none; 
									height: 50px;">
				비밀번호 확인
			</th>
			<td style="	width: 350px; 
						padding: 10px; 
						vertical-align: top; 
						border-bottom: 1px solid #ccc; 
						border-top: none; 
						border-bottom: none;">&emsp;&emsp;
				<input type="password" name="pwco" placeholder="PassWord">
			</td>
		</tr>
		
		<tr>
			<th scope="row" style="	text-align: center; 
									width: 60px; 
									padding: 10px; 
									font-weight: bold; 
									vertical-align: top; 
									border-bottom: 1px solid #ccc; 
									border-top: none; 
									border-bottom: none; 
									height: 50px;">
				이름
			</th>
			<td style="	width: 350px; 
						padding: 10px; 
						vertical-align: top; 
						border-bottom: 1px solid #ccc; 
						border-top: none; 
						border-bottom: none;">&emsp;&emsp;
				<input type="text" name="name" placeholder="NAME">
			</td>
		</tr>
		
		<tr>
			<th scope="row" style="	text-align: center; 
									width: 60px; 
									padding: 10px; 
									font-weight: bold; 
									vertical-align: top; 
									border-bottom: 1px solid #ccc; 
									border-top: none; 
									border-bottom: none; 
									height: 50px;">
				이메일
			</th>
			<td style="	width: 350px; 
						padding: 10px; 
						vertical-align: top; 
						border-bottom: 1px solid #ccc; 
						border-top: none; 
						border-bottom: none;">&emsp;&emsp;
				<input type="email" name="email" placeholder="EMAIL">
			</td>
		</tr>
	</table>
	</div>
	<br><br>
	<input type="submit" value="회원가입" >
</form>
</body>
</html>