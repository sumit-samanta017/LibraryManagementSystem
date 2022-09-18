<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Issue Book</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style3.css">
</head>
<body>

	<div class='common-content'>

		<img alt="oops..."
			src="${pageContext.request.contextPath}/resources/images/libimg5.jpg"
			id="bcgIssueRecord">

		<form:form action="${pageContext.request.contextPath}/issueSelectedBook" modelAttribute="bookToBeIssued">

			<div id="inside_issueBookForm">

				<h2 style="color: red;">${msg}</h2>
				
				<form:hidden path="bookId" />

				<h3>
					<label class="label_issueRec label_issue_nameOfBook"> Book
						Name:- </label>
					<form:input path="bookName" readonly="true" size="50"
						class="disabledInputBox disabledInputBox_bookName" />
				</h3>

				<h3>
					<label class="label_issueRec label_issue_authorOfBook">
						Book Author:- </label>
					<form:input path="bookAuthor" readonly="true" size="50"
						class="disabledInputBox disabledInputBox_bookAuthor" />
				</h3>

				<h3>
					<label class="label_issueRec label_issue_costOfBook"> Book
						Cost:- </label>
					<form:input path="bookCost" readonly="true" size="30"
						class="disabledInputBox disabledInputBox_bookCost" />
				</h3>

				<h3>
					<label class="label_issueRec label_issue_numberOfBooksPresent">
						Number of books present:- </label>
					<form:input path="noOfItems" readonly="true"
						class="disabledInputBox disabledInputBox_bookCount" />
				</h3>

				<h3>
					<label class="label_issueRec label_issue_numberOfBooksToBeIssued">Number
						of books to be issued:- </label>
					<form:input path="noOfBookIssued" type="number"
						id="issueNoOfBooksInputBox" />
				</h3>

				<h3>
					<input type="submit" value="ISSUE BOOK" class="btn btn-issueRecord">
				</h3>

			</div>

		</form:form>
	</div>

</body>
</html>