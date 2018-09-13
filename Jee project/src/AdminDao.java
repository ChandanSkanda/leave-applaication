import java.sql.*;

import javax.servlet.http.HttpServletRequest;
public class AdminDao {
	
	public static ResultSet rs=null;
	// user sign up code
		public static boolean adduser(String name, String email,String dob,String doj,String phno,String dep,String pwd) {
			boolean status1=false;
			try {
				Connection con;
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");
				PreparedStatement pstmt= con.prepareStatement("insert into user(name,dob,doj,phno,dep,pwd,emailID) values(?,?,?,?,?,?,?)");
		        pstmt.setString(1,name);    
		        pstmt.setString(2,dob);
		        pstmt.setString(3,doj);
		        pstmt.setString(4,phno);
		        pstmt.setString(5,dep);
		        pstmt.setString(6,pwd);
		        pstmt.setString(7,email);       
		        int rs=pstmt.executeUpdate();
		        if(rs==1)  status1=true;
		        else status1=false;	        
			}
			catch(Exception e1){System.out.println(e1);}
			return status1;
		}
		
		// admin verification code
		public static boolean validate1(String name,String pass){
			boolean status=false;
			try{
				Connection connection;
		
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");
		
				PreparedStatement ps=connection.prepareStatement("select * from admin where name=? and pwd=?");
				ps.setString(1,name);
				ps.setString(2,pass);
		
				ResultSet rs=ps.executeQuery();
				status=rs.next();	
			}
			catch(Exception e){System.out.println(e);}
			return status;
			
		}
		
		
		public static boolean accept(int id){
			boolean status=false;
			try{
				Connection connection;
		
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");
		
				Statement ps=connection.createStatement();
				int rs = ps.executeUpdate("UPDATE leav SET leave_status='Accepted' WHERE leave_id="+id+"" );
		
		        if(rs>=1)  status=true;
		        else status=false;	
		        Statement ps1=connection.createStatement();
		        int rs1 = ps.executeUpdate("UPDATE leav SET stat='true' WHERE leave_id="+id+"");
		        if(rs>=1)  status=true;
		        else status=false;
			}
			catch(Exception e){e.printStackTrace();}
			return status;
			
		}
		
		
		
		public static boolean reject(int id){
			boolean status=false;
			try{
				Connection connection;
		
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");
		
				Statement ps=connection.createStatement();
				
				int rs = ps.executeUpdate("UPDATE `leav` SET `leave_status`='Rejected' WHERE `leave_id`="+id+"");
		
		        if(rs>=1)  status=true;
		        else status=false;	
		        Statement ps1=connection.createStatement();
		        int rs1 = ps.executeUpdate("UPDATE leav SET stat='true' WHERE leave_id="+id+"");
		        if(rs>=1)  status=true;
		        else status=false;
			}
			catch(Exception e){e.printStackTrace();}
			return status;
			
		}
}
