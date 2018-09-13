import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApplyLeave
 */
@WebServlet("/ApplyLeave")
public class ApplyLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String sdate=request.getParameter("stdate");
		String edate=request.getParameter("edate");
		String tol=request.getParameter("tol");
		int id=Integer.parseInt(request.getParameter("var"));
		boolean status=false;
		int num;	

		Connection connection=null;

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date1=null;
		java.util.Date date2=null;
		try {
			date1 = dateFormat.parse(sdate);
			//System.out.println(date1.toString()); 

			date2 = dateFormat.parse(edate);
			//System.out.println(date2.toString());
		}
		catch(Exception e) {
			System.out.print(e);
		}
		if(date1==null  || date2==null)
		{
			out.print("please enter correct dates.!!!");
			RequestDispatcher rd=request.getRequestDispatcher("page3.jsp");
			rd.include(request,response);
		}
		else {
			num = date2.compareTo(date1);
			long diff = date2.getTime() - date1.getTime();
			int diffInDays = (int) diff / (1000 * 60 * 60 * 24);
			
			System.out.print("DIffer: "+diffInDays);
			
			int avail=0;
			try {

				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attivo","root", "admin");

				PreparedStatement ps=connection.prepareStatement("select * from cal where id= ?");
				ps.setInt(1,id);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					avail=rs.getInt(4);
					System.out.print("avail:"+avail);
				}
			}
			catch(Exception e1)
			{
				System.out.print(e1);
			}

			if(num<0) {
				out.print("End Date cannot be before Start Date.!!!");
				RequestDispatcher rd=request.getRequestDispatcher("page3.jsp");
				rd.include(request,response);
			}
			else if(avail<=(diffInDays+1)) {
				out.print("Leaves not available.!!!");
				RequestDispatcher rd=request.getRequestDispatcher("page3.jsp");
				rd.include(request,response);
			}
			else
			{		

				try {
					PreparedStatement ps=connection.prepareStatement("select * from leav where id= ? and leave_status=?");
					ps.setInt(1,id);
					ps.setString(2, "Pending");
					ResultSet rs=ps.executeQuery();
					status=rs.next();
				}
				catch(Exception e1)
				{
					System.out.print(e1);
				}
				if(!status)
				{
					if(LoginDao.addleave(sdate,edate,tol,id)){
						try {
							boolean flag = Send_Mail_Attachment.sendPersonalizedMail("chandan1ga15cs040@gmail.com", "Testing", "Testing the mail API");
							if(flag)
							{
								//System.out.print("Successful");
							}
						}
						catch(Exception e) {
							System.out.print(e);
						}

						out.print("Request has been sent successfully!!!");
						RequestDispatcher rd=request.getRequestDispatcher("page3.jsp");
						rd.include(request,response);
					}
					else{
						out.print("ERROR!!!");
						RequestDispatcher rd=request.getRequestDispatcher("page3.jsp");
						rd.include(request,response);
					}
				}
				else{
					out.print("User has already applied for leave and it is in pending state!!!");
					RequestDispatcher rd=request.getRequestDispatcher("page3.jsp");
					rd.include(request,response);
				}
			}

		}
	}

}
