<%@ page import="java.sql.*" %>
<html>

<%!
int id;
String dep;
String phno;
String doj;
String name;
String dob;
String email;
%>
 <br>
 <h2><center><b> USERS </b></center></h2>
 <table id="t01">
 <tr>
    <th>ID</th>
	<th>NAME</th>
    <th>DATE OF BIRTH</th> 
    <th>DATE OF JOINING</th>
	<th>PHONE NUMBER</th>
	<th>DEPARTMENT</th>
	<th>EMAIL ID</th>
</tr>
<%
	try{
		Connection connection;

		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");

		Statement stmt = null;
		stmt = connection.createStatement();
		String sql;
	    sql = "SELECT * FROM user";
		ResultSet rs=stmt.executeQuery(sql);
		
		while(rs.next())
		{
			id=rs.getInt(1);
			name  = rs.getString(2);
	         dob = rs.getString(3);
	         doj=rs.getString(4);
	         phno=rs.getString(5);
	         dep=rs.getString(6);
	         email = rs.getString(7);  	
%>
<head>
<body>
<style>		
table {
    width:100%;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
    text-align: left;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color: #fff;
}
table#t01 th {
    background-color: black;
    color: white;
}
</style>
</head>
<body>
<tr>
   <td><%=id %></td>
   <td><%=name %></td>
   <td><%=dob %></td>
   <td><%=doj %></td>
   <td><%=phno %></td>
   <td><%=dep %></td>
   <td><%=email %></td>
</tr>
<%
		}
	}
	catch(Exception e)
	{
		System.out.print(e);
	}		
%>		
</table>	
<!--  	<div class="success" id="message">	
		<p>Your profile updated successfully ..!</p>
</div>  -->
</body>
</html>