<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@ include file="Styles.jsp" %>

</head>
<body>
<div id="header">
<h1>Northeastern University</h1>
</div>

<%@ include file="StudentNav.jsp" %>

<div id="section">
<br>
<form action="viewStudent" method="post">
My Student Id: <input id="spanId" name="spanId" type="text" value="1">
<input type="submit" value="Submit">
</form>

</div>

<div id="footer">
Copyright © neu.edu
</div>


</body>
</html>