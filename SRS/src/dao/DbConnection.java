package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import com.mysql.jdbc.ResultSet;
import bean.AdvisorBean;
import bean.CourseBean;
import bean.DepartmentBean;
import bean.InstructorBean;
import bean.RegistrationBean;
import bean.RosterBean;
import bean.SectionBean;
import bean.StudentBean;

public class DbConnection {

	ArrayList<Integer> advisors = new ArrayList<Integer>();
	ArrayList<Integer> majors = new ArrayList<Integer>();
	ArrayList<Integer> students = new ArrayList<Integer>();
	ArrayList<Integer> sections = new ArrayList<Integer>();
	ArrayList<Integer> courses = new ArrayList<Integer>();
	ArrayList<Integer> instructors = new ArrayList<Integer>();
	public boolean insertStudent(StudentBean studentBean)
	{
		int i=0;
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");
			PreparedStatement ps=con.prepareStatement(  
					"insert into Student (fName,lName,email,major,address1, "+
							"address2, address3, city, state,"+ 
							"postalCode,country, phoneNumber, advisor, yearOfGraduation,livesOncampus)"+
					"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  

			ps.setString(1, studentBean.getFirstName());
			ps.setString(2, studentBean.getLastName());
			ps.setString(3, studentBean.getEmail());
			ps.setInt(4, Integer.parseInt(studentBean.getMajor()));
			ps.setString(5, studentBean.getAddress1());
			ps.setString(6, studentBean.getAddress2());
			ps.setString(7, studentBean.getAddress3());
			ps.setString(8, studentBean.getCity());
			ps.setString(9, studentBean.getState());
			ps.setString(10, String.valueOf(studentBean.getPostal()));
			ps.setString(11, studentBean.getCountry());
			ps.setString(12, String.valueOf(studentBean.getPhoneNo()));
			ps.setInt(13, Integer.parseInt(studentBean.getAdvisor()));
			ps.setString(14, String.valueOf(studentBean.getYearOfGraduation()));
			ps.setString(15, studentBean.isLivesOnCampus());

			i=ps.executeUpdate();  

		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if(i>0)  
			return true;
		else
			return false;
	}  

	public ArrayList<Integer> getAdvisor()
	{

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";

		try
		{

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");

			PreparedStatement statement = con.prepareStatement("select id from Advisor");
			ResultSet rs = (ResultSet) statement.executeQuery();

			while(rs.next())
			{
				advisors.add(rs.getInt(1));
				System.out.println("Advisor: " + rs.getInt(1));
			}

			statement.close();
		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} 
		catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return advisors;
	}
	public ArrayList<Integer> getDepartment()
	{

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";

		try
		{

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");

			PreparedStatement statement = con.prepareStatement("select id from Department");
			ResultSet rs = (ResultSet) statement.executeQuery();

			while(rs.next())
			{
				majors.add(rs.getInt(1));
				System.out.println("Department: " + rs.getInt(1));
			}

			statement.close();
		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} 
		catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return majors;
	}

	public ArrayList<Integer> getStudent()
	{

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";

		try
		{

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");

			PreparedStatement statement = con.prepareStatement("select id from Student");
			ResultSet rs = (ResultSet) statement.executeQuery();

			while(rs.next())
			{
				students.add(rs.getInt(1));
				System.out.println("Student: " + rs.getInt(1));
			}

			statement.close();
		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} 
		catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return students;
	}

	public ArrayList<Integer> getSection()
	{

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";

		try
		{

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");

			PreparedStatement statement = con.prepareStatement("select id from Section");
			ResultSet rs = (ResultSet) statement.executeQuery();

			while(rs.next())
			{
				sections.add(rs.getInt(1));
				System.out.println("Section: " + rs.getInt(1));
			}

			statement.close();
		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} 
		catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return sections;
	}

	public ArrayList<Integer> getCourse()
	{

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";

		try
		{

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");

			PreparedStatement statement = con.prepareStatement("select id from Course");
			ResultSet rs = (ResultSet) statement.executeQuery();

			while(rs.next())
			{
				courses.add(rs.getInt(1));
				System.out.println("Course: " + rs.getInt(1));
			}

			statement.close();
		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} 
		catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return courses;
	}

	public ArrayList<Integer> getInstructor()
	{

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";

		try
		{

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");

			PreparedStatement statement = con.prepareStatement("select id from Instructor");
			ResultSet rs = (ResultSet) statement.executeQuery();

			while(rs.next())
			{
				instructors.add(rs.getInt(1));
				System.out.println("Instructor: " + rs.getInt(1));
			}

			statement.close();
		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} 
		catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return instructors;
	}




	public boolean insertAdvisor(AdvisorBean advisorBean)
	{
		int i=0;

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");
			/*Create table Advisor
(
	id int primary key auto_increment,
 	fName varchar(255) not null,
	lName varchar(255) not null,
	email varchar(255) unique,
	phone varchar(10),
	username varchar(255)
);
			 */
			PreparedStatement ps=con.prepareStatement(  
					"insert into Advisor (fName,lName,email,phone,username)"+
					"values(?,?,?,?,?)");  

			ps.setString(1, advisorBean.getfName());
			ps.setString(2, advisorBean.getlName());
			ps.setString(3, advisorBean.getEmail());
			ps.setString(4, advisorBean.getPhoneNo());
			ps.setString(5, advisorBean.getUserName());
			i=ps.executeUpdate();  

		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if(i>0)  
			return true;
		else
			return false;
	}  

	public boolean insertDepartment(DepartmentBean departmentBean)
	{
		int i=0;
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");
			/*create table Department
(
	id int primary key auto_increment,
	name varchar(255) not null,
	phoneNumber varchar(10)
);
			 */
			PreparedStatement ps=con.prepareStatement(  
					"insert into Department (name,phoneNumber)"+
					"values(?,?)");  

			ps.setString(1, departmentBean.getName());
			ps.setString(2, departmentBean.getPhone());
			i=ps.executeUpdate();  

		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if(i>0)  
			return true;
		else
			return false;
	}  

	public boolean insertInstructor(InstructorBean instructorBean)
	{
		int i=0;
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");
			/*create table Instructor
(
	id int primary key auto_increment,
	fName varchar(255) not null,
	lName varchar(255) not null,
    email varchar(255) unique,
	department integer,
	foreign key (department) references Department(id)
		on update cascade on delete set null,
	username varchar(255) unique
);
			 */

			PreparedStatement ps=con.prepareStatement(  
					"insert into instructor (fName,lName,email,department,username)"+
					"values(?,?,?,?,?)");  

			ps.setString(1, instructorBean.getfName());
			ps.setString(2, instructorBean.getlName());
			ps.setString(3, instructorBean.getEmail());
			ps.setInt(4, instructorBean.getDepartment());
			ps.setString(5, instructorBean.getUserName());
			i=ps.executeUpdate();  

		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if(i>0)  
			return true;
		else
			return false;
	}  

	public boolean insertCourse(CourseBean courseBean)
	{
		int i=0;
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");
			/*create table Course
	(
	id int primary key auto_increment,
	courseNumber varchar(8) unique,
	title varchar(255),
	courseLevel varchar(255),
    description longtext,
	department int,
	foreign key (department) references Department(id) 
		on update cascade on delete no action
);
			 */

			PreparedStatement ps=con.prepareStatement(  
					"insert into course (courseNumber,title,courseLevel,description,department)"+
					"values(?,?,?,?,?)");  

			ps.setString(1, courseBean.getCourseNo());
			ps.setString(2, courseBean.getTitle());
			ps.setString(3, courseBean.getCourseLevel());
			ps.setString(4, courseBean.getDescription());
			ps.setInt(5, courseBean.getDepartment());
			i=ps.executeUpdate();  

		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if(i>0)  
			return true;
		else
			return false;
	}  

	public boolean insertRegistration(RegistrationBean registrationBean)
	{
		int i=0;

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");
			/*create table Registration 
	(
	student int,
	foreign key (student) references Student(id) 
		on update cascade on delete cascade,
	section int,
    foreign key (section) references Section(id)
		on update cascade on delete cascade,
	grade varchar(2),
 	time_stamp timestamp,
	primary key (student, section)
);
			 */
			PreparedStatement ps=con.prepareStatement(  
					"insert into Registration (student,section)"+
					"values(?,?)");  

			ps.setInt(1, registrationBean.getStudent());
			ps.setInt(2, registrationBean.getSection());
			i=ps.executeUpdate();  

		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if(i>0)  
			return true;
		else
			return false;
	}  public boolean insertSection(SectionBean sectionBean)
	{
		int i=0;
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");
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
);
			 */

			PreparedStatement ps=con.prepareStatement(  
					"insert into section (course,semester,instructor)"+
					"values(?,?,?)");  

			ps.setInt(1, sectionBean.getCourse());
			ps.setString(2, sectionBean.getSemester());
			ps.setInt(3, sectionBean.getInstructor());
			i=ps.executeUpdate();  

		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if(i>0)  
			return true;
		else
			return false;
	}  
	
	

