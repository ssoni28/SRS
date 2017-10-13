<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="java.util.Iterator"%>
	<%@page import="bean.RosterBean"%>

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

				<%@ include file="InstructorNav.jsp" %>


				<div id="section">
					<br>
						<table border="1">
							<tr>
								<th>Section Id</th>
								<th>Course Number</th>
								<th>Title</th>
								<th>Semester</th>
								<th>Student Id</th>
								<th>Student First Name</th>
								<th>Student Last Name</th>
								<th>Major</th>
								<th>Grade</th>
								<th>Instructor First Name</th>
								<th>Instructor Last Name</th>
							</tr>

							<%
							
							if (request.getAttribute("roster") != null) {
								
								ArrayList<RosterBean> roster = (ArrayList<RosterBean>) request.getAttribute("roster");
								Iterator<RosterBean> iterator = roster.iterator();
								while (iterator.hasNext()) {
									RosterBean rosterBean = iterator.next();
									%>
									<tr>
										<td><%=rosterBean.getSectionID()%></td>
										<td><%=rosterBean.getCourseNumber() %></td>
										<td><%=rosterBean.getTitle() %></td>
										<td><%=rosterBean.getSemester() %></td>
										<td><%=rosterBean.getStudentID() %></td>
										<td><%=rosterBean.getStudentFN() %></td>
										<td><%=rosterBean.getStudentLN() %></td>
										<td><%=rosterBean.getStudentMajor() %></td>
										<td><%=rosterBean.getStudentGrade() %></td>
										<td><%=rosterBean.getInstructorFN() %></td>
										<td><%=rosterBean.getInstructorLN() %></td>
									</tr>
									<%
								}
								%>
								
	
								<%
							}
							%>


						</table>
						
					</div>

					<div id="footer">
						Copyright © neu.edu
					</div>
				</body>
			</html>
