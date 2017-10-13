<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="Styles.jsp" %>

<%@ include file="StudentNav.jsp" %>

</head>
<body>
<form action="updateStudent" method="post">
<br>
Name
<input type="text" name="name">
<br>
Address
<input type="text" name="address">
<br>
Phone No
<input type="text" name="phone">
<br>
<input type="submit" value="Submit">
<br>
</form>
</body>
</html>