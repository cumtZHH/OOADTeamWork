package com.rrz.polsm.service.impl;

import java.util.List;

import com.rrz.polsm.dao.IAddressDAO;
import com.rrz.polsm.dao.impl.AddressDAOImpl;
import com.rrz.polsm.dao.impl.BaseDAO;
import com.rrz.polsm.pojo.Address;
import com.rrz.polsm.service.IAddressService;

public class AddressServiceImpl extends BaseDAO implements IAddressService {
	/**
	 * 创建对象
	 */
	private IAddressDAO addressDAO = new AddressDAOImpl();
	
	/**
	 * 查找收获地址
	 */
	@Override
	public List<Address> query(Address a, int row) {
		return addressDAO.query(a, row);
	}
	
	/**
	 * 编辑收获地址
	 */
	@Override
	public void edit(Address a) {
		addressDAO.edit(a);
	}
	
	/**
	 * 添加收获地址
	 */
	@Override
	public void add(Address a) {
		addressDAO.add(a);
	}
	
	/**
	 * 删除收获地址
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
	 * 查找刚添加的用户收货地址
	 */
	public int queryLatest() {
		return addressDAO.queryLatest();
	}

}
