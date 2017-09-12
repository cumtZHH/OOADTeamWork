package com.rrz.polsm.service.impl;

import com.rrz.polsm.dao.IOrderStateDAO;
import com.rrz.polsm.dao.impl.OrderStateDAOImpl;
import com.rrz.polsm.pojo.OrderState;
import com.rrz.polsm.service.IOrderStateService;

public class OrderStateServiceImpl implements IOrderStateService {
	/**
	 * 创建对象
	 */
	private IOrderStateDAO orderStateDAO = new OrderStateDAOImpl();

	@Override
	public void add(OrderState os) {
		
		orderStateDAO.add(os);

	}

}
