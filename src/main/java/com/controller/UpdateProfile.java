package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DaoImpl;
import com.db.DBConnect;
import com.model.User;

/**
 * Servlet implementation class UpdateProfile
 */
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
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
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phno=request.getParameter("phno");
		String password=request.getParameter("password");
		
		
	
       User us=new User();
       us.setId(id);
       us.setName(name);
       us.setEmail(email);
       us.setPhno(phno);
       
       HttpSession session=request.getSession();
       
		
		DaoImpl dao=new DaoImpl(DBConnect.getConn());
		int i=dao.checkPassword(id, password);
		if(i>0)
		{
			int i1=dao.updateProfile(us);
			if(i1>0)
			{
				session.setAttribute("succMsg", "Profile Updated Successfully");
				response.sendRedirect("editProfile.jsp");
			}
			else
			{
				session.setAttribute("falMsg", "Something went wrong");
				response.sendRedirect("editProfile.jsp");
			}
				
		}
		else
		{
			session.setAttribute("falMsg", "Invalid Password");
			response.sendRedirect("editProfile.jsp");
		}
      
	}

}
