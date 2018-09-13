<html>
<head><title>Hello</title>
</head>
<body>

<%
String id=request.getParameter("username").toString();
%>
	<header>
		<img class="logo" src="A.png" >
	</header>
	<nav>
		<ul>
		<li><a href="signup.html"> ADD USERS</a></li>
		<li><a href="Aviewprof.jsp">VIEW USER PROFILE</a></li>
		<li><a href="Arequest.jsp">VIEW REQUEST </a></li>
		<li><a href="Aviewusers.jsp">VIEW USERS</a>
		<li class="logout"><a href="Apage1.html">Log out</a></li>
		</ul>
	</nav>
	
	
</body>
</html>