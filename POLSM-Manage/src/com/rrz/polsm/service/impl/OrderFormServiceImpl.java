package com.rrz.polsm.service.impl;

import java.util.List;
import java.util.Map;

import com.rrz.polsm.dao.IOrderDetailDAO;
import com.rrz.polsm.dao.IOrderFormDAO;
import com.rrz.polsm.dao.IOrderStateDAO;
import com.rrz.polsm.dao.impl.OrderDetailDAOImpl;
import com.rrz.polsm.dao.impl.OrderFormDAOImpl;
import com.rrz.polsm.dao.impl.OrderStateDAOImpl;
import com.rrz.polsm.pojo.OrderDetail;
import com.rrz.polsm.pojo.OrderForm;
import com.rrz.polsm.pojo.OrderState;
import com.rrz.polsm.service.IOrderFormService;
import com.rrz.polsm.util.Page;


public class OrderFormServiceImpl implements IOrderFormService {
	/**
	 * ��������
	 */
	private IOrderFormDAO orderFormDAO = new OrderFormDAOImpl();
	private IOrderDetailDAO orderDetailDAO = new OrderDetailDAOImpl();

	/**
	 * ��������ѯ����
	 */
	@Override
	public Page<OrderForm> query(OrderForm of, Map<String, String> map, int row, int page) {
		Page<OrderForm> orderFormPage = new Page<>();
		orderFormPage.setRows(orderDetailDAO.query(orderFormDAO.query(of,map,row,page)));
		orderFormPage.setTotal(orderFormDAO.getTotal(of,map));
		int maxPageNum = (int)Math.ceil((orderFormPage.getTotal()*1.0)/row);
		orderFormPage.setMaxPageNum(maxPageNum);
		return orderFormPage;
	}

	/**
	 * �������Բ��Ҷ���
	 */
	@Override
	public OrderForm queryByAttr(String str, Object obj) {
		OrderForm of = orderFormDAO.queryByAttr(str, obj);
		//����������ϸ��
		IOrderDetailDAO orderDetailDAO = new OrderDetailDAOImpl();
		List<OrderDetail> orderDetailList = orderDetailDAO.queryByOrderFormId(obj.toString());
		//��������״̬��
		IOrderStateDAO orderStateDAO = new OrderStateDAOImpl();
		List<OrderState> orderStateList = orderStateDAO.queryByOrderFormId(obj.toString());
		of.setOrderDetailList(orderDetailList);
		of.setOrderStateList(orderStateList);
		return of;
	}

	/**
	 * �༭����
	 */
	@Override
	public void edit(OrderForm of) {
		orderFormDAO.edit(of);
	}

	/**
	 * ��Ӷ���
	 */
	@Override
	public void add(OrderForm of) {
		// TODO Auto-generated method stub

	}

	/**
	 * ɾ������
	 */
	@Override
	public void delete(Object obj) {
		orderFormDAO.delete(obj);
	}

	@Override
	public Page<OrderForm> queryHandle(OrderForm of, Map<String, String> map, int row, int page) {
		Page<OrderForm> orderFormPage = new Page<>();
		orderFormPage.setRows(orderDetailDAO.query(orderFormDAO.queryHandle(of,map,row,page)));
		orderFormPage.setTotal(orderFormDAO.getTotalHandle(of, map));
		int maxPageNum = (int)Math.ceil((orderFormPage.getTotal()*1.0)/row);
		orderFormPage.setMaxPageNum(maxPageNum);
		return orderFormPage;
	}

	@Override
	public Page<OrderForm> querySuccess(OrderForm of, Map<String, String> map, int row, int page) {
		Page<OrderForm> orderFormPage = new Page<>();
		orderFormPage.setRows(orderDetailDAO.query(orderFormDAO.querySuccess(of,map,row,page)));
		orderFormPage.setTotal(orderFormDAO.getTotalSuccess(of,map));
		int maxPageNum = (int)Math.ceil((orderFormPage.getTotal()*1.0)/row);
		orderFormPage.setMaxPageNum(maxPageNum);
		return orderFormPage;
	}

}
