package com.rrz.polsm.dao;

import java.util.List;

import com.rrz.polsm.pojo.OrderDetail;
import com.rrz.polsm.pojo.OrderForm;


public interface IOrderDetailDAO {
	
	List<OrderForm> query(List<OrderForm> list);
	List<OrderDetail> queryByOrderFormId(String orderFormId);

}
