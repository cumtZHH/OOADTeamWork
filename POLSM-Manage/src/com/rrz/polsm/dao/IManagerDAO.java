package com.rrz.polsm.dao;

import com.rrz.polsm.pojo.Manager;

public interface IManagerDAO {
	
	Manager queryByLoginName(String loginName);

}
