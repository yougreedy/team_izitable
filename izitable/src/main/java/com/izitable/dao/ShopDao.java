package com.izitable.dao;

import java.util.List;

import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;

public interface ShopDao {

	List<Shop> list(Shop shop);

	Shop item(int shopNo);

	Shop login(Shop shop);

	void update(Shop item);

	List<Shop> list_admin(Pager pager);

	Object add(Shop shop);

	int duplicateCheck(String shopEmail);

	void shopSettingTimeAdd(ShopTime shopTm);

	List<Shop> shopSettingTimeList(ShopTime shopTm);

	void shopSettingTableAdd(ShopTable shopTb);

	List<Shop> shopSettingTableList(ShopTable shopTb);

	void shopSettingTableDel(int tableNo);

	void shopSettingTimeDel(int timeNo);

	void update_admin(Shop item);

	void delete(int shopNo);

	int total(Pager pager);
	
	//조회수 증가
	void viewCount(int shopNo);
	
	//메인 페이지 인기 음식점(10곳 제한)
	List<Shop> list_popular(Pager pager);

	
	//지역 db 불러오기
	List<Shop> siList();

	List<Shop> guList(Shop shop);

	List<Shop> dongList(Shop shop);
	
	//매장 total 테이블 갯수
	int totalShopTable(int shopNo);

	//영업시간 삭제 시 redirect로 필요한 요일 select
	ShopTime shopSettingTimeItem(int timeNo);

	//영업시간 추가 시 중복 체크
	int shopSettingTimeCheck(ShopTime shopTm);
	
	//지도 + 매장 리스트
	List<Shop> list_map(Pager pager);

}
