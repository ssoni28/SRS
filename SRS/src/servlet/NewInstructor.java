package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InstructorBean;
import dao.DbConnection;

/**
 * Servlet implementation class NewInstructor
 */
@WebServlet("/NewInstructor")
public class NewInstructor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewInstructor() {
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
		InstructorBean instructorBean = new InstructorBean();
		
		Boolean result = false;
		instructorBean.setfName(request.getParameter("fName"));
		instructorBean.setlName(request.getParameter("lName"));
		instructorBean.setEmail(request.getParameter("email"));
		instructorBean.setDepartment(Integer.parseInt(request.getParameter("department")));
		instructorBean.setUserName(request.getParameter("username"));
		
		result = connection.insertInstructor(instructorBean);
		if(result)
		{
			request.setAttribute("SuccessfulInstructor", "Instructor successfully inserted.");
		}
		else
		{
			request.setAttribute("FailureInstructor", "Instructor not inserted successfully.");
		}
		request.getRequestDispatcher("/Success.jsp").forward(request, response);
	}

}
