<%@ page import="java.sql.*" %>
<html>
<head>
<%
String id1=request.getParameter("username").toString();
%>

<%!
int id;
String dep;
String phno;
String doj;
String name;
String dob;
String email;
%>
<%
	try{
		Connection connection;

		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");

		PreparedStatement ps=connection.prepareStatement("select * from user where emailID=?");
		ps.setString(1,id1);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			id=rs.getInt(1);
			name  = rs.getString(2);
	         dob = rs.getString(3);
	         doj=rs.getString(4);
	         phno=rs.getString(5);
	         dep=rs.getString(6);
	         email = rs.getString(7);	

		}
	}
	catch(Exception e)
	{
		System.out.print(e);
	}		
%>
</head>
<body>
<nav>
		<ul>
		<li><a href="page4.jsp">View</a></li>
		<li><a href="page3.jsp?var=<%=id%>">Apply</a></li>
		<li class="logout"><a href="index.html">Log out</a></li>
		</ul>
	</nav>


 <b><%=id1%></b>
 <span>
		<p style=" size="4"; face="ariel"; color:#ff9900; ">
			ID : <%=id %><br>
			Name: <%=name %><br>
			Date Of Birth : <%=dob %><br>
			Date Of Joining : <%=dob %><br>
			Department : <%=dob %><br>
			Email: <%=id1 %><br>
			Contact Number : <%=phno %><br>
		</p>
    </span>
</body>
</html>