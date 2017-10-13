package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AdminBean;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public Admin() {
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
		AdminBean adminBean = new AdminBean();
		adminBean.setUserName(request.getParameter("username"));
		System.out.println("admin  :"+adminBean.getUserName());
		adminBean.setPassword(request.getParameter("password"));
		String user = null;
		System.out.println("user"+user);
		if(adminBean.getUserName().equals("admin")&&adminBean.getPassword().equals("admin"))
		{
			user = "admin";
		}
		else if(adminBean.getUserName().equals("m.jones")&&adminBean.getPassword().equals("jones"))
		{
			user = "advisor";
		}
		else if(adminBean.getUserName().equals("l.smith")&&adminBean.getPassword().equals("smith"))
		{
			user = "instructor";
		}
		else if(adminBean.getUserName().equals("wilkerson.v")&&adminBean.getPassword().equals("wilkerson"))
		{
			user = "student";
		}
		else if(adminBean.getUserName().equals("registrar")&&adminBean.getPassword().equals("registrar"))
		{
			user = "registrar";
		}
		else
		{
			user = "unauthenticated";
		}

		System.out.println("user"+user);
		switch(user)
		{
		case "admin":
			request.setAttribute("result",user);
			request.setAttribute("Successful", "Successful login");
			request.getRequestDispatcher("/Success.jsp").forward(request, response);
			break;
		case "advisor":
			request.setAttribute("result",user);
			request.setAttribute("Successful", "Successful login");
			request.getRequestDispatcher("/SuccessAdvisor.jsp").forward(request, response);
			break;
		case "instructor":
			request.setAttribute("result",user);
			request.setAttribute("Successful", "Successful login");
			request.getRequestDispatcher("/SuccessInstructor.jsp").forward(request, response);
			break;
		case "student":
			request.setAttribute("result",user);
			request.setAttribute("Successful", "Successful login");
			request.getRequestDispatcher("/SuccessStudent.jsp").forward(request, response);
			break;
		case "registrar":
			request.setAttribute("result",user);
			request.setAttribute("Successful", "Successful login");
			request.getRequestDispatcher("/SuccessRegistrar.jsp").forward(request, response);
			break;
		case "unauthenticated":
			request.setAttribute("result", user);
			request.setAttribute("Failure", "Retry");
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		default:
			request.setAttribute("result", user);
			request.setAttribute("Failure", "Retry");
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}

		/*if(result)
		{
			request.setAttribute("result",result);
			request.setAttribute("Successful", "Successful login");
		}
		else
		{
			request.setAttribute("result", result);
			request.setAttribute("Failure", "Retry");
		}
		request.getRequestDispatcher("/Success.jsp").forward(request, response);*/
	}



}
