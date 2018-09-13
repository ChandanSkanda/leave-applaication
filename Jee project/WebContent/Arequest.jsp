<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<html>

<%!
int id;
int leave_id;
String sdate;
String edate;
String tol;
String name;
%>
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
 <br>
 <h2><center><b> REQUESTS </b></center><br></h2>
 <table id="t01">
 <tr>
    <th>ID</th>
    <th>NAME</th>
    <th>START DATE</th> 
    <th>END DATE</th>
	<th>TYPE OF LEAVE</th>
	<th>ACCEPT/REJECT</th>
</tr>
<%
	try{
		Connection connection;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");

		Statement stmt = null;
		stmt = connection.createStatement();
		String sql;
	    sql = "SELECT * FROM leav A,user B where A.leave_status='Pending' and A.id=B.id";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			leave_id=rs.getInt(1);
			sdate = rs.getString(2);
			edate=rs.getString(3);
			tol=rs.getString(4);
			id=rs.getInt(5);
			name = rs.getString(9);	
			
%>
<body>
<tr>
   <td><%=id %></td>
    <td><%=name %></td>
   <td><%=sdate %></td>
   <td><%=edate %></td>
   <td><%=tol %></td>
   <td>
    <form action="acceptServlet" method="post"> 
    <input type="hidden" name="var" value=<%=leave_id%>>
      <button type="submit"> Accept</button>
	</form>
    <form action="rejectServlet" method="post">
    <input type="hidden" name="var" value=<%=leave_id%>>
       <button type="submit" class="cancelbtn">Reject</button>
	</form>
	
   </td>
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
</body>
</html>