package com.rrz.polsm.dao;

import java.util.List;
import java.util.Map;
import com.rrz.polsm.pojo.PhoneType;

public interface IPhoneTypeDAO {
	
	List<PhoneType> query(PhoneType pt,Map<String,String> map,int row,int page);
	int getTotal(PhoneType pt);
	PhoneType queryByAttr(String str,Object obj);
	void edit(PhoneType pt);
	void add(PhoneType pt);
	void delete(Object obj);
}
