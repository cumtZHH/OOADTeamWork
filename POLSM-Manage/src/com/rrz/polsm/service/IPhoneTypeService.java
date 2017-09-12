package com.rrz.polsm.service;

import java.util.Map;

import com.rrz.polsm.pojo.PhoneType;
import com.rrz.polsm.util.Page;


public interface IPhoneTypeService {
	
	Page<PhoneType> query(PhoneType pt,Map<String,String> map,int row,int page);
	PhoneType queryByAttr(String str,Object obj);
	void edit(PhoneType pt);
	void add(PhoneType pt);
	void delete(Object obj);

}
