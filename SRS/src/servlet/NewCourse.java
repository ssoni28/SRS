package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CourseBean;
import dao.DbConnection;

/**
 * Servlet implementation class NewCourse
 */
@WebServlet("/NewCourse")
public class NewCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewCourse() {
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
		CourseBean courseBean = new CourseBean();
		
		Boolean result = false;
		courseBean.setCourseNo(request.getParameter("courseNo"));
		courseBean.setCourseLevel(request.getParameter("courseLevel"));
		courseBean.setDescription(request.getParameter("description"));
		courseBean.setTitle(request.getParameter("courseTitle"));
		courseBean.setDepartment(Integer.parseInt(request.getParameter("department")));
		result = connection.insertCourse(courseBean);
		if(result)
		{
			request.setAttribute("SuccessfulCourse", "Course successfully inserted.");
		}
		else
		{
			request.setAttribute("FailureCourse", "Course not inserted successfully.");
		}
		request.getRequestDispatcher("/Success.jsp").forward(request, response);
	}

}
