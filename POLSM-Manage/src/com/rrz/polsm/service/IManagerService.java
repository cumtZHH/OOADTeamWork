package com.rrz.polsm.service;

import com.rrz.polsm.pojo.Manager;


public interface IManagerService {
	
	Manager login(String loginName,String loginPass);
}
