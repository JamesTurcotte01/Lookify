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
<title>Top Ten</title>
</head>
<body>
<table>
	<tbody>
        <c:forEach items="${songs}" var="lang">
        <tr>
            <td><a href="songs/${lang.id}"><c:out value="${lang.title}"/></a></td>
            <td><c:out value="${lang.artist}"/></td>
            <td><c:out value="${lang.rating}"/></td>
            <td><form action="/songs/${lang.id}/delete"method="post"><input type="submit" value="Delete"></form><form action="/songs/${lang.id}/edit"method="post"><input type="submit" value="Edit"></form></td>
    

        </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>