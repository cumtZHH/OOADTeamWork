package com.rrz.polsm.service;

import java.util.List;

import com.rrz.polsm.pojo.Address;

public interface IAddressService {
	
	List<Address> query(Address a,int row);
	Address queryById(int id);
	void edit(Address a);
	void add(Address a);
	void delete(Address addressdId);
	int queryLatest();

}
