package com.izitable.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.izitable.model.User;
import com.izitable.model.Pager;
import com.izitable.model.Booking;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<User> list(Pager pager) {
		return sql.selectList("user.list", pager);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("user.total", pager);
	}

	@Override
	public void update(User item) {
		sql.update("user.update", item);
	}

	@Override
	public void delete(int userNo) {
		sql.delete("user.delete", userNo);
	}

	@Override
	public void add(User item) {
		sql.insert("user.add", item);
	}

	@Override
	public User login(User user) {
		return sql.selectOne("user.login", user);
	}

	@Override
	public User item(int userNo) {
		return sql.selectOne("user.item", userNo);
	}

	@Override
	public int duplicateCheck(String userEmail) {
		return sql.selectOne("user.duplicateCheck", userEmail);
	}

}
