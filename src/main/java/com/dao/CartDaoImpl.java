package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.cart;

public class CartDaoImpl implements CartDao {
	
	Connection conn;
	

	public CartDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public int addCart(cart c) {
		int i=0;
		
		try {
			String sql="insert into cart(bid,uid,bookName,author,price,total_price)values (?,?,?,?,?,?) ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return i;
	}


	public List<cart> getBookByUser(int uid) {
		cart c=null;
		double totalPrice=0;
		List<cart> list=new ArrayList<cart>();
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				c=new cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalPrice=totalPrice+rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}


	public int deleteBook(int bid,int uid,int cid) {
		int i=0;
		
		try {
			String sql="delete from cart where bid=? and uid=? and cid=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return i;
	}
	
	 
	}


