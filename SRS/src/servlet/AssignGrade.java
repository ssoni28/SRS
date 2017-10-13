package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RegistrationBean;
import dao.DbConnection;

/**
 * Servlet implementation class AssignGrade
 */
@WebServlet("/AssignGrade")
public class AssignGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignGrade() {
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
		RegistrationBean registrationBean = new RegistrationBean();

		int result;
		registrationBean.setStudent(Integer.parseInt(request.getParameter("student")));
		registrationBean.setSection(Integer.parseInt(request.getParameter("section")));
		registrationBean.setGrade(request.getParameter("grade"));
		result = connection.assignGrade(registrationBean);
		System.out.println(result);

		if(result==1)
		{
			request.setAttribute("Successful", "Grade assignment successful.");
		}
		else
		{
			request.setAttribute("Failure", "Grade assignment not successful.");
		}
		request.getRequestDispatcher("/SuccessInstructor.jsp").forward(request, response);



	}

}
