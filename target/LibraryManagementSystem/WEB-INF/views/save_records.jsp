<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Save Records</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style1.css">
</head>
<body>

<c:url var="goToAdmin" value="chooseUser">
<c:param name="userType" value="admin" />
</c:url>

	<div id='save_page' class='common-content'>
		<h2>Record successfully saved to database</h2>
		<h3>Want to add more books?</h3>
		<span><a href="${pageContext.request.contextPath}/addRecord" onclick="return confirm('Are you sure you want to add more books?');">Yes</a></span><span>|</span><span><a
			href="${goToAdmin}">No</a></span>
	</div>

</body>
</html>