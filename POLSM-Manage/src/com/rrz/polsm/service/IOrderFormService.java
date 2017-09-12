package com.rrz.polsm.service;

import java.util.Map;

import com.rrz.polsm.pojo.OrderForm;
import com.rrz.polsm.util.Page;


public interface IOrderFormService {
	
	Page<OrderForm> query(OrderForm of,Map<String,String> map,int row,int page);
	Page<OrderForm> queryHandle(OrderForm of,Map<String,String> map,int row,int page);
	Page<OrderForm> querySuccess(OrderForm of,Map<String,String> map,int row,int page);
	OrderForm queryByAttr(String str,Object obj);
	void edit(OrderForm of);
	void add(OrderForm of);
	void delete(Object obj);

}
