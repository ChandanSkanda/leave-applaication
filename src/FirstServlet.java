import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FirstServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String n=request.getParameter("username");
		String p=request.getParameter("userpass");
		
		if(LoginDao.validate(n, p)){
			response.sendRedirect("page2.html");
			RequestDispatcher rd=request.getRequestDispatcher("page2.html");
			rd.forward(request,response);
		}
		else{
			out.print("Sorry username or password error");
			RequestDispatcher rd=request.getRequestDispatcher("page1.html");
			rd.include(request,response);
		}
		
		out.close();
	}

}
