<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
$(function(){
	$("#button").click(function(){  
		var dbbno = $("#dbbno").val();
		alert(dbbno);
		//var reno = $("#reno").val();
		var rewriter = $("#rewriter").val();
		var recontent = $("#recontent").val();
		//var redate = $("#redate").val();
		
		var sam ={"dbbno":dbbno,"rewriter":rewriter,"recontent":recontent};   
	    var sam =JSON.stringify(sam);  
	    $.ajax({
	         type:"post",
	         async:false,
	         url:"disc_inp",
	         data:{jsoninfo:sam},
	         contentType : "application/json; charset=utf-8",
	         success:function(data,textStatus){
	        	 if(data == 1){ // 성공
                     $("#rewriter").val("");
                     $("#recontent").val("");
                     alert("전송성공!!");
                 } else { // 실패
                     alert("등록 실패입니다. 다시 시도하세요");
                 }
	         },    
	         error:function(data,textStatus){
	            alert("전송실패!!");
	         }
	      
	      });      //end ajax
	});    	    
	      
	$("#show1").click(function(){   //데이타베이스 자료를 JSP입력화면에 출력.AJAX]      
	     $.ajax({
	        type:"get",      
	        dataType:"json",
	        url:"/reply/show1",
	        contentType : "application/json; charset=utf-8",
	        success:function(data)
	        {
	        	if(data.length>0){
	        		var tb=$("<table/>");
		        	for(var i in data){
		        		var $dbno=data[i].dbno;
		        		var $reno=data[i].reno;
		        		var $rewriter=data[i].rewriter;
		        		var $recontent=data[i].recontent;
		        		var $redate=data[i].redate;
		        		
		        		var row=$("<tr/>").append(
		        				$("<td/>").text($dbno),
		        				$("<td/>").text($reno),
		        				$("<td/>").text($rewriter),
		        				$("<td/>").text($recontent),
		        				$("<td/>").text($redate),
		        		);
		        		tb.append(row);
		        	}
	        		$(".containor").append(tb);
	        	}
	        	
	        	
	        }
	     });      //end ajax
	}); //showCont 콘트롤러에서 자료출력
});
		/* 등록이벤트
		$("#replyRegist").click(function() {
			
			var bno = "${boardVO.bno}" // 글번호
			var reply = $("#reply").val();
			var replyId = $("#replyId").val();
			var replyPw = $("#replyPw").val();
			
			if(reply == '' || replyId == '' || reply == ''){
	            alert("이름, 비밀번호, 내용은 필수입니다");
	            return;
	        }
		*/  
   

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h3 align="center">비평란</h3>
	<div class="containor" style="margin-bottom: 100px;">
		<form class="form-inline">
			<div class="form-group mb-2">
				<label for="staticEmail2" class="sr-only">글번호</label> 
				<input type="hidden" readonly class="form-control-plaintext" id="dbbno" name="dbbno" value="${dbno }">
			</div>

			<div class="form-group mx-sm-3 mb-2">
				<input type="text" class="form-control" name="rewriter" placeholder="작성자"> 
				<label for="inputPassword2" class="sr-only">댓글</label> 
				<input type="text" class="form-control" name="recontent" placeholder="댓글을 입력하세요.">
			</div>
			<button type="button" class="btn btn-primary mb-2" id="button">등록</button>
			<button type="button" class="btn btn-primary mb-2" id="show1">새로고침</button>

		</form>
	</div>
</html>
<!-- 
pom.xml화일에 json에 필요한 4개의 라이브러리를 추가
   if(data.length>0)
                  {
                     var td=$("<table/>");
                     for(var i in data)
                        {
                        var $id=data[i].id;
                        var $pw=data[i].pw;
                        var $name=data[i].name;
                        var $tel=data[i].tel;
                        var row = $("<tr/>").append(
                           $("<td/>").text($id),
                           $("<td/>").text($pw),
                           $("<td/>").text($name),
                           $("<td/>").text($tel),
                           );
                        td.append(row);
                        }
                                    
               $("#out").append(td);

 -->