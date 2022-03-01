<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %> <!--Unicamente para update-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Read Share</title>
		<!--BOOTSTRAP-->
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	</head>
	<body>
		<div class="container">
			<header class="row">
				<div class="col-8">
					<h1 class="text-primary">Welcome, <c:out value="${usuario.getName()}"></c:out></h1>
					<p>Books from everyone's shelves:</p>
					
				</div>
				<div class="col-4">
					<a href="/logout" class="d-block btn btn-link text-end">Log out</a>
					<a href="/books/new" class="d-block btn btn-link text-end">+ Add to my shelf!</a>
				</div>
			</header>
			<main class="row">
				<div class="table-container">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Title</th>
								<th scope="col">Author Name</th>
								<th scope="col">Posted By</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="libro" items="${libros}">
								<th scope="row"><c:out value="${libro.getId()}"></c:out></th>
								<th scope="row"><a href="/books/${libro.getId()}" class="btn btn-link"><c:out value="${libro.getTitulo()}"></c:out></a></th>
								<th scope="row"><c:out value="${libro.getAutor()}"></c:out></th>
								<th scope="row"><c:out value="${libro.getUser().getName()}"></c:out></th>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</main>
		</div>
		
		<!--BOOTSTRAP-->
		<script src="/webjars/jquery/jquery.min.js"></script>
		<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>