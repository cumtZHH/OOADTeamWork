package com.rrz.polsm.service;

import java.util.Map;

import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.util.Page;


public interface IPhoneService {
	
	Page<Phone> query(Phone pt,Map<String,Integer> map,int row,int page);
	Phone queryByAttr(String str,Object obj);
	void edit(Phone p);
	void add(Phone p);
	void delete(Object obj);

}
