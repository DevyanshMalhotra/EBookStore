package com.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAOImpl;
import com.dao.CartDaoImpl;
import com.db.DBConnect;
import com.model.bookDtls;
import com.model.cart;

/**
 * Servlet implementation class cartcontroller
 */
public class cartcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid=Integer.parseInt(request.getParameter("bid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		
		BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
		bookDtls b=dao.getbookbyId(bid);
		
		cart c=new cart();
		c.setBid(bid);
		c.setUid(uid);
		c.setBookName(b.getBookname());
		c.setAuthor(b.getAuthor());
		c.setPrice(Double.parseDouble(b.getPrice()));
		c.setTotalPrice(Double.parseDouble(b.getPrice()));
		
		CartDaoImpl dao2=new CartDaoImpl(DBConnect.getConn());
		int i=dao2.addCart(c);
		HttpSession session=request.getSession();
		if(i>0)
		{
			session.setAttribute("addCart", "Book added to cart");
			response.sendRedirect("all_newbook.jsp");
			//System.out.println("Added to cart ");
		}
		else
		{
			session.setAttribute("failed", "Something went wrong");
			response.sendRedirect("all_newbook.jsp");
			//System.out.println("Somethong went wrong");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