	public StudentBean viewStudentInfo(String id)
	{
		//int i=0;
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "admin";
		String password= "admin";
		StudentBean sbean = new StudentBean();
		String fName="";
		String lName = "";
		String address1="";
		String address2="";
		String address3="";
		String city="";
		String state="";
		String country="";
		String phoneNo = "";
		int yearOfGraduation = 0;
		int advisor= 0;
		String major="";	


		//String sID = "";

		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			//System.out.println("Connected to the database");
			PreparedStatement ps=con.prepareStatement( "select * from Student where id=?");  

			ps.setString(1, id);

			ResultSet rs = (ResultSet) ps.executeQuery();

			//while (rs.next()) {
			if(rs.next()){	
				fName = rs.getString("fName");
				lName = rs.getString("lName");
				address1=rs.getString("address1");
				address2=rs.getString("address2");
				address3=rs.getString("address3");
				city=rs.getString("city");
				state=rs.getString("state");
				country=rs.getString("country");
				major=rs.getString("major");
				phoneNo=rs.getString("phoneNumber");
				advisor=rs.getInt("advisor");
				yearOfGraduation=rs.getInt("yearOfGraduation");
				major=rs.getString("major");

				//sID = rs.getString("sID");			}
				//int b = rs.getInt("age");

				//request.setAttribute("first",fName);

			}

			sbean.setFirstName(fName);
			sbean.setLastName(lName);
			sbean.setAddress1(address1);
			sbean.setAddress2(address2);
			sbean.setAddress3(address3);
			sbean.setCity(city);
			sbean.setState(state);
			sbean.setAdvisor(String.valueOf(advisor));
			sbean.setMajor(major);
			sbean.setCountry(country);
			sbean.setPhoneNo(phoneNo);
			sbean.setYearOfGraduation(yearOfGraduation);

			//i=ps.executeUpdate();  
			rs.close();
			ps.close();
			con.close();



		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		//		if(i>0)  
		//			return true;
		//		else
		//			return false;
		return sbean;
	}  
	
