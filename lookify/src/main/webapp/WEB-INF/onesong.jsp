	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
		<title>details</title>
	</head>
	<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	<div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/songs/new">Add New</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/dashboard">Dashboard</a>
        </li>
        
      </ul>
      <form class="d-flex" action="/songs/search" method="POST">
        <input class="form-control me-2" type="search" placeholder="Artist" aria-label="Search">
        <button class="btn btn-outline-dark" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
		<h1>Here is the song details!</h1>
		<h3><c:out value="${song.title}"/></h3>
		<h3>Artist: <c:out value="${song.artist}"/></h3>
		<h3>Rating: <c:out value="${song.rating}"/></h3>
		<a href="/songs/${song.id}/edit"></a>
		<form action="/songs/${song.id}/delete" method="post">
		    <input type="submit" value="Delete">
		</form>
	</body>
</html>