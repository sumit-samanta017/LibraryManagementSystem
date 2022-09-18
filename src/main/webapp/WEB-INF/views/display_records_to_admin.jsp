<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books records</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css">
</head>
<body>

	<div class='common-content'>

		<img alt="oops..."
			src="${pageContext.request.contextPath}/resources/images/libimg2.jpg"
			id="bcgDisplayRecordToAdmin">

		<button type="submit"
			onclick="window.location.href='${pageContext.request.contextPath}'"
			class="btn btn-signOut btn-SignOut-ForAdmin">Sign Out</button>

		<div class="adjust-table-for-admin">

			<h2 style="color: red;">${msg}</h2>

			<h1
				style="text-decoration: underline; text-shadow: 2px 2px gray; color: teal; font-size: 50px;">LIBRARY
				BOOKS</h1>

			<table class="center-table">

				<thead>
					<tr class="adminTableRow headerRow">
						<th style="text-align: center;">Book Name</th>
						<th>Book Author</th>
						<th>Book Cost</th>
						<th>Book Count</th>
						<th>Update Record</th>
						<th>Delete Record</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="book" items="${bookRecordsFromDB}">
						<tr class="adminTableRow dataRow">
							<td>${book.bookName}</td>
							<td>${book.bookAuthor}</td>
							<td>${book.bookCost}</td>
							<td>${book.noOfItems}</td>
							<td><a
								href="<c:url value='updateRecord/${book.bookId }' />">Update</a></td>
							<td><a href="<c:url value='deleteRecord/${book.bookId}' />"
								onclick="return confirm('Are you sure you want to delete this record?')">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<br> <br> <br>

			<h4>
				<a
					href="${pageContext.request.contextPath}/chooseUser?userType=admin"
					style="font-size: 18px;"> (-: Go back to Admin action page</a>
			</h4>

		</div>

	</div>

</body>
</html>