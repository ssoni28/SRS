package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SectionBean;
import dao.DbConnection;

/**
 * Servlet implementation class NewSection
 */
@WebServlet("/NewSection")
public class NewSection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewSection() {
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
		SectionBean sectionBean = new SectionBean();
		
		Boolean result = false;
		sectionBean.setCourse(Integer.parseInt(request.getParameter("course")));
		sectionBean.setSemester(request.getParameter("semester"));
		sectionBean.setInstructor(Integer.parseInt(request.getParameter("instructor")));
		result = connection.insertSection(sectionBean);
		if(result)
		{
			
			request.setAttribute("SuccessfulSection", "Section successfully inserted.");
		}
		else
		{
			
			request.setAttribute("FailureSection", "Section not inserted successfully.");
		}
		request.getRequestDispatcher("/Success.jsp").forward(request, response);
		
	}

}
