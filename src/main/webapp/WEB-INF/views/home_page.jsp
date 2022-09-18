<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Choose User Type</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style1.css">
</head>
<body class="same" id="homePageBody">

	<img alt="oops..."
		src="${pageContext.request.contextPath}/resources/images/usertype.jpg"
		id="bcgImgHome">

	<div class='container1'>

		<form action="chooseUser">
			<label>Admin</label><input type="radio" name="userType" value="admin"
				class="radioBtn"><br> <br> 
			<label>User&nbsp;</label><input
				type="radio" name="userType" value="user" class="radioBtn"><br>
			<br>
			<button type="submit" value="Proceed" id="submitButton">
				<span>Proceed</span>
			</button>
		</form>

	</div>

</body>
</html>