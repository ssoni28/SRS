package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DbConnection;

/**
 * Servlet implementation class AddSection
 */
@WebServlet("/AddSection")
public class AddSection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSection() {
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
		ArrayList<Integer> courses = connection.getCourse();
		ArrayList<Integer> instructors = connection.getInstructor();
		request.setAttribute("courses", courses);
		request.setAttribute("instructors", instructors);
		request.getRequestDispatcher("/AddSection.jsp").forward(request, response);
	}
/*create table Section
	(
	id int primary key auto_increment,
	course int,
	foreign key (course) references Course(id) 
		on update cascade on delete no action,
	semester varchar(255),
	instructor int,
    foreign key (instructor) references Instructor(id)
		on update cascade on delete set null
);*/
}
