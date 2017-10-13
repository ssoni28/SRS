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
<form name="AddStudent" action="addStudent" method="post">
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
<td> Major </td>
<td>
<select name="major">
<% 
if(request.getAttribute("majors")!=null)
{
	ArrayList<Integer> majors = (ArrayList<Integer>)request.getAttribute("majors");
	Iterator<Integer> iterator = majors.iterator();
	while(iterator.hasNext())
	{
		Integer major = iterator.next();
		%>
		<option value = "<%=major%>"><%=major%></option>
		<% } %>
</select>
	<%
}
%>
</td></tr>
<tr>
<td> Address1 </td>
<td> <input type="text" name="address1"> </td>
</tr>
<tr>
<td> Address2 </td>
<td> <input type="text" name="address2"> </td>
</tr>
<tr>
<td> Address3 </td>
<td> <input type="text" name="address3"> </td>
</tr>
<tr>
<td> City </td>
<td> <input type="text" name="city"> </td>
</tr>
<tr>
<td> State </td>
<td> <input type="text" name="state"> </td>
</tr>
<tr>
<td> Postal </td>
<td> <input type="text" name="postal"> </td>
</tr>
<tr>
<td> Country </td>
<td> <input type="text" name="country"> </td>
</tr>
<tr>
<td> Phone Number </td>
<td> <input type="text" name="phone"> </td>
</tr>
<tr>
<td> Advisor </td>
<td>
<select name="advisor">
<% 
if(request.getAttribute("result")!=null)
{
	ArrayList<Integer> advisors = (ArrayList<Integer>)request.getAttribute("result");
	Iterator<Integer> iterator = advisors.iterator();
	while(iterator.hasNext())
	{
		Integer advisor = iterator.next();
		%>
		<option value = "<%=advisor%>"><%=advisor%></option>
		<% } %>
</select>
	<%
}
%>
</td></tr>
<tr>
<td> Year Of Graduation </td>
<td> <input type="text" name="year"> </td>
</tr>
<tr>
<td> Lives on Campus </td>
<td> <input type="radio" name="campus" value="Yes"> Yes 
<br>
<input type="radio" name="campus" value="No" checked> No </td>
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

<!-- create table Student 
	(
	id int primary key auto_increment,
	fName varchar(255) not null,
	lName varchar(255) not null,
	sID char(8) not null,
	major integer,
	foreign key (major) references Department(id)
		on update cascade on delete set null,
	address1 varchar(255) not null,
	address2 varchar(255),
	address3 varchar(255),
	city varchar(255) not null,
	state varchar(255) not null,
    postalCode varchar(10) not null,
	country varchar(255) not null,
	phoneNumber varchar(15),
	advisor int,
	foreign key (advisor) references Advisor(id)
		on update cascade on delete set null,
	yearOfGraduation integer,
	livesOncampus enum('No','Yes') not null
	);
 -->