 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UPDATE RECORD</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css">
</head>
<body>

	<div class='common-content'>

		<img alt="oops..."
			src="${pageContext.request.contextPath}/resources/images/libimg4.jpg"
			id="bcgUpdateRecord">

		<div id="insideCommonContent_updateRecord">

			<form:form action="updateBookRecord" modelAttribute="bookRecord">

				<form:hidden path="bookId" />

				<label class="updateLabel labelBookName">Book Name:-</label>
				<form:input path="bookName" size="30"
					class="updateInput inputBookName" />
				<br>
				<br>
				<label class="updateLabel labelBookAuthor">Book Author:-</label>
				<form:input path="bookAuthor" size="30"
					class="updateInput inputBookAuthor" />
				<br>
				<br>
				<label class="updateLabel labelBookCost">Book Cost:-</label>
				<form:input path="bookCost" size="20" type="number"
					class="updateInput inputBookCost" />
				<br>
				<br>
				<label class="updateLabel labelBookCount">No. of books:-</label>
				<form:input path="noOfItems" size="20" type="number"
					class="updateInput inputNoOfItems" />
				<br>
				<br>
				<input type="submit" value="Update" class="btn btn-Update" />

			</form:form>

		</div>

	</div>

</body>
</html>