<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign A Grade</title>

<%@ include file="Styles.jsp" %>

</head>
<body>
	<div id="header">
		<h1>Northeastern University</h1>
	</div>


<%@ include file="InstructorNav.jsp" %>

	<div id="section">
		
		

		<form action="assignGrade" method="post">
			<br>
			<table>
				<tr>
					<td>Enter StudentID</td>
					<td><input type="text" name="student"></td>
				</tr>
				
				<tr>
					<td>Enter SectionID</td>
					<td><input type="text" name="section"></td>
				</tr>
				<tr>
					<td>Assign Grade</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td style="text-align: center">
					<input type="submit" value="Submit"></td>
				</tr>
			</table>
			<br>
		</form>



	</div>

	<div id="footer">Copyright © neu.edu</div>
</body>
</html>