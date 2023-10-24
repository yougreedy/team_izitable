package com.izitable.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.izitable.dao.ShopDao;
import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;
import com.izitable.model.User;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopDao dao;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public List<Shop> list(Shop shop) {
		
		return dao.list(shop);
	}

	@Override
	public Shop item(int shopNo) {
		return dao.item(shopNo);
	}

	@Override
	public Boolean login(Shop shop) {
		
		Shop result = dao.login(shop);
		
		if (result != null) {
			boolean a = passwordEncoder.matches(shop.getShopPwd(), result.getShopPwd());
			BeanUtils.copyProperties(result, shop);
			//shop.setUserPwd(null);
			return a;
		}
		return false;	
	}

	@Override
	public void update(Shop item) {
		dao.update(item);
	}

	@Override
	public List<Shop> list_admin(Pager pager) {
		int total = dao.total(pager);

		pager.setTotal(total);
		
		return dao.list_admin(pager);
	}

	@Override
	public void add(Shop shop) {
		
		 String rawPassword = shop.getShopPwd();
		    String encodedPassword = passwordEncoder.encode(rawPassword);
		    shop.setShopPwd(encodedPassword);
		dao.add(shop);
	}

	@Override
	public int duplicateCheck(String shopEmail) {
		return dao.duplicateCheck(shopEmail);
	}

	@Override
	public void shopSettingTimeAdd(ShopTime shopTm) {
		dao.shopSettingTimeAdd(shopTm);
	}

	@Override
	public List<Shop> shopSettingTimeList(ShopTime shopTm) {
		return dao.shopSettingTimeList(shopTm);
	}

	@Override
	public void shopSettingTableAdd(ShopTable shopTb) {
		dao.shopSettingTableAdd(shopTb);
	}

	@Override
	public List<Shop> shopSettingTableList(ShopTable shopTb) {
		return dao.shopSettingTableList(shopTb);
	}

	@Override
	public void shopSettingTableDel(int tableNo) {
		dao.shopSettingTableDel(tableNo);
	}

	@Override
	public void shopSettingTimeDel(int timeNo) {
		dao.shopSettingTimeDel(timeNo);
	}

	@Override
	public void update_admin(Shop item) {
		dao.update_admin(item);
	}

	@Override
	public void delete(int shopNo) {
		dao.delete(shopNo);
	}
	
	//조회수 증가
	@Override
	public void viewCount(int shopNo) {
		dao.viewCount(shopNo);
	}
	
	//메인 페이지 인기 음식점(10곳 제한)
	@Override
	public List<Shop> list_popular(Pager pager) {
		return dao.list_popular(pager);
	}

	
	//지역 db 불러오기
	@Override
	public List<Shop> siList() {
		return dao.siList();
	}

	@Override
	public List<Shop> guList(Shop shop) {
		return dao.guList(shop);
	}

	@Override
	public List<Shop> dongList(Shop shop) {
		return dao.dongList(shop);
	}

	//매장 total 테이블 갯수
	@Override
	public int totalShopTable(int shopNo) {
		return dao.totalShopTable(shopNo);
	}

	//영업시간 삭제 시 redirect로 필요한 요일 select
	@Override
	public ShopTime shopSettingTimeItem(int timeNo) {
		return dao.shopSettingTimeItem(timeNo);
	}

	//영업시간 추가 시 중복 체크
	@Override
	public int shopSettingTimeCheck(ShopTime shopTm) {
		return dao.shopSettingTimeCheck(shopTm);
	}
	
	//지도 + 매장 리스트
	@Override
	public List<Shop> list_map(Pager pager) {
		return dao.list_map(pager);
	}
	
}
