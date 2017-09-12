package com.rrz.polsm.dao;

import java.util.List;
import java.util.Map;

import com.rrz.polsm.pojo.PhoneType;
import com.rrz.polsm.pojo.User;


public interface IUserDAO {
	
	List<User> query(User u,Map<String,String> map,int row,int page);
	int getTotal(User u,Map<String, String> map);
	User queryByAttr(String str,Object obj);
	void edit(User u);
	void add(User u);
	void delete(Object obj);

}
