package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.rrz.polsm.dao.IOrderDetailDAO;
import com.rrz.polsm.pojo.OrderDetail;
import com.rrz.polsm.pojo.OrderForm;
import com.rrz.polsm.pojo.Phone;

public class OrderDetailDAOImpl extends BaseDAO implements IOrderDetailDAO {
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	
	@Override
	public List<OrderForm> query(List<OrderForm> list) {
		List<OrderForm> ofList = new ArrayList<>();
		for (OrderForm orderForm : list) {
			String id = orderForm.getOrderFormId();
			List<OrderDetail> odList = new ArrayList<>();
			String sql = "select"
				+ " phone.phoneId,phonePrice,color,capacity,picture,"
				+ " phoneTypeName"
				+ " from orderdetail,phone,phonetype"
				+ " where orderdetail.phoneId = phone.phoneId and phone.phonetypeId = phonetype.phoneTypeId and orderdetail.orderFormId="+id;
			try {
				con = getCon();
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()){
					Phone phone = new Phone();
					phone.setPhoneId(rs.getInt("phone.phoneId"));
					phone.setPhonePrice(rs.getDouble("phonePrice"));
					phone.setColor(rs.getString("color"));
					phone.setCapacity(rs.getString("capacity"));
					phone.setPicture(rs.getString("picture"));
					phone.setPhoneTypeName(rs.getString("phoneTypeName"));
					OrderDetail orderDetail = new OrderDetail();
					orderDetail.setPhone(phone);
					odList.add(orderDetail);
				}
				orderForm.setOrderDetailList(odList);
				ofList.add(orderForm);
			} catch (Exception e) {
				
			}finally {
				closeAll(con, ps, rs);
			}
		}
		return ofList;
	}
	
	
	@Override
	public List<OrderDetail> queryByOrderFormId(String orderFormId) {
		ArrayList<OrderDetail> list = new ArrayList<>();
		String sql = "select"
			+ " phone.phoneId,phonePrice,color,capacity,picture,"
			+ " phoneTypeName"
			+ " from orderdetail,phone,phonetype"
			+ " where orderdetail.phoneId = phone.phoneId and phone.phonetypeId = phonetype.phoneTypeId and orderdetail.orderFormId='"+orderFormId+"'";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Phone phone = new Phone();
				phone.setPhoneId(rs.getInt("phone.phoneId"));
				phone.setPhonePrice(rs.getDouble("phonePrice"));
				phone.setColor(rs.getString("color"));
				phone.setCapacity(rs.getString("capacity"));
				phone.setPicture(rs.getString("picture"));
				phone.setPhoneTypeName(rs.getString("phoneTypeName"));
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setPhone(phone);
				list.add(orderDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return list;
	}

}
