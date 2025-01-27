<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
<script type="text/javascript">
	function changeDni(dni, dniHref) {
		document.getElementById("dni").innerHTML = "Are you sure you wish to delete student with dni=<strong>"
				+ dni + "</strong>?";
		document.getElementById("dniHref").href = dniHref;
	}
</script>
<style type="text/css">
</style>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>Students</h1>
			<p>An Institut Marianao application</p>
		</div>
		<ul class="list-inline">
			<c:forEach items="${cycles}" var="cycle">
				<c:url value="register" var="href">
					<c:param name="cycle" value="${cycle.code}" />
				</c:url>
				<li><a href="${href}" class="btn "> <span
						class="glyphicon glyphicon-plus"> </span> New ${cycle.code} register
				</a></li>
			</c:forEach>
		</ul>
		<h2>Students</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Dni</th>
						<th>Name</th>
						<th>Surname</th>
						<th>Email</th>
						<th>Cycle</th>
						<th>Modules</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${students}" var="student">
						<tr>
							<td>${student.dni}</td>
							<td>${student.name}</td>
							<td>${student.surname}</td>
							<td>${student.email}</td>
							<td>${student.cycle}</td>
							<td>
								<ul class="small">
									<c:forEach items="${student.modules}" var="module">
										<li>${module.code} ${module.name}</li>
									</c:forEach>
								</ul>
							</td>
							<td><c:url value="remove" var="href">
									<c:param name="dni" value="${student.dni}" />
								</c:url>
								<button type="button" class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#confirm"
									onclick="changeDni('${student.dni}','${href}')"
									data-backdrop="true">
									<span class="glyphicon glyphicon-remove"> </span>Remove
								</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Modal -->
	<div id="confirm" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Confirm remove</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<p id="dni">99999999X</p>
				</div>
				<div class="modal-footer">
					<a id="dniHref" class="btn btn-danger" href="#"><span
						class="glyphicon glyphicon-remove"> </span>Remove</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
