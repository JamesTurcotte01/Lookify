<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Dashboard</title>
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
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
        
      </ul>
      <form class="d-flex" action="/songs/search" method="POST">
        <input name="artist" class="form-control me-2" type="search" placeholder="Artist" aria-label="Search">
        <button class="btn btn-outline-dark" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
	<table class="table table-secondary table-striped">
    <thead>
        <tr>
            <th>Name</th>
            <th>artist</th>
            <th>rating</th>
            <th>action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${songs}" var="lang">
        <tr>
            <td><a href="songs/${lang.id}"><c:out value="${lang.title}"/></a></td>
            <td><c:out value="${lang.artist}"/></td>
            <td><c:out value="${lang.rating}"/></td>
            <td><form action="/songs/${lang.id}/delete"method="post"><input type="submit" value="Delete"></form></td>
    

        </tr>
        </c:forEach>
    </tbody>
</table> 
</body>
</html>