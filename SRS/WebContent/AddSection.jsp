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
		<form name="AddSection" action="addSection" method="post">
			<table>
				<tr>
					<td>Course</td>
					<td><select name="course">
							<%
								if (request.getAttribute("courses") != null) {
									ArrayList<Integer> courses = (ArrayList<Integer>) request.getAttribute("courses");
									Iterator<Integer> iterator = courses.iterator();
									while (iterator.hasNext()) {
										Integer course = iterator.next();
							%>
							<option value="<%=course%>"><%=course%></option>
							<%
								}
							%>
					</select> <%
 	}
 %></td>
				</tr>
				<tr>
					<td>Semester</td>
					<td><input type="text" name="semester"></td>
				</tr>
				<tr>
					<td>Instructor</td>
					<td><select name="instructor">
							<%
								if (request.getAttribute("instructors") != null) {
									ArrayList<Integer> instructors = (ArrayList<Integer>) request.getAttribute("instructors");
									Iterator<Integer> iterator = instructors.iterator();
									while (iterator.hasNext()) {
										Integer instructor = iterator.next();
							%>
							<option value="<%=instructor%>"><%=instructor%></option>
							<%
								}
							%>
					</select> <%
 	}
 %></td>
				</tr>
				<tr>
					<td style="text-align: center"><input type="submit"
						value="Submit"></td>
				</tr>
			</table>
		</form>
		</div>

<div id="footer">
Copyright © neu.edu
</div>
</body>
</html>

<!-- create table Section
	(
	id int primary key auto_increment,
	course int,
	foreign key (course) references Course(id) 
		on update cascade on delete no action,
	semester varchar(255),
	instructor int,
    foreign key (instructor) references Instructor(id)
		on update cascade on delete set null
); -->