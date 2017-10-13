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
<form name="AddCourse" action="addCourse" method="post">
<table>
<tr>
<td>Course Number</td> 
<td> <input type="text" name="courseNo"></td>
</tr>
<tr>
<td>Course Title</td>
<td> <input type="text" name="courseTitle"></td>
</tr>
<tr>
<td> Course Level </td>
<td> <input type="text" name="courseLevel"></td>
</tr>
<tr>
<td> Description </td>
<td> <input type="text" name="description"> </td>
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
create table Course
	(
	id int primary key auto_increment,
	courseNumber varchar(8) unique,
	title varchar(255),
	courseLevel varchar(255),
    description longtext,
	department int,
	foreign key (department) references Department(id) 
		on update cascade on delete no action
);
 -->