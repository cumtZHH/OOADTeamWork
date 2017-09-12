package com.rrz.polsm.dao;

import java.util.List;

import com.rrz.polsm.pojo.OrderState;

public interface IOrderStateDAO {
	
	void add(OrderState os); 
	List<OrderState> queryByOrderFormId(String orderFormId);

}
