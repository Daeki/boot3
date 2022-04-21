<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="./temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<!-- header -->
<c:import url="./temp/header.jsp"></c:import>

<div class="container mt-4">	
  		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="https://fncent.com/files/2022/02/23/875ea9925cc4988746519d241fd2b78a180649.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="https://fncent.com/files/2022/02/23/95c2c0687206848f8f867241a1115b1a180649.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="https://fncent.com/files/2022/02/23/c1ef220da543b3d053290efcb3dd2581180649.jpg" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
 </div>

<div class="container">
	<input type="text" id="d1">
	<button id="btn">CLICK</button>
	<button id="btn2">CLICK2</button>
	<input type="checkbox" name="ch" class="ch" value="1">
	<input type="checkbox" name="ch" class="ch" value="2">
	<input type="checkbox" name="ch" class="ch" value="3">
	<input type="checkbox" name="ch" class="ch" value="4">
	<button id="btn3">CLICK3</button>
	<div id="result">
		
	</div>
	
</div>	



<c:import url="./temp/header_script.jsp"></c:import>
<script type="text/javascript">
/* 	const ch = document.getElementsByClassName("ch");//배열
	
	for(c of ch){
		c.addEventListener("click", function(){
			alert(this.value);
		});
	} */
	
/* 	$(".ch").click(function(){
		console.log(this.value);
	}); */
	
/* 	$(".ch").on({
		click:function(){
			console.log("click");
		},
		change:function(){
			console.log("change");
		}
	}); */
	
	$(".ch").click(function(e) {
		let c = $(this).prop("checked")
		this.checked
		console.log(c);
		$(".ch").prop("checked", true);
		
		//let v = $(this).val();
		//console.log(v);
	});
	
	$(".ch").change(function() {
		console.log("change Test");
	});

	
	$("#btn2").click(function () {
		$(".ch").each(function(idx, item) {
			console.log("Index : ", idx);
			console.log("Item : ", item);
			console.log("Value : ", $(item).val())
		});
	});

	$('#btn').on("click", function(){
		let v = $("#d1").val();
		console.log(v);
	});
	
	$("#btn3").click(function() {
		
		let r = "<div>";
		r = r+'<input type="checkbox" name="ch" class="ch" value="1">';
		r = r+"</div>";
		
		$("#result").append(r)
	});
</script>
</body>
</html>