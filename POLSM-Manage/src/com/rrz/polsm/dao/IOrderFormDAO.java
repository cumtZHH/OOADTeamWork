package com.rrz.polsm.dao;

import java.util.List;
import java.util.Map;

import com.rrz.polsm.pojo.OrderForm;


public interface IOrderFormDAO {
	
	List<OrderForm> query(OrderForm of,Map<String,String> map,int row,int page);
	List<OrderForm> queryHandle(OrderForm of,Map<String,String> map,int row,int page);
	List<OrderForm> querySuccess(OrderForm of,Map<String,String> map,int row,int page);
	int getTotal(OrderForm of,Map<String,String> map);
	int getTotalHandle(OrderForm of,Map<String,String> map);
	int getTotalSuccess(OrderForm of,Map<String,String> map);
	OrderForm queryByAttr(String str,Object obj);
	void edit(OrderForm of);
	void add(OrderForm of);
	void delete(Object obj);
	
	
}
