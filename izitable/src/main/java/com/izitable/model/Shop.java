package com.izitable.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Shop {
	private int shopNo; 		//점주 번호
	private String shopEmail;	//점주 이메일
	private String shopPwd;		//점주 비밀번호
	private String compName;	//매장 이름
	private String compNum;		//매장 번호 (사업자 번호)
	private String compCeo;		//매장 사장님명
	private String compCall;	//매장 전화번호
	private String compAddr1;	//매장 구주소
	private String compAddr2;	//매장 신주소
	private String compIntro;	//매장 소개
	private int categoryNo;		//매장 카테고리
	private String latitude;	//매장 위도
	private String longitude;	//매장 경도
	
	private String si;			//시
	private String gu;			//구
	private String dong;		//동
	
	private String loginType;	//로그인 타입
	
	private String detailAddr; //매장 상세 주소
	
	private String imgFilename; //매장 대표사진(이미지 파일명)
	
	private String compHour;	//매장 영업시간
	private String parking;		//매장 주차여부
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date shopRegDate;	//매장 가입날짜
	
	
	public Date getShopRegDate() {
		return shopRegDate;
	}
	public void setShopRegDate(Date shopRegDate) {
		this.shopRegDate = shopRegDate;
	}
	
	public String getCompHour() {
		return compHour;
	}
	public void setCompHour(String compHour) {
		this.compHour = compHour;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	
	public String getImgFilename() {
		return imgFilename;
	}
	public void setImgFilename(String imgFilename) {
		this.imgFilename = imgFilename;
	}
	
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	
	public String getLoginType() {
		return loginType;
	}
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	
	public String getSi() {
		return si;
	}
	public void setSi(String si) {
		this.si = si;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	
	
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getShopEmail() {
		return shopEmail;
	}
	public void setShopEmail(String shopEmail) {
		this.shopEmail = shopEmail;
	}
	public String getShopPwd() {
		return shopPwd;
	}
	public void setShopPwd(String shopPwd) {
		this.shopPwd = shopPwd;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getCompNum() {
		return compNum;
	}
	public void setCompNum(String compNum) {
		this.compNum = compNum;
	}
	public String getCompCeo() {
		return compCeo;
	}
	public void setCompCeo(String compCeo) {
		this.compCeo = compCeo;
	}
	public String getCompCall() {
		return compCall;
	}
	public void setCompCall(String compCall) {
		this.compCall = compCall;
	}
	public String getCompAddr1() {
		return compAddr1;
	}
	public void setCompAddr1(String compAddr1) {
		this.compAddr1 = compAddr1;
	}
	public String getCompAddr2() {
		return compAddr2;
	}
	public void setCompAddr2(String compAddr2) {
		this.compAddr2 = compAddr2;
	}
	public String getCompIntro() {
		return compIntro;
	}
	public void setCompIntro(String compIntro) {
		this.compIntro = compIntro;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

}
