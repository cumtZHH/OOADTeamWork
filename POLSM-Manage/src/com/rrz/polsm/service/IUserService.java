package com.rrz.polsm.service;

import java.util.Map;

import com.rrz.polsm.pojo.User;
import com.rrz.polsm.util.Page;


public interface IUserService {
	
	Page<User> query(User u,Map<String,String> map,int row,int page);
	User queryByAttr(String str,Object obj);
	void edit(User u);
	void add(User u);
	void delete(Object obj);

}
