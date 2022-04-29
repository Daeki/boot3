<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<!-- header -->
<c:import url="../temp/header.jsp"></c:import>
<div class="container">
	
	<div class="row">
		<c:import url="../common/productList.jsp"></c:import>
		<form action="./manage" id="frm">
			<input type="hidden" name="pn" id="pn" value="${pager.pn}">
		</form>
	</div>
	<div class="col-1">
		<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
	</div>
	
</div>	

<c:import url="../temp/header_script.jsp"></c:import>
<script type="text/javascript">
	$(".pager").click(function() {
		let pn = $(this).attr("pn");
		$("#pn").val(pn);
		$("#frm").submit();
	});
	
	
	$(".detail").click(function() {
		let num = $(this).attr("data-num");
		location.href="./manageDetail?productNum="+num;
	})
</script>
</body>
</html>