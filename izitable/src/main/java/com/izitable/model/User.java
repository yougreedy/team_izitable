package com.izitable.model;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	@NotNull @Email
	private int userNo;				//회원 번호
	@NotNull
	private String userEmail;		//회원 이메일(아이디)
	@NotNull @Size(min = 8, max = 20, message = "영문, 숫자, 특수문자 중 2종류 이상을 조합하여 8~20자리로 설정해주세요.")
	private String userPwd;			//회원 비밀번호
	@NotNull
	private String userPhone;		//회원 전화번호
	private String userPhoneCert;	//회원 전화번호 인증여부
	
	private String userName;		//회원 이름
	private String loginType;		//로그인 타입
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date userRegDate;		//가입날짜

	
	public Date getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
		
	}
	public String getLoginType() {
		return loginType;
	}
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPhoneCert() {
		return userPhoneCert;
	}
	public void setUserPhoneCert(String userPhoneCert) {
		this.userPhoneCert = userPhoneCert;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	
}
