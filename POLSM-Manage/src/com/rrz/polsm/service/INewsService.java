package com.rrz.polsm.service;

import java.util.Map;

import com.rrz.polsm.pojo.News;
import com.rrz.polsm.util.Page;


public interface INewsService {
	
	Page<News> query(News n,Map<String,String> map,int row,int page);
	News queryByAttr(String str,Object obj);
	void edit(News n);
	void add(News n);
	void delete(Object obj);

}
