<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="Styles.jsp" %>

</head>
<body>
<div id="header">
<h1>Northeastern University</h1>
</div>

<%@ include file="AdminNav.jsp" %>

<div id="section">
<br>
<form name="AddNewInstructor" action="addNewInstructor" method="post">
<input type="submit" value="Add New Instructor">
</form>
</div>

<div id="footer">
Copyright © neu.edu
</div>
</body>
</html>