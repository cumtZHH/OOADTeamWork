package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.rrz.polsm.dao.IOrderFormDAO;
import com.rrz.polsm.pojo.Address;
import com.rrz.polsm.pojo.OrderDetail;
import com.rrz.polsm.pojo.OrderForm;
import com.rrz.polsm.pojo.OrderState;
import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.pojo.User;


public class OrderFormDAOImpl extends BaseDAO implements IOrderFormDAO {


	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public List<OrderForm> query(OrderForm of, Map<String, String> map, int row, int page) {
		List<OrderForm> list = new ArrayList<>();
		String sql = "select orderform.orderFormId,remark,"
				+ "orderStateDesc,orderStateTime,"
				+ "userName,"
				+"phone.phoneTypeId,phoneTypeName "
				+ " from orderform,orderstate,userinfo,orderdetail,phone,phonetype "
				+ " where orderform.userId = userinfo.userId and orderstate.orderFormId = orderform.orderFormId and orderdetail.orderFormId = orderForm.orderFormId and orderdetail.phoneId = phone.phoneId and phone.phoneTypeId = phonetype.phonetypeId and"
				+ " orderStateTime in (select max(orderStateTime) from orderstate,orderform where orderform.orderFormId = orderstate.orderFormId GROUP BY orderform.orderFormId ) ";
		//��װ�û�����
		User user = of.getUser();
		if(user.getUserName()!=null&&!"".equals(user.getUserName())){
			sql +=" and userName like '%"+user.getUserName()+"%'";
		}
		//
		if(of.getOrderFormId()!=null&&!"".equals(of.getOrderFormId())){
			sql +=" and orderform.orderFormId = "+of.getOrderFormId();
		}
		if(of.getOrderFormState()!=-1){
			sql +=" and orderformState = "+of.getOrderState();
		}
		//
		List<OrderDetail> orderDetailList = of.getOrderDetailList();
		if(!orderDetailList.isEmpty()){
			OrderDetail orderDetail = orderDetailList.get(0);
			Phone phone = orderDetail.getPhone();
			if(phone.getPhoneTypeName()!=null&&!"".equals(phone.getPhoneTypeName())){
				sql +=" and phoneTypeName like '%"+phone.getPhoneTypeName()+"%'";
			}
			if(phone.getPhoneTypeId()!=-1){
				sql +=" and phonetype.phoneTypeId = "+phone.getPhoneTypeId();
			}
		}
		//
		OrderState orderState = of.getOrderState();
		if(orderState.getOrderStateDesc()!=null&&!"".equals(orderState.getOrderStateDesc())){
			sql +=" and orderStateDesc ='"+orderState.getOrderStateDesc()+"'";
		}
		//
		String orderStateTimeStart = map.get("orderStateTimeStart");
		String orderStateTimeEnd = map.get("orderStateTimeEnd");
		if(orderStateTimeStart!=null&&!"".equals(orderStateTimeStart)){
			sql += " and orderStateTime >= '"+orderStateTimeStart+"'";
		}
		if(orderStateTimeEnd!=null&&!"".equals(orderStateTimeEnd)){
			sql += " and orderStateTime <= '"+orderStateTimeEnd+"'";
		}
		sql +=" GROUP BY orderform.orderFormId";
		//
		if(row!=0&&page!=0){
			sql += " limit "+(page-1)*row+","+row;
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				OrderForm orderForm = new OrderForm();
				orderForm.setOrderFormId(rs.getString("orderform.orderFormId"));
				orderForm.setRemark(rs.getString("remark"));
				OrderState os = new OrderState();
				os.setOrderStateDesc(rs.getString("orderStateDesc"));
				String orderStateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("orderStateTime"));
				os.setOrderStateTime(orderStateTime);
				User u = new User();
				u.setUserName(rs.getString("userName"));
				orderForm.setUser(u);
				orderForm.setOrderState(os);
				list.add(orderForm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return list;
	}

	
	@Override
	public int getTotal(OrderForm of,Map<String,String> map) {
		int i= 0 ;
		String sql = "select count(orderform.orderFormId) "
			+ " from orderform,phone,phonetype,orderstate,address,userinfo,orderdetail "
			+ " where orderform.userId = userinfo.userId and orderstate.orderFormId = orderform.orderFormId and orderform.addressId = address.addressId and "
			+ " orderform.orderFormId =orderdetail.orderFormId and orderdetail.phoneId = phone.phoneId and phone.phoneTypeId = phonetype.phoneTypeId";
		User user = of.getUser();
		if(user.getUserName()!=null&&!"".equals(user.getUserName())){
			sql +=" and userName like '%"+user.getUserName()+"%'";
		}
		//
		if(of.getOrderFormId()!=null&&!"".equals(of.getOrderFormId())){
			sql +=" and orderform.orderFormId = "+of.getOrderFormId();
		}
		if(of.getOrderFormState()!=-1){
			sql +=" and orderFormState = "+of.getOrderState();
		}
		//
		List<OrderDetail> orderDetailList = of.getOrderDetailList();
		if(!orderDetailList.isEmpty()){
			OrderDetail orderDetail = orderDetailList.get(0);
			Phone phone = orderDetail.getPhone();
			if(phone.getPhoneTypeName()!=null&&!"".equals(phone.getPhoneTypeName())){
				sql +=" and phoneTypeName like '%"+phone.getPhoneTypeName()+"%'";
			}
			if(phone.getPhoneTypeId()!=-1){
				sql +=" and phonetype.phoneTypeId = "+phone.getPhoneTypeId();
			}
		}
		//
		OrderState orderState = of.getOrderState();
		if(orderState.getOrderStateDesc()!=null&&!"".equals(orderState.getOrderStateDesc())){
			sql +=" and orderStateDesc ='"+orderState.getOrderStateDesc()+"'";
		}
		//
		String orderStateTimeStart = map.get("orderStateTimeStart");
		String orderStateTimeEnd = map.get("orderStateTimeEnd");
		if(orderStateTimeStart!=null&&!"".equals(orderStateTimeStart)){
			sql += " and orderStateTime >= '"+orderStateTimeStart+"'";
		}
		if(orderStateTimeEnd!=null&&!"".equals(orderStateTimeEnd)){
			sql += " and orderStateTime <= '"+orderStateTimeEnd+"'";
		}
		sql +=" GROUP BY orderform.orderFormId";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll(con, ps, rs);
		}
		return i;
	}

	
	@Override
	public OrderForm queryByAttr(String str, Object obj) {
		OrderForm orderForm = null;
		String sql = "select receiverName,receiverTel,addressInfo,postcode,orderform.userId,remark,orderFormPrice from orderform,address "
			+ " where orderform.addressId = address.addressId and "+str+"="+"'"+obj+"'";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				Address address = new Address();
				address.setReceiverName(rs.getString("receiverName"));
				address.setReceiverTel(rs.getString("receiverTel"));
				address.setAddressInfo(rs.getString("addressInfo"));
				address.setPostcode(rs.getString("postcode"));
				orderForm = new OrderForm();
				orderForm.setUserId(rs.getInt("orderform.userId"));
				orderForm.setOrderFormId(obj.toString());
				orderForm.setRemark(rs.getString("remark"));
				orderForm.setOrderFormPrice(rs.getDouble("orderFormPrice"));
				orderForm.setAddress(address);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		// TODO Auto-generated method stub
		return orderForm;
	}

	
	@Override
	public void edit(OrderForm of) {
		String sql = "update orderform set addressId = ?, orderFormPrice = ? where orderformId = ?";
		update(sql, of.getAddressId(),of.getOrderFormPrice(),of.getOrderFormId());
	}


