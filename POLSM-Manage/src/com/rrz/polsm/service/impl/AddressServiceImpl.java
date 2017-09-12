package com.rrz.polsm.service.impl;

import java.util.List;

import com.rrz.polsm.dao.IAddressDAO;
import com.rrz.polsm.dao.impl.AddressDAOImpl;
import com.rrz.polsm.dao.impl.BaseDAO;
import com.rrz.polsm.pojo.Address;
import com.rrz.polsm.service.IAddressService;

public class AddressServiceImpl extends BaseDAO implements IAddressService {
	/**
	 * ��������
	 */
	private IAddressDAO addressDAO = new AddressDAOImpl();
	
	/**
	 * �����ջ��ַ
	 */
	@Override
	public List<Address> query(Address a, int row) {
		return addressDAO.query(a, row);
	}
	
	/**
	 * �༭�ջ��ַ
	 */
	@Override
	public void edit(Address a) {
		addressDAO.edit(a);
	}
	
	/**
	 * ����ջ��ַ
	 */
	@Override
	public void add(Address a) {
		addressDAO.add(a);
	}
	
	/**
	 * ɾ���ջ��ַ
	 */
	@Override
	public void delete(Address addressdId) {
		addressDAO.delete(addressdId);
	}

	@Override
	public Address queryById(int id) {
		return addressDAO.queryById(id);
	}
	/**
	 * ���Ҹ���ӵ��û��ջ���ַ
	 */
	public int queryLatest() {
		return addressDAO.queryLatest();
	}

}