	public InstructorBean viewInstructorInfo(String id)
	{
	  
	  Connection con = null;
	  String url="jdbc:mysql://localhost:3306/";
	  String dbName ="SRS";
	  String userName= "admin";
	  String password= "admin";
	  InstructorBean ibean = new InstructorBean();
	  String fName="";
	  String lName = "";
	  String email="";
	  int department = 0;
	  String username="";	
	  
	  
	  //String sID = "";
	  
	  try
	  {
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    con = DriverManager.getConnection(url+dbName,userName,password);
	    //System.out.println("Connected to the database");
	    PreparedStatement ps=con.prepareStatement( "select * from Instructor where id = ?");  
	    
	    ps.setString(1, id);
	    
	    ResultSet rs = (ResultSet) ps.executeQuery();
	    
	    //while (rs.next()) {
	    if(rs.next()){	
	      fName = rs.getString("fName");
	      lName = rs.getString("lName");
	      email = rs.getString("email");
	      department = rs.getInt("department");
	      username = rs.getString("username");
	      
	    }
	    
	    ibean.setfName(fName);
	    ibean.setlName(lName);
	    ibean.setEmail(email);
	    ibean.setDepartment(department);
	    ibean.setUserName(username);
	    
	    //i=ps.executeUpdate();  
	    rs.close();
	    ps.close();
	    con.close();
	    
	  }
	  catch (SQLException e2) {
	    e2.printStackTrace();
	  } catch (InstantiationException e) {
	    
	    e.printStackTrace();
	  } catch (IllegalAccessException e) {
	    
	    e.printStackTrace();
	  } catch (ClassNotFoundException e) {
	    
	    e.printStackTrace();
	  }   
	  finally
	  {
	    try {
	      
	      con.close();
	      
	    } catch (SQLException e) {
	      
	      e.printStackTrace();
	    }
	  }
	  //		if(i>0)  
	  //			return true;
	  //		else
	  //			return false;
	  return ibean;
	}  
	
public ArrayList<RosterBean> viewRoster() {
		
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String username ="l.smith";
		String password = "smith";
		ArrayList<RosterBean> roster = new ArrayList<RosterBean>();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,username,password);
			
			PreparedStatement ps = con.prepareStatement( "select * from InstructorRoster");  
			
			ResultSet rs = (ResultSet) ps.executeQuery();
			
