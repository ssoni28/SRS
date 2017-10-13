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
 * Servlet implementation class ViewStudentInfo
 */
@WebServlet("/ViewStudentInfo")
public class ViewStudentInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewStudentInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("spanId");
		DbConnection connection = new DbConnection();
		StudentBean bean = connection.viewStudentInfo(id);
		
		request.setAttribute("fname",bean.getFirstName());
		request.setAttribute("lname",bean.getLastName());
		request.setAttribute("address1",bean.getAddress1());
		request.setAttribute("address2",bean.getAddress2());
		request.setAttribute("address3",bean.getAddress3());
		request.setAttribute("city",bean.getCity());
		request.setAttribute("state",bean.getState());
		request.setAttribute("postal",bean.getPostal());
		request.setAttribute("phoneNumber",bean.getPhoneNo());
		request.setAttribute("advisor",bean.getAdvisor());
		request.setAttribute("yearOfGraduation",bean.getYearOfGraduation());
		request.getRequestDispatcher("/ViewStudent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
