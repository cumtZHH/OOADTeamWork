package com.rrz.polsm.service.impl;

import java.util.Map;

import com.rrz.polsm.dao.IPhoneTypeDAO;
import com.rrz.polsm.dao.impl.PhoneTypeDAOImpl;
import com.rrz.polsm.pojo.PhoneType;
import com.rrz.polsm.service.IPhoneTypeService;
import com.rrz.polsm.util.Page;


public class PhoneTypeServiceImpl implements IPhoneTypeService{
	
	/**
	 * ��������
	 */
	private IPhoneTypeDAO phoneTypeDAO = new PhoneTypeDAOImpl();

	/**
	 * ���ݲ�ѯ���������ֻ����
	 */
	@Override
	public Page<PhoneType> query(PhoneType pt,Map<String,String> map,int row,int page) {
		Page<PhoneType> phoneTypePage = new Page<>();
		phoneTypePage.setRows(phoneTypeDAO.query(pt,map,row,page));
		phoneTypePage.setTotal(phoneTypeDAO.getTotal(pt));
		int maxPageNum = (int)Math.ceil((phoneTypePage.getTotal()*1.0)/row);
		phoneTypePage.setMaxPageNum(maxPageNum);
		return phoneTypePage;
	}

	/**
	 * �������Բ����ֻ�����
	 */
	@Override
	public PhoneType queryByAttr(String str, Object obj) {
		// TODO Auto-generated method stub
		return phoneTypeDAO.queryByAttr(str, obj);
	}

	/**
	 * �޸��ֻ�������Ϣ
	 */
	@Override
	public void edit(PhoneType pt) {
		// TODO Auto-generated method stub
		phoneTypeDAO.edit(pt);
	}

	/**
	 * ����ֻ�����
	 */
	@Override
	public void add(PhoneType pt) {
		// TODO Auto-generated method stub
		phoneTypeDAO.add(pt);
	}

	/**
	 * ɾ���ֻ�����
	 */
	@Override
	public void delete(Object obj) {
		phoneTypeDAO.delete(obj);
	}

}
