package com.izitable.service;

import java.util.List;

import com.izitable.model.User;
import com.izitable.model.Pager;

public interface UserService {

	List<User> list(Pager pager);

	void update(User item);

	void delete(int userNo);

	void add(User item);
	
	void addKakao(User item);

	Boolean login(User user);

	User item(int userNo);

	int duplicateCheck(String userEmail);

	User actionlogin(User user);

	
	

	
}
