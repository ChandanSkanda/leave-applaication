import java.sql.*;

public class LoginDao {

public static boolean validate(String name,String pass){
boolean status=false;
try{
	Connection connection;
	
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");
	
	PreparedStatement ps=connection.prepareStatement("select * from user where emailID=? and pwd=?");
	ps.setString(1,name);
	ps.setString(2,pass);
	
	ResultSet rs=ps.executeQuery();
	status=rs.next();
	
	
}catch(Exception e){System.out.println(e);}
return status;
}
}
