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
<%
if(request.getAttribute("Successful")!=null)
{
	out.println(request.getAttribute("Successful"));
}
if(request.getAttribute("Failure")!=null)
{
	out.println(request.getAttribute("Failure"));
}
if(request.getAttribute("SuccessfulAdvisor")!=null)
{
	out.println(request.getAttribute("SuccessfulAdvisor"));
}
if(request.getAttribute("FailureAdvisor")!=null)
{
	out.println(request.getAttribute("FailureAdvisor"));
}
if(request.getAttribute("SuccessfulDepartment")!=null)
{
	out.println(request.getAttribute("SuccessfulDepartment"));
}
if(request.getAttribute("FailureDepartment")!=null)
{
	out.println(request.getAttribute("FailureDepartment"));
}
if(request.getAttribute("SuccessfulInstructor")!=null)
{
	out.println(request.getAttribute("SuccessfulInstructor"));
}
if(request.getAttribute("FailureInstructor")!=null)
{
	out.println(request.getAttribute("FailureInstructor"));
}
if(request.getAttribute("SuccessfulCourse")!=null)
{
	out.println(request.getAttribute("SuccessfulCourse"));
}
if(request.getAttribute("FailureCourse")!=null)
{
	out.println(request.getAttribute("FailureCourse"));
}
if(request.getAttribute("SuccessfulRegistration")!=null)
{
	out.println(request.getAttribute("SuccessfulRegistration"));
}
if(request.getAttribute("FailureRegistration")!=null)
{
	out.println(request.getAttribute("FailureRegistration"));
}
if(request.getAttribute("SuccessfulSection")!=null)
{
	out.println(request.getAttribute("SuccessfulSection"));
}
if(request.getAttribute("FailureSection")!=null)
{
	out.println(request.getAttribute("FailureSection "));
}
%>
</div>

<div id="footer">
Copyright © neu.edu
</div>
</body>
</html>