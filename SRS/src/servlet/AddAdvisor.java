package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AdvisorBean;
import bean.StudentBean;
import dao.DbConnection;

/**
 * Servlet implementation class AddAdvisor
 */
@WebServlet("/AddAdvisor")
public class AddAdvisor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdvisor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
		DbConnection connection = new DbConnection();
		AdvisorBean advisorBean = new AdvisorBean();
	
		Boolean result = false;
		advisorBean.setfName(request.getParameter("fName"));
		advisorBean.setlName(request.getParameter("lName"));
		advisorBean.setEmail(request.getParameter("email"));
		advisorBean.setPhoneNo(request.getParameter("phone"));
		advisorBean.setUserName(request.getParameter("username"));
		result = connection.insertAdvisor(advisorBean);
		if(result)
		{
			request.setAttribute("SuccessfulAdvisor", "Advisor successfully inserted.");
		}
		else
		{
			request.setAttribute("FailureAdvisor", "Advisor not inserted successfully.");
		}
		request.getRequestDispatcher("/Success.jsp").forward(request, response);
	}
}
