package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DepartmentBean;
import dao.DbConnection;

/**
 * Servlet implementation class AddDepartment
 */
@WebServlet("/AddDepartment")
public class AddDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDepartment() {
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
		DepartmentBean departmentBean = new DepartmentBean();
		Boolean result = false;
		departmentBean.setName(request.getParameter("name"));
		departmentBean.setPhone(request.getParameter("phone"));
		result = connection.insertDepartment(departmentBean);
		if(result)
		{
			request.setAttribute("SuccessfulDepartment", "Department successfully inserted.");
		}   
		else
		{
			request.setAttribute("FailureDepartment", "Department not inserted successfully.");
		}
		request.getRequestDispatcher("/Success.jsp").forward(request, response);
	}
}
