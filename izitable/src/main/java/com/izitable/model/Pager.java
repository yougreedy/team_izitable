package com.izitable.model;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	
	private int page = 1; 
	private int perPage =10;
	private float total;
	private int perGroup = 5;
	
	private int search = 1; // 1로 설정해서 shop.xml에서 검색 조건문을 실행한다. 아래의 조건문이 search가 0이상이므로 !
	private String keyword;
	

	public int getOffset() {
//		return (((page - 1) / perGroup) + 0 ) * perGroup; //startPage
		return perPage * (page -1);
	}
	
	public String getQuery() {
		String queryString = "";
	
		if(search > 0)
			queryString += "&keyword=" + keyword;
		
		return queryString;
	}
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getPerGroup() {
		return perGroup;
	}
	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}
	
	public int getLast() {
		return (int) Math.ceil(total / perPage); 
	}
	
	public int getPrev() {
		//return  page <= perGroup ? 1 : (((page - 1) / perGroup) - 1 ) * perGroup + 1; 
		return page ==1 ? 1 : page -1;
	}
	
	public int getNext() {
//		int next = (((page - 1) / perGroup) + 1 ) * perGroup + 1; 
//		int last = getLast();
//		
//		return  next < last ? next :last;
		return page == getLast() ? getLast() : page +1;
	}
	
	public List<Integer> getList() {
		List<Integer> list = new ArrayList<Integer>();
		
		int startPage = (((page - 1) / perGroup) + 0 ) * perGroup + 1; 
		
		for (int i = startPage; i < (startPage + perGroup) && i <= getLast(); i++ )
			list.add(i);
		
		if (list.isEmpty())
			list.add(1);
		
		return list;
	}
	
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	public String getKeyword() {
		if(search < 1)
			keyword = "";
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
