<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD BOOK RECORDS</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css">
</head>
<body>

	<div class='common-content'>

		<img alt="oops..."
			src="${pageContext.request.contextPath}/resources/images/img1.jpg"
			id="bcgAddRecord">

		<form action="saveRecord" method="post">

			<div id="inside_form_addrecord">

				<p style="color: red">${message}</p>

				<h3>
					<label class="label_addRec label_nameOfBook">Name of the
						book:- </label> <input type="text" name="bookName" size="50"
						class="inputBox inputBox_bookName">
				</h3>

				<h3>
					<label class="label_addRec label_authorOfBook">Book
						Author:-</label> <input type="text" name="bookAuthor" size="50"
						class="inputBox inputBox_bookAuthor">
				</h3>

				<h3>
					<label class="label_addRec label_costOfBook">Cost(in Rs.):-
					</label> <input type="number" name="bookCost" size="30"
						class="inputBox inputBox_bookCost">
				</h3>

				<h3>
					<label class="label_addRec label_numberOfBook">Number of
						books:- </label> <input type="number" name="noOfItems" size="30"
						class="inputBox inputBox_bookCount">
				</h3>

				<h3>
					<button type="submit" class="btn btn-saveRecord">Save
						Record</button>
				</h3>

			</div>

		</form>

	</div>

</body>
</html>