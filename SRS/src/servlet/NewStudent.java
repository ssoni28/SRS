package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.StudentBean;
import dao.DbConnection;

/**
 * Servlet implementation class NewStudent
 */
@WebServlet("/NewStudent")
public class NewStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewStudent() {
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
		StudentBean studentBean = new StudentBean();
		System.out.println("enter");
		Boolean result = false;
		studentBean.setFirstName(request.getParameter("fName"));
		studentBean.setLastName(request.getParameter("lName"));
		studentBean.setEmail(request.getParameter("email"));
		studentBean.setAddress1(request.getParameter("address1"));
		studentBean.setAddress2(request.getParameter("address2"));
		studentBean.setAddress3(request.getParameter("address3"));
		studentBean.setCity(request.getParameter("city"));
		studentBean.setCountry(request.getParameter("country"));
		System.out.println(request.getParameter("major"));
		studentBean.setMajor(String.valueOf(request.getParameter("major")));
		studentBean.setPhoneNo(request.getParameter("phone"));
		
		System.out.println("phone");
		studentBean.setLivesOnCampus(request.getParameter("campus"));
		studentBean.setYearOfGraduation(Integer.parseInt(request.getParameter("year")));
		studentBean.setState(request.getParameter("state"));
		studentBean.setPostal(Long.parseLong(request.getParameter("postal")));
		studentBean.setAdvisor(String.valueOf(request.getParameter("advisor")));
		
		
		result = connection.insertStudent(studentBean);
		if(result)
		{
			request.setAttribute("result",result);
			request.setAttribute("Successful", "Student successfully inserted.");
		}
		else
		{
			request.setAttribute("result", result);
			request.setAttribute("Failure", "Student not inserted successfully.");
		}
		request.getRequestDispatcher("/Success.jsp").forward(request, response);
		
		
		
	}

}
