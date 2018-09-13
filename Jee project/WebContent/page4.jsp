<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<header>
        <img class="logo" src="A.png" >
 </header>
    <center>
        <h1>View other's Calendar</h1>
    <select name="user">
<%!

String name;
%>
<%
	try{
		Connection connection;

		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");

		PreparedStatement ps=connection.prepareStatement("select * from user");
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			name = rs.getString(2);
%>
<body> 

    <option value="<%=name%>"><%=name%></option>
 
 
 <%
 	}
}
 catch(Exception e)
 {
 System.out.print(e);
 }
 %>
  </select>
  <input type="submit">
</div>
<div id="organizerContainer"></div>
 
<script src='https://cdn.rawgit.com/nizarmah/calendar-javascript-lib/master/calendarorganizer.min.js'></script>

  </center>     

  
<script  src="js/index.js"></script>
</body>
</html>