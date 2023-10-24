package com.izitable.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.izitable.dao.UserDao;
import com.izitable.model.User;
import com.izitable.model.Pager;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public List<User> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void update(User item) {
		dao.update(item);
	}

	@Override
	public void delete(int userNo) {
		dao.delete(userNo);
	}

	@Override
	public void add(User item) {
		
		item.setUserPhoneCert("0"); //전화번호 인증 : 미인증 -0, 인증-1
	   
		// 사용자가 입력한 비밀번호를 암호화
	    String rawPassword = item.getUserPwd();
	    String encodedPassword = passwordEncoder.encode(rawPassword);
	    item.setUserPwd(encodedPassword);
		dao.add(item);
	}

	@Override
	public Boolean login(User user) {
		User result = dao.login(user);
		
		if (result != null) {
			boolean a = passwordEncoder.matches(user.getUserPwd(), result.getUserPwd());
			BeanUtils.copyProperties(result, user);
			//user.setUserPwd(null);
			return a;
		}
		return false;	
	}

	@Override
	public User item(int userNo) {
		return dao.item(userNo);
	}

	@Override
	public int duplicateCheck(String userEmail) {
		return dao.duplicateCheck(userEmail);
	}

	@Override
	public User actionlogin(User user) {
		
		return dao.login(user);
	}

	@Override
	public void addKakao(User item) {
		
		 dao.add(item);
		
	}

}
