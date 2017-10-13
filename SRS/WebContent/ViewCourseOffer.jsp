<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.CourseBean;" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Insert title here</title>
  
<%@ include file="Styles.jsp" %>
  
</head>
<body>
  <%@ include file="StudentNav.jsp" %>
  <%
  /* String courseNumber = String.valueOf(request.getParameter("courseNumber"));
  String tittle = String.valueOf(request.getAttribute("title"));
  String courseLevel = String.valueOf(request.getAttribute("courseLevel"));
  String description = String.valueOf(request.getAttribute("description"));
  int department = Integer.parseInt(request.getAttribute("department").toString()); */
  ArrayList<CourseBean> courseList = new ArrayList<CourseBean>();
    courseList = (ArrayList<CourseBean>)request.getAttribute("courseList");
      for(CourseBean b: courseList){
        %>
        <table>
          <tr>
            <td>
              <th> CourseNumber: <p><%= b.getCourseNo()%> </th></p><br>	
              <th> Title: <p><%= b.getCourseNo()%> </th> </p><br>
              <th> Description: <p><%= b.getDescription()%> </th> </p><br>	
              <th> CourseLevel: <p><%= b.getCourseLevel()%> </th> </p><br>	
              <th> Department: <p><%= b.getDepartment()%> </th> </p><br>	
            </td>
          </tr> 
        </table>
        <%}
        %>
        <p>HI</p>
      </body>
      </html>
