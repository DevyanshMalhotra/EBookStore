package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.model.User;

public class DaoImpl implements UserDAO {
	
	private Connection conn;

	public DaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public int userRegister(User us) {
		int i=0;
		
		try {
			String sql="insert into users(name,email,phno,password) values (?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			 i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}

	public User login(String email, String password) {
		User us=null;
		
		try {
			String sql="select * from users where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return us;
	}

	public int checkPassword(int id, String ps) {
		int i=0;
		
		try {
			String sql="select * from users where id=? and password=?";
			PreparedStatement pstate=conn.prepareStatement(sql);
			pstate.setInt(1, id);
			pstate.setString(2,ps);
			ResultSet rs=pstate.executeQuery();
			while(rs.next())
			{
				i=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return i;
	}

	public int updateProfile(User us) {
int i=0;
		
		try {
			String sql="update users set name=? , email=? , phno=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());
			 i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return i;
		
	}

	public boolean checkUser(String em) {
		boolean f=true;
		
		try {
			String sql="select * from users where email=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				f=false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return f;
	}
	
	
	
	}
	
	


