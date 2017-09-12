package com.rrz.polsm.service.impl;

import java.util.Map;

import com.rrz.polsm.dao.IPhoneDAO;
import com.rrz.polsm.dao.impl.PhoneDAOImpl;
import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.service.IPhoneService;
import com.rrz.polsm.util.Page;


public class PhoneServiceImpl implements IPhoneService {
	/**
	 * ��������
	 */
	private IPhoneDAO phoneDAO = new PhoneDAOImpl();

	/**
	 * ����������Ӳ�ѯ�ֻ�
	 */
	@Override
	public Page<Phone> query(Phone pt,Map<String,Integer> map, int row, int page) {
		Page<Phone> phonePage = new Page<>();
		phonePage.setRows(phoneDAO.query(pt,map,row,page));
		phonePage.setTotal(phoneDAO.getTotal(pt,map));
		int maxPageNum = (int)Math.ceil((phonePage.getTotal()*1.0)/row);
		phonePage.setMaxPageNum(maxPageNum);
		return phonePage;
	}

	/**
	 * �������Բ����ֻ�
	 */
	@Override
	public Phone queryByAttr(String str, Object obj) {
		return phoneDAO.queryByAttr(str, obj);
	}
	
	/**
	 * �޸��ֻ���Ϣ
	 */
	@Override
	public void edit(Phone p) {
		phoneDAO.edit(p);
	}

	/**
	 * ����ֻ�
	 */
	@Override
	public void add(Phone p) {
		phoneDAO.add(p);
	}

	/**
	 * ɾ���ֻ�
	 */
	@Override
	public void delete(Object obj) {
		phoneDAO.delete(obj);
	}


}
