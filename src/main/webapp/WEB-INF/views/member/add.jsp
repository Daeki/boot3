<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<div class="container mt-4">
		<div class="row mt-4">
			<div class="alert alert-light" role="alert">
				<h4 style="text-transform: uppercase;">${board}Join</h4>
			</div>
		</div>


		<div class="row mt-4">
			<form action="add" method="post" enctype="multipart/form-data">
				<div class="row mb-3">
					<label for="id" class="col-sm-2 col-form-label">ID</label>
					<div class="col-sm-10">
						<input type="text" name="id" class="form-control" id="id">
					</div>
				</div>

				<div class="row mb-3">
					<label for="pw" class="col-sm-2 col-form-label">Password</label>
					<div class="col-sm-10">
						<input type="password" name="pw" class="form-control" id="pw">
					</div>
				</div>


				<div class="row mb-3">
					<label for="checkPw" class="col-sm-2 col-form-label">Password</label>
					<div class="col-sm-10">
						<input type="password" name="checkPw" class="form-control"
							id="checkPw">
					</div>
				</div>

				<div class="row mb-3">
					<label for="name" class="col-sm-2 col-form-label">Name</label>
					<div class="col-sm-10">
						<input type="text" name="name" class="form-control" id="name">
					</div>
				</div>

				<div class="row mb-3">
					<label for="Email" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10">
						<input type="email" name="email" class="form-control" id="email">
					</div>
				</div>

				<div class="row mb-3">
					<label for="phone" class="col-sm-2 col-form-label">Phone</label>
					<div class="col-sm-10">
						<input type="text" name="phone" class="form-control" id="phone">
					</div>
				</div>
				<div class="row mb-3">
					<label for="files" class="col-sm-2 col-form-label">File</label>
					<div class="col-sm-10">
						<input type="file" name="files" class="form-control" id="files">
					</div>
				</div>

				<button type="submit" class="btn btn-primary">Join</button>
			</form>

		</div>

		<div class="row mt-4">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value=""	id="all"> 
				<label class="form-check-label"	for=all> checkbox-ALL </label>
			</div>
			<div class="form-check">
				<input class="form-check-input ch" type="checkbox" value=""	id="check1">
				<label class="form-check-label"	for="check1"> checkbox2 </label>
			</div>
			<div class="form-check">
				<input class="form-check-input ch" type="checkbox" value=""	id="check2"> 
				<label class="form-check-label"	for="check2"> checkbox3 </label>
			</div>
			<div class="form-check">
				<input class="form-check-input ch" type="checkbox" value=""	id="check3"> 
				<label class="form-check-label"	for="check3"> checkbox4 </label>
			</div>

		</div>


	</div>


	<c:import url="../temp/header_script.jsp"></c:import>
	<script type="text/javascript">
		$("#all").click(function(){
			$(".ch").prop("checked", $("#all").prop("checked"));
			
		});
		
		$(".ch").on("click", function() {
			let check= true;
			
			$(".ch").each(function(idx, item) {
				if(!$(item).prop("checked")){
					check=false;
				}
			});
			
			$("#all").prop("checked", check);
			
		});
	
	</script>
</body>
</html>