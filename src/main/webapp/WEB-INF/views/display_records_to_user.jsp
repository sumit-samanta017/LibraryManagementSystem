<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books collections</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css">
</head>
<body>

	<%!String generateUniqueID() {

        String hashingString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$^&*";
        int index;

        String uniqueHash = "";

        for (int i = 0; i < 10; i++) {
            index = (int) (Math.random() * 100) % hashingString.length();
            uniqueHash += hashingString.charAt(index);
        }

        return uniqueHash;

    }%>


	<div class='common-content'>

		<img alt="oops..."
			src="${pageContext.request.contextPath}/resources/images/bookImg1.jpg"
			id="bcgDisplayRecordsToUser">

		<button type="submit"
			onclick="window.location.href='${pageContext.request.contextPath}'"
			class="btn btn-signOut btn-SignOut-ForUser">Sign Out</button>

		<div id="adjust-table-for-user">

			<h2 style="color: red;">${msg1}</h2>

			<h1
				style="text-decoration: underline; text-shadow: 2px 2px gray; color: orange; font-size: 50px;">BOOK
				COLLECTIONS</h1>

			<table class="center-table">

				<thead>
					<tr>
						<th style="text-align: center;">Book Name</th>
						<th>Book Author</th>
						<th>Issue Book(s)</th>
						<th>Return Book(s)</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="book" items="${bookRecords }">
						<tr>
							<td>${book.bookName }</td>
							<td>${book.bookAuthor }</td>
							<td><button type="submit" id="btn-issue"
									onclick="window.location.href='issueBook/<%= generateUniqueID() %>'+${book.bookId}">Issue</button></td>
							<td><button type="submit" id="btn-return"
									onclick="window.location.href='returnBook/<%= generateUniqueID() %>'+${book.bookId} ">Return</button></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

		</div>

	</div>

</body>
</html>