<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results</title>
</head>
<body>
	<h1>Here is the song you asked for!</h1>
	<c:forEach items="${artist}" var="song">
		<h3><c:out value="${song.title}"/></h3>
		<h3>Artist: <c:out value="${song.artist}"/></h3>
		<h3>Rating: <c:out value="${song.rating}"/></h3>
		<a href="/songs/${song.id}/edit"></a>
		<form action="/songs/${song.id}/delete" method="post">
		    <input type="submit" value="Delete">
		</form>
		</c:forEach>
</body>
</html>