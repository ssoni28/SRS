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
 * Servlet implementation class NewRegistration
 */
@WebServlet("/NewRegistration")
public class NewRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewRegistration() {
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

		Boolean result = false;
		registrationBean.setStudent(Integer.parseInt(request.getParameter("student")));
		registrationBean.setSection(Integer.parseInt(request.getParameter("section")));
		//registrationBean.setGrade(request.getParameter("grade"));
		result = connection.insertRegistration(registrationBean);
		if(result)
		{
			request.setAttribute("SuccessfulRegistration", "Registration successful.");
		}
		else
		{
			request.setAttribute("FailureRegistration", "Registration not successful.");
		}
		request.getRequestDispatcher("/Success.jsp").forward(request, response);



	}

}
