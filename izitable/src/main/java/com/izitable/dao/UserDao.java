package com.izitable.dao;

import java.util.List;

import com.izitable.model.User;
import com.izitable.model.Pager;
import com.izitable.model.Booking;

public interface UserDao {

	List<User> list(Pager pager);

	int total(Pager pager);

	void update(User item);

	void delete(int custCode);

	void add(User item);

	User login(User user);

	User item(int userNo);

	int duplicateCheck(String userEmail);
	
	

}
