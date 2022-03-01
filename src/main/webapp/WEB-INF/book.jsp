<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %> <!--Unicamente para update-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!--BOOTSTRAP-->
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	</head>
	<body>
		<div class="container">
			<header class="row d-flex justify-space-between">
				<h1><c:out value="${libro.getTitulo()}"></c:out></h1>
				<a href="/books" class="btn btn-link">Back to the Shelves</a>
			</header>
			<main class="row">
				<c:choose>
					<c:when test="${id != libro.getUser().getId()}">
						<h3>
							<span class="text-danger"><c:out value="${libro.getUser().getName()}"></c:out></span> read 
							<span class="text-primary"><c:out value="${libro.getTitulo()}"></c:out></span> by
							<span class="text-success"><c:out value="${libro.getAutor()}"></c:out></span>
						</h3>
						<h3>Here are <c:out value="${libro.user.getName()}"></c:out>'s thoughts:</h3>
					</c:when>
					<c:otherwise>
						<h3>
							You read <span class="text-primary"><c:out value="${libro.getTitulo()}"></c:out></span> by
							<span class="text-success"><c:out value="${libro.getAutor()}"></c:out></span></h3>
						<h3>Here are your thoughts:</h3>
					</c:otherwise>
				</c:choose>
				<div class="card">
					<div class="card-body">
						<p><c:out value="${libro.getPensamiento()}"></c:out></p>
					</div>
				</div>
				<c:if test="${id == libro.user.getId()}">
					<a href="/books/${libro.getId()}/edit" class="btn btn-primary">Editar</a>
				</c:if>
			</main>
		</div>
		
		<!--BOOTSTRAP-->
		<script src="/webjars/jquery/jquery.min.js"></script>
		<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>