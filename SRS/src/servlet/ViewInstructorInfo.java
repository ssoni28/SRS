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
 * Servlet implementation class ViewStudentInfo
 */
@WebServlet("/ViewInstructorInfo")
public class ViewInstructorInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewInstructorInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = "1";
		DbConnection connection = new DbConnection();
		InstructorBean bean = connection.viewInstructorInfo(id);
		
		request.setAttribute("fname",bean.getfName());
		request.setAttribute("lname",bean.getlName());
		request.setAttribute("email",bean.getEmail());
		request.setAttribute("department",bean.getDepartment());
		request.getRequestDispatcher("/ViewInstructor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
