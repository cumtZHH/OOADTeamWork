package com.rrz.polsm.dao;

import java.util.List;
import java.util.Map;

import com.rrz.polsm.pojo.News;


public interface INewsDAO {
	
	List<News> query(News n,Map<String,String> map,int row,int page);
	int getTotal(News n);
	News queryByAttr(String str,Object obj);
	void edit(News n);
	void add(News n);
	void delete(Object obj);

}
