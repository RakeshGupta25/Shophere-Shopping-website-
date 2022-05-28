package com.shophere.myservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shophere.dao.UserDao;
import com.shophere.pojo.User;


@WebServlet("/do.useroperation")
public class LoginServlet extends HttpServlet {
	
	
	String fname,lname,uemail,password,role,address;
	String action;
	
	boolean flag;
	
	User user=null;
	UserDao userDao = new UserDao();
	
	HttpSession session=null;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
action = request.getParameter("action");
		
		if (action != null && action.equalsIgnoreCase("signout"))
		{
			session = request.getSession();
			if(session!=null)
			{
				session.invalidate();
				
				response.sendRedirect("index.jsp");
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		action = request.getParameter("action");
		
		if (action != null && action.equalsIgnoreCase("signup"))
		{
			fname = request.getParameter("fname");
			lname = request.getParameter("lname");
			uemail = request.getParameter("uemail");
			password = request.getParameter("password");
			role = request.getParameter("role");
			address = request.getParameter("address");
			
			user = new User(fname,lname,uemail,password,role,address);
			
			
			try {
				flag = userDao.add(user);
				
				if(flag)
				{

					request.setAttribute("smsg", "Your Registration is Successfully <br> please Login now....");
					request.getRequestDispatcher("login.jsp").forward(request, response);;
				}
				
				else
				{

					request.setAttribute("emsg", "Something went Wrong<br> please Try again...");
					request.getRequestDispatcher("register.jsp").forward(request, response);
				}
			
			
	
			
		}
			catch(Exception e)
			{
				e.printStackTrace();		
			}
		
	} // Signup action ended..
	
	else if (action != null && action.equalsIgnoreCase("signin"))
	{
		uemail = request.getParameter("uemail");
		password = request.getParameter("password");
		
		try 
		{
		user = userDao.isLogin(uemail, password);
		if(user!=null)
		{
			session = request.getSession();
			session.setAttribute("user", user);
			request.setAttribute("smsg", "Login Successfully");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		else
		{
			request.setAttribute("emsg", "Invalid username or password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
		
	}
}