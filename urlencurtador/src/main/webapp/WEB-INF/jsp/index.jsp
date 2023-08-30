<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Encurtador de URL</title>
<script src="${pageContext.request.contextPath}/static/script/script.js"></script>
</head>
<body>
	<h1>Encurtador de URL</h1>

	<form action="/url/incluir" method="post">
		<label for="originalUrl">Url para alterar:</label> <input type="text"
			name="originalUrl" required> <label for="shortUrl">Url
			customizado:</label> <input type="text" name="shortUrl">

		<button type="submit">Criar</button>
	</form>

	<c:if test="${not empty mensagem}">
		<div class="alert alert-danger">
			<strong>Atenção!</strong> ${mensagem}
		</div>
	</c:if>

	<h2>URLs Encurtados</h2>
	<table>
		<tr>
			<th>URL Original</th>
			<th>URL Encurtado</th>
			<th>Acessos</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach var="url" items="${urls}">
			<tr>
				<td>${url.originalUrl}</td>
				<td><a href="${url.shortUrl}" target="_blank">${url.shortUrl}</a></td>
				<td>${url.accessCount}</td>
				<td>
                	<button class="btn btn-primary copy-button" data-url="${url.shortUrl}">Copiar</button>
                </td>
				<td>
					<form action="/url/excluir/${url.id}" method="get">
						<button class="btn btn-danger" type="submit">Excluir</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
