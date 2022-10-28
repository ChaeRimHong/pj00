<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<script  src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<script type="text/javascript">
$(function(){
   $("#button").click(function(){   //폼에서 입력받은 자료를 디비에 저장 ...
      var id =$("#id").val();
      var pw =$("#pw").val();
      var name =$("#name").val();
      var tel =$("#tel").val();
      var sam ={"id":id,"pw":pw,"name":name,"tel":tel};   
      var sam =JSON.stringify(sam);   
      $.ajax({
         type:"post",
         async:false,
         url:"send1",
         data:{jsoninfo:sam},
         success:function(data,textStatus){
            alert("전송성공!!");   
         },
         error:function(data,textStatus){
            alert("전송실패!!");
         }
      
      });      //end ajax
   }); //자료입력
   
   $("#reset").click(function(){
      $("#id").val('');
      $("#pw").val('');
      $("#name").val('');
      $("#tel").val('');
   });   
    
      $("#out2").click(function(){   //데이타베이스 자료를 JSP입력화면에 출력.AJAX]      
         $.ajax({
            type:"post",      
             dataType:"json",
            url:"out2",
            success:function(data)
            {
                     
               var htm = "<table border = '1' >";
               htm += "<tr>";
               htm += "<th>아이디</th>";
               htm += "<th>패스워드</th>";
                htm += "<th>이 름</th>";
               htm += "<th>전화번호</th>";
               htm += "</tr>";         
               for(var i in data){                     
                  htm += "<tr align = 'center'>";
                  htm += "<td>" + data[i].id + "</td>";
                  htm += "<td>" + data[i].pw + "</td>";
                  htm += "<td>" + data[i].name+ "</td>";
                  htm += "<td>" + data[i].tel + "</td>";
                  htm += "</tr>";            

               }
               htm += "</table>";
               $("#out").html(htm);
            }
         });      //end ajax
      }); //out2..자료출력      
});


</script>




<script type="text/javascript">
var bno = '${record_detail.bno}'; //게시글 번호
 
$("#replyInBtn").click(function() { //댓글 등록 버튼 클릭시     
	var insertData = $('[name=replyInForm]').serialize(); //replyInForm의 내용을 가져옴    
	replyinsert(insertData); //Insert 함수호출(아래)
});

//댓글 목록 
function replylist() {
	$
			.ajax({
				url : '/reply/record_list',
				type : 'get',
				data : {
					'bno' : bno
				},
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					var a = '';
					$
							.each(
									data,
									function(key, value) {
										a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
										a += '<div class="commentInfo'+value.repno+'">'
												+ '댓글번호 : '
												+ value.repno
												+ ' / 작성자 : '
												+ value.repwriter;
										a += '<a onclick="commentUpdate('
												+ value.repno + ',\''
												+ value.repcontent
												+ '\');"> 수정 </a>';
										a += '<a onclick="commentDelete('
												+ value.repno
												+ ');"> 삭제 </a> </div>';
										a += '<div class="commentContent'+value.repno+'"> <p> 내용 : '
												+ value.repcontent + '</p>';
										a += '</div></div>';
									});

					$(".replylist").html(a);
				}
			});
}

//댓글 등록
function replyinsert(insertData) {
	$.ajax({
		url : '/reply/record_in',
		type : 'post',
		data : insertData,
		success : function(data) {
			if (data == 1) {
				replylist(); //댓글 작성 후 댓글 목록 reload                
				$('[name=repcontent]').val('');
			}
		}
	});
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function replymod(repno, repcontent) {
	var a = '';
	a += '<div class="input-group">';
	a += '<input type="text" class="form-control" name="content_'+repno+'" value="'+repcontent+'"/>';
	a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="repmodProc('
			+ repno + ');">수정</button> </span>';
	a += '</div>';
	$('.commentContent' + repno).html(a);
}

//댓글 수정
function repmodProc(repno) {
	var updateContent = $('[name=repcontent_' + repno + ']').val();
	$.ajax({
		url : '/reply/record_mod',
		type : 'post',
		data : {
			'repcontent' : updateContent,
			'repno' : repno
		},
		success : function(data) {
			if (data == 1)
				replylist(bno);
			//댓글 수정후 목록 출력         
		}
	});
}
//댓글 삭제 
function replydel(repno) {
	$.ajax({
		url : '/reply/record_del/' + repno,
		type : 'post',
		success : function(data) {
			if (data == 1)
				replylist(bno); //댓글 삭제후 목록 출력         
		}
	});
}
$(document).ready(function() {
	replylist(); //페이지 로딩시 댓글 목록 출력 
});
</script>




<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section style="position: fixed;top:100px;width: 100%;height: 100%;
: darkgray;margin-top: 50px;margin-left: 50px;'">
<form name="frm">
아이디 <input type="text" name="id"  id="id"><br>
패스워드 <input type="text" name="pw"  id="pw"><br>
이름 <input type="text" name="name"  id="name"><br>
전화번호 <input type="text" name="tel"  id="tel"><br>
       <button type="button" id="button">로그인</button> 
       <button type="button" id="reset">취소</button>
       
         <input type="button" id="out2" value="불러오기">         

</form>
<div id="out">
</div>
</section>
</body>
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