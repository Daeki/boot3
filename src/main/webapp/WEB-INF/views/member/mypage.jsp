<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="container">
	<h1>Detail Page</h1>
	
	<div class="row">
		<div class="card">
			<ul class="list-group list-group-flush">
			   	<li class="list-group-item">${member.id}</li>
		   		<li class="list-group-item">${vo.name} </li>
		   		<li class="list-group-item">${vo.email} </li>
		   		<li class="list-group-item">${vo.phone} </li>
			</ul>
		  
			
	    	
	    	<hr class="my-6">
	    		<h6>Photo</h6>
	    	
				<ul class="list-group list-group-flush">
				   	<li class="list-group-item">
				   		<a href="./fileDown?fileNum=${vo.memberFilesVO.fileName}">${vo.memberFilesVO.oriName}</a>
				   	</li>
				</ul>

    	 
		</div>
	
	</div>
	
</div>
	<div class="container my-4">
		<div class="col-2 d-flex">
			<a href="update" role="button" class="btn btn-success mx-1">Update</a>
			<a href="delete" role="button" class="btn btn-danger mx-1">Delete</a>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>