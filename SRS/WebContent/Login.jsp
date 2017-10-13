<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<%@ include file="Styles.jsp" %>

</head>
<body>
	<div id="header">
		<h1>Northeastern University</h1>
	</div>
	<br>
	<div id="section">
		<form action="login" method="post">
			<br>
			<table>
				<tr>
					<td>UserId</td>
					<td><input type="text" name="username"></td>
				</tr>
				<br>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td style="text-align: center"><input type="submit"
						value="Submit"></td>
				</tr>
			</table>
			<br>
		</form>
	</div>


</body>
</html>

