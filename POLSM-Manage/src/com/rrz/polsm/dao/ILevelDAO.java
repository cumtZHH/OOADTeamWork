package com.rrz.polsm.dao;

import java.util.List;
import java.util.Map;

import com.rrz.polsm.pojo.Level;

public interface ILevelDAO {
	
	List<Level> query(Level l,Map<String,String> map,int row,int page);
	int getTotal(Level l);
	Level queryByAttr(String str,Object obj);
	void edit(Level l);
	void add(Level l);
	void delete(Object obj);
}
