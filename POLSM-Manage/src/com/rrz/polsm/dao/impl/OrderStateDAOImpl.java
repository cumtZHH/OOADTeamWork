package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.rrz.polsm.dao.IOrderStateDAO;
import com.rrz.polsm.pojo.OrderState;

public class OrderStateDAOImpl extends BaseDAO implements IOrderStateDAO{
	/**
	 * 定义变量
	 */
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public void add(OrderState os) {
		String sql = "insert into orderstate(orderFormId,orderStateDesc,orderStateTime) values(?,?,?)";
		update(sql, os.getOrderFormId(),os.getOrderStateDesc(),os.getOrderStateTime());
	}

	@Override
	public List<OrderState> queryByOrderFormId(String orderFormId) {
		ArrayList<OrderState> list = new ArrayList<>();
		String sql = "select orderStateDesc,orderStateTime from orderstate where orderFormId = '"+orderFormId+"'";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				OrderState os = new OrderState();
				os.setOrderStateDesc(rs.getString("orderStateDesc"));
				String orderStateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("orderStateTime"));
				os.setOrderStateTime(orderStateTime);
				list.add(os);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return list;
	}

}
