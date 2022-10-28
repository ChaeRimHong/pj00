<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<!-- ====================================================================================== -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ====================================================================================== -->
<!-- ((( record_detaillist의 내용은 전부 여기에 있습니다 ))) -->
<script>
   $(function() {
      $("#button999").click(function() {
         var dbno = $("#dbno").val();
         alert(dbno);
         var rewriter = $("#rewriter").val();
         var recontent = $("#recontent").val();

         var sam = {
            "dbno" : dbno,
            "rewriter" : rewriter,
            "recontent" : recontent
         };
         var sam = JSON.stringify(sam);
         $.ajax({
            type : "post",
            async : false,
            url : "disc_inp",
            data : {
               jsoninfo : sam
            },

            success : function(data, textStatus) {
               alert("전송성공!!");
               $("#rewriter").val('');
               $("#recontent").val('');
               //$("#redate").val('');
            },
            error : function(data, textStatus) {
               alert("전송실패!!");
            }
         }); //end ajax
      });

      /////
      $("#show11").click(function() { //데이타베이스 자료를 JSP입력화면에 출력.AJAX]     
    	var dbno = $("#dbno").val();
      	alert(dbno);		
         $.ajax({
            type : "post",
            dataType : "json",
            url : "show1",
            success : function(data) {
               alert("댓글불러오기 성공!!")
               var htm = "<table border = '1' align='center'>";
               htm += "<tr>";
               htm += "<th style='border-right:none; border-left:none; text-align:center;' width='80px' >No.</th>";
               htm += "<th style='border-right:none; border-left:none; text-align:center;' width='80px' >작성자</th>";
               htm += "<th style='border-right:none; border-left:none; text-align:center;' width='80px' >내용</th>";
              // htm += "<th width='200px' >작성일자</th>";
               htm += "<th width='100px' colspan='2' ></th>";
               htm += "</tr>";
               for ( var i in data) {
                  htm += "<tr align = 'center'>";
                  htm += "<td style='border-right:none; border-left:none;'>" + data[i].dbno + "</td>";
                  htm += "<td style='border-right:none; border-left:none;'>" + data[i].rewriter + "</td>";
                  htm += "<td style='border-right:none; border-left:none;'>" + data[i].recontent + "</td>";
                  //htm += "<td>" + data[i].redate + "</td>";
                  
                  htm += "<td style='border-right:none; border-left:none;'>"
                  htm += "<button style='font-size:14px;' class='btn btn-default' onclick='location.href='disc_up?rewriter="+data[i].rewriter+"'>수정</button> &emsp;";
                  htm += "<button style='font-size:14px;' class='btn btn-default' onclick='location.href='disc_del?rewriter="+data[i].rewriter+"'>삭제</button>";
                  htm += "</tr>";

               }
               htm += "</table>";
               $("#out1").html(htm);
            }
         }); //end ajax
      }); //show..자료출력      


});
</script>
<!-- ====================================================================================== -->
<style>
th {
   font-size: 22px;
}

td {
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
               <button class="btn btn-default"
                  onclick="location.href='disc_notice'" style="margin-bottom: 30px;">목록</button>
            </div>
         </div>

         <!-- 가운데블록 -->
         <div class="col-sm-4"></div>


         <table class="table table-bordered table-hover dt-responsive">
            <c:forEach items="${list }" var="rd">

               <input type="hidden" id="dnum" name="dnum" value="${rd.dnum}">
               <br>
               <!-- thead -->
               <thead>
                  <tr>
                     <th colspan="4"><h2>${rd.dtitle}</h2></th>
                  </tr>
               </thead>

               <!-- tbody -->
               <tbody>
                  <tr>
                     <td colspan="4" style="vertical-align: middle;">

                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${rd.mtitle}
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${rd.ddate}
                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        조회수 : ${rd.dreadcnt}    &emsp;&emsp;
                     </td>
                  </tr>
                  <tr>
                     <td colspan="4"
                        style="   vertical-align: middle; 
                              height: 500px; 
                              padding-top: 30px; 
                              padding-left: 50px; 
                              padding-right: 50px; 
                              padding-bottom: 30px;
                              border-bottom: none;">
                        ${rd.dcontent}
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="vertical-align: middle; border-top: none; text-align: right;">
                        <button class="btn btn-default"
                           onclick="location.href='disc_update1?dnum=${rd.dnum }'">수정</button>
                        <button class="btn btn-default"
                           onclick="location.href='disc_delete?dnum=${rd.dnum }'">삭제</button>
                     </td>
                  </tr>

                  <tr>
               </tbody>

               <!-- ======================================댓글====================================================== -->
              <tr style="text-align: center; " >
						<th colspan="4" style="border-bottom: none; text-align: center;">댓글 남기기</th>
					</tr>
					<tr>
						<td style="border-bottom: none;border-top: none;"" align="center" colspan="3">
							<input type="hidden" readonly id="dbno" name="dbno" value="${rd.dnum}">
							<input type="hidden" readonly id="rewriter" name="rewriter" placeholder="작성자" >
						
							<input type="text" id="recontent" name="recontent" placeholder="댓글을 입력하세요." style="width: 50%;">
							<button type="button" class="btn " class="btn btn-primary mb-2" id="button999">등록</button>
							<button type="button" class="btn " class="btn btn-primary mb-2" id="show11">댓글보기</button>
					&emsp;
							<input type="text" id="find_dbno" name="find_dbno" placeholder="No." style="width: 5%;">
							<button type="button" class="btn " class="btn btn-primary mb-2" id="disc_show">
								<span class="glyphicon glyphicon-search" align="center"></span>
							</button>
						</td>
					</tr>
               <!-- ======================================댓글 보여주기====================================================== -->
               <tr>
                  <td colspan="4" style="border-top: none;">
                     <div class="container">
                                
                        <!-- 비평란 댓글 표 -->
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