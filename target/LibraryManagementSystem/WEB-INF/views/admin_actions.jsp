<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Actions</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css">
</head>
<body>
	<div class='common-content'>
		<img alt="oops..."
			src="${pageContext.request.contextPath}/resources/images/libimg3.jpg"
			id="bcgAdminAction">

		<div id="inside_adminAction">

			<h2 id="adminAction_header">Types of actions to be performed</h2>
			<br>
			<button type="button" class="btn btn-add"
				onclick="window.location.href='addRecord' ">Add Record</button>
			<br> <br>
			<button type="button" class="btn btn-display"
				onclick="window.location.href='displayRecord' ">Display
				record</button>
			<br> <br>
			
		</div>
	</div>
</body>
</html>