	@Override
	public void delete(Object obj) {
		String sql = "update orderForm set orderFormState = 1 where orderFormId = ?";
		//
		if(obj instanceof Integer){
			update(sql, obj);
		}
		//
		if(obj instanceof String []){
			String [] ids = (String[]) obj;
			for (String str : ids) {
				update(sql, str);
			}
		}
	}
	
	public List<OrderForm> queryHandle(OrderForm of, Map<String, String> map, int row, int page) {
		List<OrderForm> list = new ArrayList<>();
		String sql = "select orderform.orderFormId,remark,"
				+ "orderStateDesc,orderStateTime,"
				+ "userName,"
				+"phone.phoneTypeId,phoneTypeName "
				+ " from orderform,orderstate,userinfo,orderdetail,phone,phonetype "
				+ " where orderform.userId = userinfo.userId and orderstate.orderFormId = orderform.orderFormId and orderdetail.orderFormId = orderForm.orderFormId and orderdetail.phoneId = phone.phoneId and phone.phoneTypeId = phonetype.phonetypeId and "
				+ " orderStateTime in (select max(orderStateTime) from orderstate,orderform where orderform.orderFormId = orderstate.orderFormId GROUP BY orderform.orderFormId ) ";
		//
		User user = of.getUser();
		if(user.getUserName()!=null&&!"".equals(user.getUserName())){
			sql +=" and userName like '%"+user.getUserName()+"%'";
		}
		//
		if(of.getOrderFormId()!=null&&!"".equals(of.getOrderFormId())){
			sql +=" and orderform.orderFormId = "+of.getOrderFormId();
		}
		if(of.getOrderFormState()!=-1){
			sql +=" and orderFormState = "+of.getOrderState();
		}
		//
		List<OrderDetail> orderDetailList = of.getOrderDetailList();
		if(!orderDetailList.isEmpty()){
			OrderDetail orderDetail = orderDetailList.get(0);
			Phone phone = orderDetail.getPhone();
			if(phone.getPhoneTypeName()!=null&&!"".equals(phone.getPhoneTypeName())){
				sql +=" and phoneTypeName like '%"+phone.getPhoneTypeName()+"%'";
			}
			if(phone.getPhoneTypeId()!=-1){
				sql +=" and phonetype.phoneTypeId = "+phone.getPhoneTypeId();
			}
		}
		//
		OrderState orderState = of.getOrderState();
		if(orderState.getOrderStateDesc()!=null&&!"".equals(orderState.getOrderStateDesc())){
			sql +=" and orderStateDesc ='"+orderState.getOrderStateDesc()+"'";
		}else{
			sql +=" and orderStateDesc in ('������','�����˿���')";
		}
		//
		String orderStateTimeStart = map.get("orderStateTimeStart");
		String orderStateTimeEnd = map.get("orderStateTimeEnd");
		if(orderStateTimeStart!=null&&!"".equals(orderStateTimeStart)){
			sql += " and orderStateTime >= '"+orderStateTimeStart+"'";
		}
		if(orderStateTimeEnd!=null&&!"".equals(orderStateTimeEnd)){
			sql += " and orderStateTime <= '"+orderStateTimeEnd+"'";
		}
		sql +=" GROUP BY orderform.orderFormId";
		//
		if(row!=0&&page!=0){
			sql += " limit "+(page-1)*row+","+row;
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				OrderForm orderForm = new OrderForm();
				orderForm.setOrderFormId(rs.getString("orderform.orderFormId"));
				orderForm.setRemark(rs.getString("remark"));
				OrderState os = new OrderState();
				os.setOrderStateDesc(rs.getString("orderStateDesc"));
				String orderStateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("orderStateTime"));
				os.setOrderStateTime(orderStateTime);
				User u = new User();
				u.setUserName(rs.getString("userName"));
				orderForm.setUser(u);
				orderForm.setOrderState(os);
				list.add(orderForm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return list;
	}
	
	/**
	 * ��ô�������������
	 */
	@Override
	public int getTotalHandle(OrderForm of, Map<String, String> map) {
		int i = 0;
		String sql = "select count(orderform.orderFormId) "
			+ " from orderform,phone,phonetype,orderstate,address,userinfo,orderdetail "
			+ " where orderform.userId = userinfo.userId and orderstate.orderFormId = orderform.orderFormId and orderform.addressId = address.addressId and "
			+ " orderform.orderFormId =orderdetail.orderFormId and orderdetail.phoneId = phone.phoneId and phone.phoneTypeId = phonetype.phoneTypeId "
			+ " and orderStateTime in (select max(orderStateTime) from orderstate,orderform where orderform.orderFormId = orderstate.orderFormId GROUP BY orderform.orderFormId )";
		User user = of.getUser();
		if(user.getUserName()!=null&&!"".equals(user.getUserName())){
			sql +=" and userName like '%"+user.getUserName()+"%'";
		}
		//��װ������
		if(of.getOrderFormId()!=null&&!"".equals(of.getOrderFormId())){
			sql +=" and orderform.orderFormId = "+of.getOrderFormId();
		}
		if(of.getOrderFormState()!=-1){
			sql +=" and orderFormState = "+of.getOrderState();
		}
		//��װ����ϸ�ڱ�
		List<OrderDetail> orderDetailList = of.getOrderDetailList();
		if(!orderDetailList.isEmpty()){
			OrderDetail orderDetail = orderDetailList.get(0);
			Phone phone = orderDetail.getPhone();
			if(phone.getPhoneTypeName()!=null&&!"".equals(phone.getPhoneTypeName())){
				sql +=" and phoneTypeName like '%"+phone.getPhoneTypeName()+"%'";
			}
			if(phone.getPhoneTypeId()!=-1){
				sql +=" and phonetype.phoneTypeId = "+phone.getPhoneTypeId();
			}
		}
		//��װ����������
		OrderState orderState = of.getOrderState();
		if(orderState.getOrderStateDesc()!=null&&!"".equals(orderState.getOrderStateDesc())){
			sql +=" and orderStateDesc ='"+orderState.getOrderStateDesc()+"'";
		}else{
			sql +=" and orderStateDesc in ('������','�����˿���')";
		}
		//����ʱ��
		String orderStateTimeStart = map.get("orderStateTimeStart");
		String orderStateTimeEnd = map.get("orderStateTimeEnd");
		if(orderStateTimeStart!=null&&!"".equals(orderStateTimeStart)){
			sql += " and orderStateTime >= '"+orderStateTimeStart+"'";
		}
		if(orderStateTimeEnd!=null&&!"".equals(orderStateTimeEnd)){
			sql += " and orderStateTime <= '"+orderStateTimeEnd+"'";
		}
		sql +=" GROUP BY orderform.orderFormId";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll(con, ps, rs);
		}
		return i;
	}

