<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.ArrayList"%>
    <%@page import="java.util.Iterator"%>
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
<form name="AddInstructor" action="addInstructor" method="post">
<table>
<tr>
<td>First Name</td> 
<td> <input type="text" name="fName"></td>
</tr>
<tr>
<td> Last Name </td>
<td> <input type="text" name="lName"></td>
</tr>
<tr>
<td> Email </td>
<td> <input type="text" name="email"></td>
</tr>
<tr>
<td> Department </td>
<td>
<select name="department">
<% 
if(request.getAttribute("departments")!=null)
{
	ArrayList<Integer> departments = (ArrayList<Integer>)request.getAttribute("departments");
	Iterator<Integer> iterator = departments.iterator();
	while(iterator.hasNext())
	{
		Integer department = iterator.next();
		%>
		<option value = "<%=department%>"><%=department%></option>
		<% } %>
</select>
	<%
}
%>
</td></tr>
<tr>
<td> UserName </td>
<td> <input type="text" name="username"> </td>
</tr>
<tr><td style="text-align:center">
<input type="submit" value="Submit"></td></tr>
</table>
</form>
</div>

<div id="footer">
Copyright © neu.edu
</div>
</body>
</html>
<!--  
create table Instructor
(
	id int primary key auto_increment,
	fName varchar(255) not null,
	lName varchar(255) not null,
    email varchar(255) unique,
	department integer,
	username varchar(255) unique
);-->