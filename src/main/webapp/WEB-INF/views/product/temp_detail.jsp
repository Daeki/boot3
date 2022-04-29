<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="container">
	<h1>Detail Page</h1>
	<div class="row">
		<c:forEach items="${vo.productFilesVOs}" var="fileVO">
			<img alt="" src="../resources/upload/product/${fileVO.fileName}">
		</c:forEach>
	
	</div>
	<div class="row">
		<div class="card">
			<ul class="list-group list-group-flush">
			   	<li class="list-group-item">${vo.productName}</li>
		   		<li class="list-group-item">${vo.id} </li>
			</ul>
		  
			<div class="card-body">
				${vo.productDetail}
	    	</div>
	    	    	 
		</div>
	
	</div> 
</div>