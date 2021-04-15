<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Create</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	<div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
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
	<h2>New Song</h2>
	<div class="mb-3">
<form:form action="/songs" method="post" modelAttribute="song">
    <p>
        <form:label for="exampleFormControlInput1" class="form-label" path="title">Title</form:label>
        <form:errors path="title"/>
        <form:input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" path="title"/>
    </p>
    <p>
        <form:label for="exampleFormControlInput1" class="form-label" path="artist">Artist</form:label>
        <form:errors path="artist"/>
        <form:input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" path="artist"/>
    </p>
    <p>
        <form:label for="exampleFormControlInput1" class="form-label" path="rating">Rating</form:label>
        <form:errors path="rating"/>     
        <form:input class="form-control" id="exampleFormControlInput1" placeholder="" type="rating" path="rating"/>
    </p>    
    <input type="submit" value="Submit"/>
</form:form> 
</div>    
</body>
</html>