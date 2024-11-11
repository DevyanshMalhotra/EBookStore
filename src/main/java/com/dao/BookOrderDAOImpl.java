package com.dao;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Book_Order;

public class BookOrderDAOImpl implements BookOrderDAO {
	
	private Connection conn;

	public BookOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public int getOrderNo() {
		int i=1;
		try {
			String sql="select * from book_order";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return i;
	}

	public boolean saveOrder(List<Book_Order> clist) {
		boolean f=false;
		
		try {
			String sql="insert into book_order(order_id,user_name,email,address,book_name,author,price,payment,phno) values (?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(Book_Order b:clist)
			{
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFullAdd());
				ps.setString(5, b.getBookName());
				ps.setString(6, b.getAuthor());
				ps.setString(7, b.getPrice());
				ps.setString(8, b.getPaymentType());
				ps.setString(9, b.getPhno());
				ps.addBatch();
			}
			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return f;
	}

	public List<Book_Order> getBook(String email) {
		List<Book_Order> list=new ArrayList<Book_Order>();
		Book_Order o=null;
		
		try {
			String sql="select * from book_order where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				o=new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setBookName(rs.getString(6));
				o.setAuthor(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(9));
				o.setPhno(rs.getString(10));
				list.add(o);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	public List<Book_Order> getAllOrder() {
		List<Book_Order> list=new ArrayList<Book_Order>();
		Book_Order o=null;
		
		try {
			String sql="select * from book_order";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				o=new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setBookName(rs.getString(6));
				o.setAuthor(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(9));
				o.setPhno(rs.getString(10));
				list.add(o);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	
	

}
