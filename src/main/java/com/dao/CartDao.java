package com.dao;

import java.util.List;

import com.model.cart;

public interface CartDao {
	public int addCart(cart c);
	public List<cart> getBookByUser(int uid);
	public int deleteBook(int bid,int uid,int cid);

}
