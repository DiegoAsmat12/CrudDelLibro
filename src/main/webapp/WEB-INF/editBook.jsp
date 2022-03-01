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
			<header class="row d-flex justify-content-between">
				<h1>Change your Entry</h1>
				<a class="btn btn-link" href="/books">back to the shelves</a>
			</header>
			<main class="row">
				<form:form method="post" action="/books/${libro.getId()}" modelAttribute="libro">
					<input type="hidden" name="_method" value="put"/>
					<form:errors class="d-block alert alert-danger"></form:errors>
					<form:errors path="titulo" class="d-block alert alert-danger"></form:errors>
					<form:errors path="autor" class="d-block alert alert-danger"></form:errors>
					<form:errors path="pensamiento" class="d-block alert alert-danger"></form:errors>
					<form:hidden path="id" value="${libro.getId()}"/>
					<div class="form-group mb-3">
						<form:label path="titulo">Title:</form:label>
						<form:input path="titulo" class="form-control"/>
					</div>
					<div class="form-group mb-3">
						<form:label path="autor">Author:</form:label>
						<form:input path="autor" class="form-control"/>
					</div>
					<div class="form-group mb-3">
						<form:label path="pensamiento">My Thoughts:</form:label>
						<form:textarea path="pensamiento" class="form-control" rows="5"/>
					</div>
					<button type="submit" class="btn btn-primary">Edit</button>
				</form:form>
			</main>
		</div>
		
		<!--BOOTSTRAP-->
		<script src="/webjars/jquery/jquery.min.js"></script>
		<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>