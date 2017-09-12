package com.rrz.polsm.dao;

import java.util.List;
import java.util.Map;

import com.rrz.polsm.pojo.Log;


public interface ILogDAO {
	
	List<Log> query(Log l,Map<String,String> map,int row,int page);
	int getTotal(Log l,Map<String, String> map);
	void add(Log l);

}
