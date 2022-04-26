<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:import url="../temp/header_css.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
 
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
	<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="container mt-4">
	<div class="row mt-4">
		<div class="alert alert-light" role="alert">
	  		<h4 style="text-transform: uppercase;">${board} Write</h4>
		</div>
	</div>
	
	<div class="row" id="list">
		<!-- 상품 리스트  ajax, name, price, count-->
		
	</div>
	
	
	<div class="row mt-4">
		<form action="add" method="post" enctype="multipart/form-data">
		  <div class="row mb-3">
		    <label for="productName" class="col-sm-2 col-form-label">Name</label>
		    <div class="col-sm-10">
		      <input type="text" name="productName" class="form-control" id="productName">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="productPrice" class="col-sm-2 col-form-label">Price</label>
		    <div class="col-sm-10">
		      <input type="text" name="productPrice" class="form-control" id="productPrice">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="productCount" class="col-sm-2 col-form-label">수량</label>
		    <div class="col-sm-10">
		      <input type="text" name="productCount" class="form-control" id="productCount">
		    </div>
		  </div>		  
		  
		 <div class="row mb-3">
		    <label for="productDeatil" class="col-sm-2 col-form-label">상세설명</label>
		    <div class="col-sm-10">
		      <textarea name="productDetail" class="form-control" id="productDetail"></textarea>
		    </div>
		  </div>
		  
		
		<button id="fileAdd" type="button" class="btn btn-danger d-block my-4">FileADD</button>  
		  
		  
		<div id="fileResult">
			
		</div>
		 
		  <button type="button" id="add" class="btn btn-primary">Write</button>
		</form>
	
	</div>
	
	
</div>	


<script type="text/javascript">
	//
	//let pn=1;
	$("#list").on("click", ".pager", function() {
		let checkPn=$(this).attr("data-pn");
		if(checkPn > 0){
			//pn=checkPn;
			getList(checkPn);
		}else {
			//이전 또는 다음 Block이 X
			alert("마지막 페이지 입니다");
		}
	})


	//list ajax url:ajaxList, Get
	getList(1);
	
	function getList(pn){
		console.log("start");
		$.ajax({
			type:"GET",
			url:"./ajaxList",
			data:{
				pn:pn,
				perPage:5
			},
			success:function(data){
				$("#list").html(data.trim());
			}
		});
	}
	

	//add
	$("#add").click(function() {
		let formData = new FormData();
		let productName = $("#productName").val();
		let productPrice = $("#productPrice").val();
		let productCount = $("#productCount").val();
		let productDetail = $("#productDetail").summernote("code"); //$("#productDetail").val();
		$(".files").each(function(idx, item) {
			if(item.files.length>0){
				console.log(idx); 				//index번호
				console.log(item);              //<input type="file">
				console.log(item.files);        //input 태그의 file List
				console.log(item.files[0]);     //files list중 첫번째 파일
				console.log("lenth : ", item.files.length);
				console.log(item.files[0].name) //files list중 첫번째 파일의 이름
				//formData.append("파라미터명", 값);
				formData.append("files", item.files[0]);
			}
		});//each 끝
		
		formData.append("productName", productName);
		formData.append("productPrice", productPrice);
		formData.append("productCount", productCount);
		formData.append("productDetail", productDetail);
		
		
 		$.ajax({
			type:"POST",
			url:"./add",
		    processData: false,
		    contentType: false,
			data:formData /* {
				productName: productName,
				productPrice:productPrice,
				productCount:productCount,
				productDetail:productDetail
			} */,
			success:function(data){
				if(data.trim()=='1'){
					alert("상품 등록 완료");
					getList();
					$("#productName").val("");
					$("#productPrice").val("");
					$("#productCount").val("");
					$("#productDetail").summernote("code", ""); //$("#productDetail").val("");
				}else {
					alert("상품 등록 실패");
				}
				
			},
			error:function(){
				alert("error 발생");
			}
		}); 
		
	});

	//summernote
	 $('#productDetail').summernote({
		 height: 400
	 });


	let count=0;

	$("#fileAdd").click(function() {
		if(count>4){
			alert('최대 5개만 가능');
			return;
		}
		let result = '<div class="input-group">';
		result = result + '<input name="files" type="file" class="form-control files" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">'
		result = result + '<button class="btn btn-outline-secondary del" type="button" id="inputGroupFileAddon04">X</button>'
		result = result + '</div>';
		$("#fileResult").append(result);
		count++;
	});
	
	$("#fileResult").on("click", ".del", function() {
		$(this).parent().remove();
		count--;
	} );
	
	
	
</script>
</body>
</html>