<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<!-- ====================================================================================== -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ====================================================================================== -->
<!-- ((( record_detail list의 내용은 전부 여기에 있습니다 ))) -->
<script>
$(function(){
	$("#button999").click(function(){  
		var bno = $("#bno").val();
		alert(bno);		
		var repwriter = $("#repwriter").val();
		var repcontent = $("#repcontent").val();
		
		var sam ={"bno":bno,"repwriter":repwriter,"repcontent":repcontent};   
	    var sam =JSON.stringify(sam);  
	    $.ajax({
	         type:"post",
	         async:false,
	         url:"record_in",
	         data:{jsoninfo:sam},	
	        
	         success:function(data,textStatus){
	        	     alert("전송성공!!");
	        	     $("#repwriter").val('');
	        	     $("#repcontent").val('');
                   },    
	         error:function(data,textStatus){
	            alert("한줄평 댓글을 쓰려면 로그인 해주세요!!");
	         }	      
	      });      //end ajax
	});	
	
/////

    $("#show").click(function(){   //데이타베이스 자료를 JSP입력화면에 출력.AJAX]      
    	var bno = $("#bno").val();
    	alert(bno);		
        $.ajax({ 
          type:"post",      
          dataType:"json",
          url:"show",
          success:function(data)
          {
             alert("자료불러오기 성공!!")
             var htm = "<table class='table table-striped' border = '1' align='center'>";
             htm += "<tr>";
             htm += "<th style='border-right:none; border-left:none; text-align:center;' width='80px' >no.</th>";
             htm += "<th style='border-right:none; border-left:none; text-align:center;' width='200px' >작성자</th>";
             htm += "<th style='border-right:none; border-left:none; text-align:center;' width='600px' >내용</th>";
             htm += "<th style='border-left:none;' width='110px' colspan='2' ></th>";
             htm += "</tr>";         
             for(var i in data){                     
                htm += "<tr align = 'center'>";
                htm += "<td style='border-right:none; border-left:none;'>" + data[i].bno + "</td>";
                htm += "<td style='border-right:none; border-left:none;'>" + data[i].repwriter + "</td>";
                htm += "<td style='border-right:none; border-left:none;'>" + data[i].repcontent+ "</td>";
				 
                htm += "<td style='border-right:none; border-left:none;'>"
                //htm += "<a href='reply_mod?repwriter="+data[i].repwriter+"'>수정</a>&emsp; ";
               	//htm += "<a href='reply_del?repwriter="+data[i].repwriter+"'>삭제</a></td>";
                htm += "<button style='font-size:14px;' class='btn btn-default' onclick='location.href='reply_mod?repwriter="+data[i].repwriter+"'>수정</button> &emsp;";
                htm += "<button style='font-size:14px;' class='btn btn-default' onclick='location.href='reply_del?repwriter='+data[i].repwriter+''>삭제</button>";
             
                htm += "</tr>";            
             }
             htm += "</table>";
             $("#out1").html(htm);
          }
       });      //end ajax
    }); //show..자료출력      
 
    
    
/////
/*
    $("#reply_search").click(function(){   //데이타베이스 자료를 JSP입력화면에 출력.AJAX]      
    	var no = $("#find_bno").val();
    	alert(no);		
        $.ajax({ 
          type:"post",      
          dataType:"json",
          url:"show",
          success:function(data)
          {
             alert("자료불러오기 성공!!")
             var htm = "<table class='table table-striped' border = '1' align='center'>";
             htm += "<tr>";
             htm += "<th width='100px' >글번호</th>";
             htm += "<th width='200px' >작성자</th>";
             htm += "<th width='600px' >내용</th>";
             htm += "<th width='200px' colspan='2' ></th>";
             htm += "</tr>";         
             for(var i in data){                     
                htm += "<tr align = 'center'>";
                htm += "<td>" + data[i].bno + "</td>";
                htm += "<td>" + data[i].repwriter + "</td>";
                htm += "<td>" + data[i].repcontent+ "</td>";
                htm += "<td>수정</td>";
                htm += "<td><a href='reply_del?repwriter="+data[i].repwriter+"'>삭제</a></td>";
                htm += "</tr>";            

             }
             htm += "</table>";
             $("#out1").html(htm);
          }
       });      //end ajax
    }); //show..자료출력    
	*/
});


</script>
<!-- ====================================================================================== -->
<style>
th {
	font-size: 22px;
}

tbody {
	text-align: left;
	vertical-align: middle;
	font-size: 18px;
}
</style>

</head>
<body>

	<div class="container">

		<!-- 목록버튼 -->
		<div class="row">
			<!-- 왼쪽 블록 -->
			<div class="col-xs-12">
				<div class="col-sm-4" align="left">
					<button class="btn btn-default" onclick="location.href='record_notice'"
							 style="margin-bottom: 30px;">목록</button>
				</div>
			</div>
		
		<!-- 가운데블록 -->
		<div class="col-sm-4"></div>

		
			<table class="table table-bordered table-hover dt-responsive">
				<c:forEach items="${list }" var="rd">
				
					<input type="hidden" id="rno" name="rno" value="${rd.rno}">
				    <br>
					<!-- thead -->
					<thead>
						<tr>
							<th colspan="4"><h2>${rd.rno}. ${rd.rtitle}</h2></th>
						</tr>
					</thead>
					
					<!-- tbody -->
					<tbody>
						<tr>
							<td rowspan="4" width="300px">
								<img src="image/${rd.rposter }" style="width: 250px; height: 350px; margin: auto;">
							</td>
						</tr>
						<tr>
							<td colspan="4" style="vertical-align: middle;">
								<h3>감독</h3> <br> ${rd.rpd}
							</td>
						</tr>
						<tr>
							<td colspan="4" style="vertical-align: middle;">
								<h3>출연진</h3> <br> ${rd.ractor}
							</td>
						</tr>
						<tr>
							<td colspan="4" style="vertical-align: middle;">
								<h3>장르</h3> <br> ${rd.rjenre}
							</td>
						</tr>
					</tbody>
					
<!-- ======================================댓글====================================================== -->
					<tr style="text-align: center; " >
						<th colspan="4" style="border-bottom: none; text-align: center;"></th>
					</tr>
					<tr>
						<td align="center" colspan="3" style="border-bottom: none; border-top: none;">
							<input type="hidden" readonly id="bno" name="bno" value="${rd.rno}">
							<input type="hidden"  id="repwriter" name="repwriter" placeholder="작성자">
						
							<input type="text" id="repcontent" name="repcontent" placeholder="한줄평을 입력하세요." style="width: 50%;">
							<button type="button" class="btn " class="btn btn-primary mb-2" id="button999">등록</button>
							<button type="button" class="btn " class="btn btn-primary mb-2" id="show">한줄평 보기</button>
					&emsp;
							<input type="text" id="find_bno" name="find_bno" placeholder="No." style="width: 5%;">
							<button type="button" class="btn " class="btn btn-primary mb-2" id="reply_show">
								<span class="glyphicon glyphicon-search" align="center"></span>
							</button>
						</td>
					</tr>
<!-- ======================================댓글 보여주기====================================================== -->					
					<tr>
					<td colspan="4" style="border-top: none; border-bottom: none; " >
						<div class="container">        
							<!-- 한줄평 표 -->
							<div id="out1" class="out1"></div>    
						</div>
					</td>
					</tr>

				</c:forEach>
			</table>
		<div class="col-sm-4"></div>
	</div>

</div>
</body>
</html>

