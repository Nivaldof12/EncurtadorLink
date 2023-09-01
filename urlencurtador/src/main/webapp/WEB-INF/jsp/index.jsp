<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="preconnect" href="https://fonts.googleapis.com" />

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&display=swap"
	rel="stylesheet" />

<title>Encurtador de URL</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/global.css">
<script src="${pageContext.request.contextPath}/static/script/script.js"></script>
<link rel="icon"
	href="${pageContext.request.contextPath}/static/img/favicon.png"
	type="image/x-icon">
</head>
<body>
	<div class="container">
		<header>
			<div class="left">
				<a href="#" class="logo"> <img
					src="${pageContext.request.contextPath}/static/img/logo.png"
					alt="Localhost" />
				</a>
			</div>
		</header>

		<main>
			<div class="hero">
				<h1>Mais do que apenas um encurtador de URL</h1>
				<p>Crie links personalizados e tenha o controle de quantas vezes
					a sua URL foi acessada.</p>
				<a href="#">Criar Link</a>
			</div>
			<div class="hero-image">
				<img src="${pageContext.request.contextPath}/static/img/main.png"
					alt="Mulher trabalhando" />
			</div>
		</main>

		<c:if test="${not empty mensagem}">
			<div class="error">
				<div class="error__icon">
					<svg xmlns="http://www.w3.org/2000/svg" width="24"
						viewBox="0 0 24 24" height="24" fill="none">
						<path fill="#393a37"
							d="m13 13h-2v-6h2zm0 4h-2v-2h2zm-1-15c-1.3132 0-2.61358.25866-3.82683.7612-1.21326.50255-2.31565 1.23915-3.24424 2.16773-1.87536 1.87537-2.92893 4.41891-2.92893 7.07107 0 2.6522 1.05357 5.1957 2.92893 7.0711.92859.9286 2.03098 1.6651 3.24424 2.1677 1.21325.5025 2.51363.7612 3.82683.7612 2.6522 0 5.1957-1.0536 7.0711-2.9289 1.8753-1.8754 2.9289-4.4189 2.9289-7.0711 0-1.3132-.2587-2.61358-.7612-3.82683-.5026-1.21326-1.2391-2.31565-2.1677-3.24424-.9286-.92858-2.031-1.66518-3.2443-2.16773-1.2132-.50254-2.5136-.7612-3.8268-.7612z"></path></svg>
				</div>
				<div class="error__title">
					<strong>Atenção!</strong> ${mensagem}
				</div>
			</div>
		</c:if>

		<form action="/url/incluir" method="post">
			<input type="text" placeholder="Link que deseja encurtar..."
				name="originalUrl" required /> <input type="text"
				placeholder="nome que deseja personalizar... (Opcional)"
				name="shortUrl" />
			<button type="submit">Criar</button>
		</form>

		<table class="styled-table">
			<thead>
				<tr>
					<th>URL Original</th>
					<th>Acessos</th>
					<th>URL Encurtado</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<c:forEach var="url" items="${urls}">
				<tbody>
					<tr class="active-row">
						<td>${url.originalUrl}</td>
						<td>${url.accessCount}</td>
						<td><a href="${url.shortUrl}" target="_blank">${url.shortUrl}</a></td>
						<td>
						<button class="copy copy-button" data-url="${url.shortUrl}">
						  <span data-text-end="Link Copiado!" data-text-initial="Copiar link" class="tooltip"></span>
						  <span>
						    <svg xml:space="preserve" style="enable-background:new 0 0 512 512" viewBox="0 0 6.35 6.35" y="0" x="0" height="20" width="20" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xmlns="http://www.w3.org/2000/svg" class="clipboard">
						      <g>
						        <path fill="currentColor" d="M2.43.265c-.3 0-.548.236-.573.53h-.328a.74.74 0 0 0-.735.734v3.822a.74.74 0 0 0 .735.734H4.82a.74.74 0 0 0 .735-.734V1.529a.74.74 0 0 0-.735-.735h-.328a.58.58 0 0 0-.573-.53zm0 .529h1.49c.032 0 .049.017.049.049v.431c0 .032-.017.049-.049.049H2.43c-.032 0-.05-.017-.05-.049V.843c0-.032.018-.05.05-.05zm-.901.53h.328c.026.292.274.528.573.528h1.49a.58.58 0 0 0 .573-.529h.328a.2.2 0 0 1 .206.206v3.822a.2.2 0 0 1-.206.205H1.53a.2.2 0 0 1-.206-.205V1.529a.2.2 0 0 1 .206-.206z"></path>
						      </g>
						    </svg>
						    <svg xml:space="preserve" style="enable-background:new 0 0 512 512" viewBox="0 0 24 24" y="0" x="0" height="18" width="18" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xmlns="http://www.w3.org/2000/svg" class="checkmark">
						      <g>
						        <path data-original="#000000" fill="currentColor" d="M9.707 19.121a.997.997 0 0 1-1.414 0l-5.646-5.647a1.5 1.5 0 0 1 0-2.121l.707-.707a1.5 1.5 0 0 1 2.121 0L9 14.171l9.525-9.525a1.5 1.5 0 0 1 2.121 0l.707.707a1.5 1.5 0 0 1 0 2.121z"></path>
						      </g>
						    </svg>
						  </span>
						</button>
						</td>
						<td><a href="/url/excluir/${url.id}"><img
					src="${pageContext.request.contextPath}/static/img/delete.png"
					alt="delete" /></a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>
