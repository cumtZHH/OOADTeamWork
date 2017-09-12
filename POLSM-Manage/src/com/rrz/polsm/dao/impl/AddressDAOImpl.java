package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.rrz.polsm.dao.IAddressDAO;
import com.rrz.polsm.pojo.Address;

public class AddressDAOImpl extends BaseDAO implements IAddressDAO {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public List<Address> query(Address a, int row) {
		List<Address> list = new ArrayList<>();
		String sql = "select AddressId,receiverName,receiverTel,addressInfo,postcode from address where addressState = 0 and userId = "+a.getUserId();
		if(row==0){
			sql +=" limit 0,4";
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Address address = new Address();
				address.setAddressId(rs.getInt("AddressId"));
				address.setReceiverName(rs.getString("receiverName"));
				address.setReceiverTel(rs.getString("receiverTel"));
				address.setAddressInfo(rs.getString("addressInfo"));
				address.setPostcode(rs.getString("postcode"));
				address.setUserId(a.getUserId());
				list.add(address);
			}
		} catch (Exception e) {
			
		}finally {
			closeAll(con, ps, rs);
		}
		return list;
	}
	
	
	@Override
	public void edit(Address a) {
		
		String sql = "update address set receiverName = ?,receiverTel = ?,addressInfo = ?,postcode = ? where AddressId = "+a.getAddressId();
		update(sql, a.getReceiverName(),a.getReceiverTel(),a.getAddressInfo(),a.getPostcode());
	}
	

	@Override
	public void add(Address a) {
		
		String sql = "insert into address(receiverName,receiverTel,userId,addressInfo,postcode,addressState) values(?,?,?,?,?,1)";
		update(sql, a.getReceiverName(),a.getReceiverTel(),a.getUserId(),a.getAddressInfo(),a.getPostcode());

	}
	

	@Override
	public void delete(Address addressdId) {
		
		String sql = "update address set addressState = 1 where addressId = ?";
		update(sql, addressdId);

	}
	@Override
	public Address queryById(int id) {
		Address address = null;
		String sql = "select receiverName,receiverTel,userId,addressInfo,postcode from address where addressState = 0 and addressId = "+id;
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				address = new Address();
				address.setReceiverName(rs.getString("receiverName"));
				address.setReceiverTel(rs.getString("receiverTel"));
				address.setAddressInfo(rs.getString("addressInfo"));
				address.setPostcode(rs.getString("postcode"));
				address.setUserId(rs.getInt("userId"));
			}
		} catch (Exception e) {
			
		}finally {
			closeAll(con, ps, rs);
		}
		return address;
	}
	
	/**
	 * 
	 */
	@Override
	public int queryLatest() {
		String sql = "select addressId from address where addressState = 1 order by addressId desc limit 1";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				return rs.getInt("addressId");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return 0;
	}

}
