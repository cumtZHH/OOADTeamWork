package com.rrz.polsm.service;

import java.util.Map;

import com.rrz.polsm.pojo.Level;
import com.rrz.polsm.util.Page;


public interface ILevelService {
	
	Page<Level> query(Level l,Map<String,String> map,int row,int page);
	Level queryByAttr(String str,Object obj);
	void edit(Level l);
	void add(Level l);
	void delete(Object obj);

}
