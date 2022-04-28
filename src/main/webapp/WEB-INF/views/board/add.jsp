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
	
	
	<div class="row mt-4">
		<form action="add" method="post" enctype="multipart/form-data">
		  <div class="row mb-3">
		    <label for="title" class="col-sm-2 col-form-label">Title</label>
		    <div class="col-sm-10">
		      <input type="text" name="title" class="form-control" id="title">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="writer" class="col-sm-2 col-form-label">Writer</label>
		    <div class="col-sm-10">
		      <input type="text" value="${member.id}" readonly name="writer" class="form-control" id="writer">
		    </div>
		  </div>
		 <div class="row mb-3">
		    <label for="contents" class="col-sm-2 col-form-label">Contents</label>
		    <div class="col-sm-10">
		      <textarea name="contents" class="form-control" id="contents"></textarea>
		    </div>
		  </div>
		  
		
		<button id="fileAdd" type="button" class="btn btn-danger d-block my-4">FileADD</button>  
		  
		  
		<div id="fileResult">
			
		</div>
		 
		  <button type="submit" class="btn btn-primary">Write</button>
		</form>
	
	</div>
	
	
</div>	



<script type="text/javascript">
	$("#contents").summernote({
		height:400,
		placeholder:'내용을 입력하세요',
		callbacks: {
			onImageUpload:function(files){
				//files upload한 이미지 파일객체
				let formData = new FormData();
				formData.append("file", files[0]);

				// /board/summerFileUpload
	 			$.ajax({
					type:"POST",
					url:"./summerFileUpload",
					data:formData,
					contentType:false,
					processData:false,
					success:function(data){
						formData.delete(formData.get("file").name)
						console.log(formData.get("file").name);
						$("#contents").summernote('editor.insertImage', data.trim());
					}
					
				}); 
				
			},//onImageUpload 끝
			onMediaDelete:function(files){
				let fileName = $(files[0]).attr("src");
				console.log(fileName);
				$.ajax({
					type:"GET",
					url: "./summerFileDelete",
					data:{
						fileName:fileName
					},
					success:function(data){
						console.log(data);
					}
				});
			}//onMediaDelete 끝
		}
	});



	let count=0;

	$("#fileAdd").click(function() {
		if(count>4){
			alert('최대 5개만 가능');
			return;
		}
		let result = '<div class="input-group">';
		result = result + '<input name="files" type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">'
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