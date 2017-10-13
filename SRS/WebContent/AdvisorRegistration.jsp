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

<%@ include file="AdvisorNav.jsp" %>

	<div id="section">
		<br>
		<form name="AdvisorRegistration" action="advisorRegistration" method="post">
			<table>
				<tr>
					<td>Student</td>
					<td><select name="student">
							<%
								if (request.getAttribute("students") != null) {
									ArrayList<Integer> students = (ArrayList<Integer>) request.getAttribute("students");
									Iterator<Integer> iterator = students.iterator();
									while (iterator.hasNext()) {
										Integer student = iterator.next();
							%>
							<option value="<%=student%>"><%=student%></option>
							<%
								}
							%>
					</select> <%
 	}
 %></td>
				</tr>
				<tr>
					<td>Section</td>
					<td><select name="section">
							<%
								if (request.getAttribute("sections") != null) {
									ArrayList<Integer> sections = (ArrayList<Integer>) request.getAttribute("sections");
									Iterator<Integer> iterator = sections.iterator();
									while (iterator.hasNext()) {
										Integer section = iterator.next();
							%>
							<option value="<%=section%>"><%=section%></option>
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

	<div id="footer">Copyright © neu.edu</div>
</body>
</html>

<!-- create table Registration 
	(
	student int,
	foreign key (student) references Student(id) 
		on update cascade on delete cascade,
	section int,
    foreign key (section) references Section(id)
		on update cascade on delete cascade,
	grade varchar(2),
 	time_stamp timestamp,
	primary key (student, section)
); -->