<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
 .carousel-inner img {
   width: 40%;
    height: 90%;
  }
  .item active {
    width: 40%;
    height: 90%;
  }

</style>
</head>
<body>
<c:choose>
	<c:when test="${result=='loginfail'}">
		<script type="text/javascript">
			window.onload = function() {
				alert("로그인 후 이용가능합니다.");
				//response.sendredirect
			}
		</script>
	</c:when>
</c:choose>

<div class="container">
  <h2>이달의 영화</h2> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
   
      <div class="item active" >
      	<img class="img-responsive center-block" src="image/표류단지.jpeg" width="200" height="350"/>
        <div class="carousel-caption">
        <!-- 
        <h3>표류단지</h3>
		<p>영화 her</p>
		 -->
		</div>
      </div>

      <div class="item">
       <img class="img-responsive center-block" src="image/parasite.jpg" width="200" height="350">
       	<div class="carousel-caption">
       	<!-- 
       	<h3>기생충</h3>
		<p>봉준호 감독</p>
		 -->
		</div>
      </div>
    
      <div class="item">
        <img class="img-responsive center-block" src="image/toystory.jpg" width="200" height="350">
        <div class="carousel-caption">
        <!-- 
        <h3>토이스토리4</h3>
		<p>귀요미 토이스토리</p>
		 -->
		</div>
      </div>
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<!-- ======================================================================= -->

<div class="container" style="margin-top: 250px; margin-bottom: 300px; ">
 <h2>이벤트 영화 - 마블 시리즈</h2>
  <div id="myCarousel2" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img class="img-responsive center-block"  src="image/spiderman.jpg" alt="cute dog" width="200" height="350">
        <div class="carousel-caption">
        <!-- 
        <h3>스파이더맨</h3>
		<p>스파이더맨</p>
		 -->
		 </div>
      </div>

      <div class="item">
        <img class="img-responsive center-block"  src="image/avengers.jpg" alt="cute cat" width="200" height="350">
        <div class="carousel-caption">
        <!-- 
		<h3>어벤저스</h3>
		<p>아이언맨 살아있을 적</p>
		 -->
		 </div>
      </div>
    
      

    <!-- Left and right controls -->
    	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
      		<span class="glyphicon glyphicon-chevron-left"></span>
     		<span class="sr-only">Previous</span>
   		</a>
    	<a class="right carousel-control" href="#myCarousel2" data-slide="next">
     		<span class="glyphicon glyphicon-chevron-right"></span>
      		<span class="sr-only">Next</span>
   		</a>
  	</div>
	</div>
</div>
</body>
</html>
