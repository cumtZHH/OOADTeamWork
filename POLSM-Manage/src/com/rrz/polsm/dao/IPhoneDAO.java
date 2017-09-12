package com.rrz.polsm.dao;

import java.util.List;
import java.util.Map;

import com.rrz.polsm.pojo.Phone;

public interface IPhoneDAO {
	
	List<Phone> query(Phone p,Map<String,Integer> map,int row,int page);
	int getTotal(Phone p,Map<String,Integer> map);
	Phone queryByAttr(String str,Object obj);
	void edit(Phone p);
	void add(Phone p);
	void delete(Object obj);
}
