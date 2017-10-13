package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CourseBean;
import dao.DbConnection;

/**
 * Servlet implementation class ViewStudentInfo
 */
@WebServlet("/ViewCourseOffer")
public class ViewCourseOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCourseOffer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//String id = request.getParameter("spanId");
		DbConnection connection = new DbConnection();
		ArrayList<CourseBean> courseList = new ArrayList<CourseBean>();
		courseList = connection.viewCourseOffer();
		
		for(CourseBean b : courseList){
	//		System.out.println(b.getTitle());
		}
		
		request.setAttribute("courseList", courseList);
		
		
		
		
			/*request.setAttribute("courseNumber",bean.getCourseNumber());
		request.setAttribute("tittle",bean.getTitle());
		request.setAttribute("courseLevel",bean.getCourseLevel());
		request.setAttribute("department",bean.getDepartment());
		System.out.println("shikha");
			request.setAttribute("description",bean.getDescription());*/
		
			request.getRequestDispatcher("/ViewCourseOffer.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
