<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
    <%
    String fname = String.valueOf(request.getAttribute("fname"));
    String lname = String.valueOf(request.getAttribute("lname"));
	String email = String.valueOf(request.getAttribute("email"));
	String department = String.valueOf(request.getAttribute("department"));
	
    %>
    
    <table border="1">
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Department</th>

      </tr>
      
      <tr>
        <td><%=fname%></td>
        <td><%=lname%>"</td>

          <td><%=email%></td>
          <td><%=department%></td>

        </tr>
      </table>
    </div>
    
    <div id="footer">Copyright © neu.edu</div>
  </body>
  </html>