import java.sql.*;

public class LoginDao {

	
	//user verification code
	public static boolean validate1(String name,String pass){
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
		}
		catch(Exception e){System.out.println(e);}
		return status;
	}
	
	//apply leave
	public static boolean addleave(String stdate, String edate,String tol,int id) {
		boolean status1=false;
		try {
			
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");
			PreparedStatement pstmt= con.prepareStatement("insert into leav(stdate,end_date,type_of_leave,id,stat) values (?,?,?,?,?)");
	        pstmt.setString(1,stdate);
	        pstmt.setString(2,edate);
	        pstmt.setString(3,tol);
	        pstmt.setInt(4, id); 
	        pstmt.setString(5, "false");
	        int rs=pstmt.executeUpdate();
	        if(rs==1)  status1=true;
	        else status1=false;
	        
		}
		catch(Exception e1){System.out.println(e1);}
		return status1;
	}
		
}
