<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
div.scroll {
	height: 200px;
	overflow: auto;
}
</style>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>Students</h1>
			<p>An Institut Marianao application</p>
		</div>
		<c:if test="${not empty errors}">
			<div class="alert alert-danger alert-dismissible">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<c:forEach items="${errors}" var="error">
					<p>
						<strong> ${fn:toUpperCase(fn:substring(error.key, 0, 1))}${fn:toLowerCase(fn:substring(error.key, 1,fn:length(error.key)))}
						</strong> ${error.value}
					</p>
				</c:forEach>
			</div>
		</c:if>
		<h2>New ${cycle} register</h2>
		<form action="register" method="POST">
			<div class="row">
				<div class="col-md-4">
					<div class="input-group ${ not empty errors.dni?'has-error' : ''}">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-credit-card"></i>
						</span> <input id="dni" type="text" class="form-control" name="dni"
							placeholder="Dni" value="${student.dni}">
					</div>
					<div class="input-group ${not empty errors.name?'has-error ':''}">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-user"></i>
						</span> <input id="name" type="text" class="form-control" name="name"
							placeholder="Name" value="${student.name}">
					</div>
					<div
						class="input-group  ${not empty errors.surname?'has-error':''}">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-user"></i>
						</span> <input id="surname" type="text" class="form-control"
							name="surname" placeholder="Surname" value="${student.surname}">
					</div>
					<div class="input-group  ${not empty errors.email?'has-error':''}">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-envelope"></i>
						</span> <input id="email" type="text" class="form-control" name="email"
							placeholder="Email" value="${student.email}">
					</div>
				</div>
				<div class="col-md-6">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-education"></i>
						</span> <input id="cycle" type="text" class="form-control" name="cycle"
							value="${cycle}" readonly="readonly">
					</div>
					<div class="input-group ${not empty errors.modules?'has-error':''}">
						<span class="input-group-addon "> <i
							class="glyphicon glyphicon-list-alt"></i>
						</span>
						<div class="scroll form-control ">
							<c:forEach items="${modules}" var="module" varStatus="status">
								<div class="checkbox">
									<label> <input type="checkbox" name="modules"
										value="${module.code}"
										${student.modules.contains(module)?'checked="checked"':''}>
										${module.code} ${module.name}
									</label>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="row center-block">
				<div class="col-md-12 ">
					<c:url value="students" var="href">
					</c:url>
					<a href="${href}" class="btn">Cancel</a>
					<button type="submit" class="btn ">Submit</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>