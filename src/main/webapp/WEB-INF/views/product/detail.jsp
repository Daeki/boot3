<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<c:import url="./temp_detail.jsp"></c:import>

<div class="container">
	<%-- <h1><spring:message code="product.detail.info" arguments="${vo.productPrice},${vo.productCount}" argumentSeparator=","></spring:message> </h1> --%>
</div>

<div class="container">
	<div class="row">
		<button type="button" id="cart" data-pn="${vo.productNum}" class="btn btn-danger">장바구니</button>
	</div>
</div>

<script type="text/javascript" src="../resources/js/cart.js"></script>

</body>
</html>