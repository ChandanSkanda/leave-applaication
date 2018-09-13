

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class rejectServlet
 */
@WebServlet("/rejectServlet")
public class rejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		int leave_id=Integer.parseInt(request.getParameter("var"));
		System.out.print("leave id is :"+leave_id);
		
		
		if(AdminDao.reject(leave_id)){
	
			out.print("Request has been Rejected successfully!!!");
			RequestDispatcher rd=request.getRequestDispatcher("Arequest.jsp");
			rd.include(request,response);
		}
		else{
			out.print("ERROR!!!");
			RequestDispatcher rd=request.getRequestDispatcher("Arequest.jsp");
			rd.include(request,response);
		}
		
		
		
	}

}