	@Override
	public void add(OrderForm of) {
		// TODO Auto-generated method stub
	}

	@Override
	public List<OrderForm> querySuccess(OrderForm of, Map<String, String> map, int row, int page) {
		List<OrderForm> list = new ArrayList<>();
		String sql = "select orderform.orderFormId,remark,"
				+ "orderStateDesc,orderStateTime,"
				+ "userName,"
				+"phone.phoneTypeId,phoneTypeName "
				+ " from orderform,orderstate,userinfo,orderdetail,phone,phonetype "
				+ " where orderform.userId = userinfo.userId and orderstate.orderFormId = orderform.orderFormId and orderdetail.orderFormId = orderForm.orderFormId and orderdetail.phoneId = phone.phoneId and phone.phoneTypeId = phonetype.phonetypeId and "
				+ " orderStateTime in (select max(orderStateTime) from orderstate,orderform where orderform.orderFormId = orderstate.orderFormId GROUP BY orderform.orderFormId ) ";
		//��װ�û�����
		User user = of.getUser();
		if(user.getUserName()!=null&&!"".equals(user.getUserName())){
			sql +=" and userName like '%"+user.getUserName()+"%'";
		}
		//��װ������
		if(of.getOrderFormId()!=null&&!"".equals(of.getOrderFormId())){
			sql +=" and orderform.orderFormId = "+of.getOrderFormId();
		}
		if(of.getOrderFormState()!=-1){
			sql +=" and orderFormState = "+of.getOrderState();
		}
		//��װ����ϸ�ڱ�
		List<OrderDetail> orderDetailList = of.getOrderDetailList();
		if(!orderDetailList.isEmpty()){
			OrderDetail orderDetail = orderDetailList.get(0);
			Phone phone = orderDetail.getPhone();
			if(phone.getPhoneTypeName()!=null&&!"".equals(phone.getPhoneTypeName())){
				sql +=" and phoneTypeName like '%"+phone.getPhoneTypeName()+"%'";
			}
			if(phone.getPhoneTypeId()!=-1){
				sql +=" and phonetype.phoneTypeId = "+phone.getPhoneTypeId();
			}
		}
		//��װ����������
		OrderState orderState = of.getOrderState();
		if(orderState.getOrderStateDesc()!=null&&!"".equals(orderState.getOrderStateDesc())){
			sql +=" and orderStateDesc ='"+orderState.getOrderStateDesc()+"'";
		}else{
			sql +=" and orderStateDesc in ('���׳ɹ�','����ʧ��','����ȡ��')";
		}
		//����ʱ��
		String orderStateTimeStart = map.get("orderStateTimeStart");
		String orderStateTimeEnd = map.get("orderStateTimeEnd");
		if(orderStateTimeStart!=null&&!"".equals(orderStateTimeStart)){
			sql += " and orderStateTime >= '"+orderStateTimeStart+"'";
		}
		if(orderStateTimeEnd!=null&&!"".equals(orderStateTimeEnd)){
			sql += " and orderStateTime <= '"+orderStateTimeEnd+"'";
		}
		sql +=" GROUP BY orderform.orderFormId";
		//��ҳ
		if(row!=0&&page!=0){
			sql += " limit "+(page-1)*row+","+row;
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				OrderForm orderForm = new OrderForm();
				orderForm.setOrderFormId(rs.getString("orderform.orderFormId"));
				orderForm.setRemark(rs.getString("remark"));
				OrderState os = new OrderState();
				os.setOrderStateDesc(rs.getString("orderStateDesc"));
				String orderStateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("orderStateTime"));
				os.setOrderStateTime(orderStateTime);
				User u = new User();
				u.setUserName(rs.getString("userName"));
				orderForm.setUser(u);
				orderForm.setOrderState(os);
				list.add(orderForm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return list;
	}
	
	public int getTotalSuccess(OrderForm of, Map<String, String> map) {
		int i = 0;
		String sql = "select count(orderform.orderFormId) "
			+ " from orderform,phone,phonetype,orderstate,address,userinfo,orderdetail "
			+ " where orderform.userId = userinfo.userId and orderstate.orderFormId = orderform.orderFormId and orderform.addressId = address.addressId and "
			+ " orderform.orderFormId =orderdetail.orderFormId and orderdetail.phoneId = phone.phoneId and phone.phoneTypeId = phonetype.phoneTypeId "
			+ " and orderStateTime in (select max(orderStateTime) from orderstate,orderform where orderform.orderFormId = orderstate.orderFormId GROUP BY orderform.orderFormId )";
		User user = of.getUser();
		if(user.getUserName()!=null&&!"".equals(user.getUserName())){
			sql +=" and userName like '%"+user.getUserName()+"%'";
		}
		//��װ������
		if(of.getOrderFormId()!=null&&!"".equals(of.getOrderFormId())){
			sql +=" and orderform.orderFormId = "+of.getOrderFormId();
		}
		if(of.getOrderFormState()!=-1){
			sql +=" and orderFormState = "+of.getOrderState();
		}
		//��װ����ϸ�ڱ�
		List<OrderDetail> orderDetailList = of.getOrderDetailList();
		if(!orderDetailList.isEmpty()){
			OrderDetail orderDetail = orderDetailList.get(0);
			Phone phone = orderDetail.getPhone();
			if(phone.getPhoneTypeName()!=null&&!"".equals(phone.getPhoneTypeName())){
				sql +=" and phoneTypeName like '%"+phone.getPhoneTypeName()+"%'";
			}
			if(phone.getPhoneTypeId()!=-1){
				sql +=" and phonetype.phoneTypeId = "+phone.getPhoneTypeId();
			}
		}
		//��װ����������
		OrderState orderState = of.getOrderState();
		if(orderState.getOrderStateDesc()!=null&&!"".equals(orderState.getOrderStateDesc())){
			sql +=" and orderStateDesc ='"+orderState.getOrderStateDesc()+"'";
		}else{
			sql +=" and orderStateDesc in ('���׳ɹ�','����ʧ��','����ȡ��')";
		}
		//����ʱ��
		String orderStateTimeStart = map.get("orderStateTimeStart");
		String orderStateTimeEnd = map.get("orderStateTimeEnd");
		if(orderStateTimeStart!=null&&!"".equals(orderStateTimeStart)){
			sql += " and orderStateTime >= '"+orderStateTimeStart+"'";
		}
		if(orderStateTimeEnd!=null&&!"".equals(orderStateTimeEnd)){
			sql += " and orderStateTime <= '"+orderStateTimeEnd+"'";
		}
		sql +=" GROUP BY orderform.orderFormId";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll(con, ps, rs);
		}
		return i;
	}

}
