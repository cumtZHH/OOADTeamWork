package com.rrz.polsm.service;

import java.util.Map;

import com.rrz.polsm.pojo.Log;
import com.rrz.polsm.util.Page;


public interface ILogService {
	
	Page<Log> query(Log l,Map<String,String> map,int row,int page);
	void add(Log l);

}
