<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<!--  
<%
String id=request.getParameter("var").toString();
%>
-->
<%
int id1=Integer.parseInt(request.getParameter("var"));
%>
<center>
<div class="background">
<div class="transbox">
<h1> Select date</h1>
</div></center>
<form action="ApplyLeave" method="post">
<br>
<b><%=id %></b><br><br>
<b>Enter Start date:</b>
<br>
<input type="date" name="stdate"><br><br>
<b>Enter End date:</b><br>
<input type="date" name="edate"><br><br>
<%


%>
<b>Enter Type of leave :</b><br>

<select name="tol">
    <option>casual</option>
    <option>earned</option>
    <option>sick</option>
</select>
<br>
<br>
<input type="hidden" name="var" value=<%=id%>>  </input> 
<button class="submit" style="width:30%"> Submit</button>
  </form>

</body>
</html>