			while(rs.next()) {
				RosterBean entry = new RosterBean();
				entry.setSectionID(rs.getInt("sectionID"));
				entry.setCourseNumber(rs.getString("courseNumber"));
				entry.setTitle(rs.getString("title"));
				entry.setSemester(rs.getString("semester"));
				entry.setStudentID(rs.getString("id"));
				entry.setStudentFN(rs.getString("studentFirstName"));
				entry.setStudentLN(rs.getString("studentLastName"));
				entry.setStudentMajor(rs.getString("major"));
				entry.setStudentGrade(rs.getString("grade"));
				entry.setInstructorFN(rs.getString("instructorFirstName"));;
				entry.setInstructorLN(rs.getString("instructorLastName"));
				
				roster.add(entry);
			}
			
			
			
			rs.close();
		    ps.close();
			
		   
		    
		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} 
		catch (InstantiationException e) {
			e.printStackTrace();
		} 
		catch (IllegalAccessException e) {
			e.printStackTrace();
		} 
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   	
		finally	{
			try {
				con.close();
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return roster;
	}

	public ArrayList<CourseBean> viewCourseOffer()
	{
		
	

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "wilkerson.v";
		String password= "wilkerson";
		CourseBean cbean ;
		String courseNumber="";
		String title = "";
		String courseLevel="";
		String description="";
		int department= 0;
		
		
		ArrayList<CourseBean> courseList = new ArrayList<CourseBean>();
	//	CourseOfferBean cobean = new CourseOfferBean();
		//String sID = "";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			//System.out.println("Connected to the databse");
			PreparedStatement ps=con.prepareStatement( "select courseNumber, title, courseLevel, description, department from course");  
			
			//ps.setString(1, id);
			
			ResultSet rs = (ResultSet) ps.executeQuery();
			
			while (rs.next()) {
		//	if(rs.next()){	
				
				courseNumber = rs.getString("courseNumber");
				System.out.println(rs.getString("courseNumber"));
				title = rs.getString("title");
				courseLevel=rs.getString("courseLevel");
				description=rs.getString("description");
				department=rs.getInt("department");
	//			 DataFields d=new DataFields(r.getString(1), r.getString(2), r.getString(3),r.getString(4), r.getString(5));                    
      //           allData.add(i,d);
        //         i++;
		//		courseList.add(new CourseOfferBean(courseNumber, title, courseLevel, description,department));		 
		     //sID = rs.getString("sID");			}
			//int b = rs.getInt("age");
			
			//request.setAttribute("first",fName);
				cbean = new CourseBean();
				
				cbean.setCourseNo(courseNumber);
				cbean.setTitle(title);
				cbean.setCourseLevel(courseLevel);
				cbean.setDepartment(department);
				cbean.setDescription(description);
				
				courseList.add(cbean);
		     
			}
			
			
						
			//i=ps.executeUpdate();  
			rs.close();
		      ps.close();
		      con.close();
		      
		      
			
		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
//		if(i>0)  
//			return true;
//		else
//			return false;
		return courseList;
	}  


	public boolean insertStudentRegistration(RegistrationBean registrationBean)
	{
		int i=0;

		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String userName= "wilkerson.v";
		String password= "wilkerson";
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");
			/*create table Registration 
	(
	student int,
	foreign key (student) references Student(id) 
		on update cascade on delete cascade,
	section int,
    foreign key (section) references Section(id)
		on update cascade on delete cascade,
	grade varchar(2),
 	time_stamp timestamp,
	primary key (student, section)
);
			 */
			PreparedStatement ps=con.prepareStatement(  
					"insert into Registration ('1',section)"+
					"values(?)");  

			//ps.setInt(1, registrationBean.getStudent());
			ps.setInt(1, registrationBean.getSection());
			i=ps.executeUpdate();  

		}
		catch (SQLException e2) {
			e2.printStackTrace();
		} catch (InstantiationException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}   
		finally
		{
			try {

				con.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if(i>0)  
			return true;
		else
			return false;

	}
	public int assignGrade(RegistrationBean registration) {
		
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/";
		String dbName ="SRS";
		String username = "l.smith";
		String password = "smith";
		int result = 0;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url+dbName,username,password);
			
			
			PreparedStatement ps = con.prepareStatement( "update InstructorSetGrade set grade= ? where section = ? and student = ?;");  
			ps.setString(1, registration.getGrade());
			ps.setInt(2, registration.getSection());
			ps.setInt(3, registration.getStudent());
			
			
			result = ps.executeUpdate();
			
		    ps.close();
		    
		}
		catch (SQLException e2) {
			e2.printStackTrace();
			
		} 
		catch (InstantiationException e) {
			e.printStackTrace();
		} 
		catch (IllegalAccessException e) {
			e.printStackTrace();
		} 
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}   	
		finally	{
			try {
				con.close();
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}