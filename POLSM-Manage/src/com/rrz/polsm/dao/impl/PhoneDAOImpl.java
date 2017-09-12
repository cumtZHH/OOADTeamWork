package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.rrz.polsm.dao.IPhoneDAO;
import com.rrz.polsm.pojo.Phone;


public class PhoneDAOImpl extends BaseDAO implements IPhoneDAO{
	/**
	 * �������
	 */
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	/**
	 * ����������ѯ�����ֻ�
	 */
	@Override
	public List<Phone> query(Phone p,Map<String,Integer> map, int row, int page) {
		List<Phone> phones = new ArrayList<>();
		String sql = "select phoneId,phone.phoneTypeId,phonePrice,color,capacity,picture,phoneDesc,phoneState,phoneTypeName,"
		+ "size,weight,callTime,liveTime,cpu,pixel,system,phoneTypeTime,mainPicture,net,phonePrice,phoneTypeState from phone,"
		+ "phonetype where phone.phoneTypeId = phonetype.phoneTypeId ";
		//��Ӳ�ѯ��ʽ�ַ���
		int phoneId = p.getPhoneId();
		String phoneTypeName = p.getPhoneTypeName();
		int priceStart = map.get("priceStart");
		int priceEnd = map.get("priceEnd");
		int state = p.getPhoneState();
		if(phoneId!=-1){
			sql +=" and phoneId ="+phoneId;
		}
		if(phoneTypeName!=null&&!phoneTypeName.equals("")){
			sql += " and phoneTypeName = '"+phoneTypeName+"'";
		}
		if(priceStart!=0){
			sql += " and phonePrice >="+priceStart;
		}
		if(priceEnd!=0){
			sql +=" and phonePrice <="+priceEnd;
		}
		if(state!=-1){
			sql +=" and phoneState = "+state;
		}
		sql +=" order by phoneId";
		//��ҳ
		if(row!=0&&page!=0){
			sql += " limit "+(page-1)*row+","+row;
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Phone phone = new Phone();
				phone.setPhoneId(rs.getInt("phoneId"));
				phone.setPhoneTypeId(rs.getInt("phone.phoneTypeId"));
				phone.setPhonePrice(rs.getDouble("phonePrice"));
				phone.setColor(rs.getString("color"));
				phone.setCapacity(rs.getString("capacity"));
				phone.setPicture(rs.getString("picture"));
				phone.setPhoneDesc(rs.getString("phoneDesc"));
				phone.setPhoneState(rs.getInt("phoneState"));
				phone.setPhoneTypeName(rs.getString("phoneTypeName"));
				phone.setSize(rs.getString("size"));
				phone.setWeight(rs.getString("weight"));
				phone.setCallTime(rs.getString("callTime"));
				phone.setLiveTime(rs.getString("liveTime"));
				phone.setCpu(rs.getString("cpu"));
				phone.setPixel(rs.getString("pixel"));
				phone.setSystem(rs.getString("system"));
				phone.setPhoneTypeTime(rs.getString("phoneTypeTime"));
				phone.setMainPicture(rs.getString("mainPicture"));
				phone.setNet(rs.getString("net"));
				phone.setPhonePrice(rs.getDouble("phonePrice"));
				phone.setPhoneTypeState(rs.getInt("phoneTypeState"));
				phones.add(phone);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return phones;
	}

	/**
	 * ���ݲ�ѯ��������ֻ�����
	 */
	@Override
	public int getTotal(Phone p,Map<String,Integer> map) {
		String sql = "select count(phoneId) from phone,phonetype where phone.phonetypeId = phonetype.phoneTypeId ";
		//��Ӳ�ѯ��ʽ�ַ���
		int phoneId = p.getPhoneId();
		String phoneTypeName = p.getPhoneTypeName();
		int priceStart = map.get("priceStart");
		int priceEnd = map.get("priceEnd");
		int state = p.getPhoneState();
		if(phoneId!=-1){
			sql +=" and phoneId ="+phoneId;
		}
		if(phoneTypeName!=null&&!phoneTypeName.equals("")){
			sql += " and phoneTypeName = '"+phoneTypeName+"'";
		}
		if(priceStart!=0){
			sql += " and phonePrice >="+priceStart;
		}
		if(priceEnd!=0){
			sql +=" and phonePrice <="+priceEnd;
		}
		if(state!=-1){
			sql +=" and phoneState = "+state;
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return 0;
	}

	/**
	 * �������Բ����ֻ�
	 */
	@Override
	public Phone queryByAttr(String str,Object obj) {
		Phone phone = null;
		String sql = "select phoneId,phone.phoneTypeId,phonePrice,color,capacity,picture,phoneDesc,phoneState,phoneTypeName,"
		+ "size,weight,callTime,liveTime,cpu,pixel,system,phoneTypeTime,mainPicture,net,phonePrice,phoneTypeState from phone,phonetype where phone.phoneTypeId = phonetype.phoneTypeId and "
		+str+" ='"+obj+"'";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				phone = new Phone();
				phone.setPhoneId(rs.getInt("phoneId"));
				phone.setPhoneTypeId(rs.getInt("phone.phoneTypeId"));
				phone.setPhonePrice(rs.getDouble("phonePrice"));
				phone.setColor(rs.getString("color"));
				phone.setCapacity(rs.getString("capacity"));
				phone.setPicture(rs.getString("picture"));
				phone.setPhoneDesc(rs.getString("phoneDesc"));
				phone.setPhoneState(rs.getInt("phoneState"));
				phone.setPhoneTypeName(rs.getString("phoneTypeName"));
				phone.setSize(rs.getString("size"));
				phone.setWeight(rs.getString("weight"));
				phone.setCallTime(rs.getString("callTime"));
				phone.setLiveTime(rs.getString("liveTime"));
				phone.setCpu(rs.getString("cpu"));
				phone.setPixel(rs.getString("pixel"));
				phone.setSystem(rs.getString("system"));
				phone.setPhoneTypeTime(rs.getString("phoneTypeTime"));
				phone.setMainPicture(rs.getString("mainPicture"));
				phone.setNet(rs.getString("net"));
				phone.setPhonePrice(rs.getDouble("phonePrice"));
				phone.setPhoneTypeState(rs.getInt("phoneTypeState"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return phone;
	}

	/**
	 * �޸��ֻ�����
	 */
	@Override
	public void edit(Phone p) {
		String sql = "update phone set phone.phoneTypeId=?,phonePrice=?,color=?,capacity=?,phoneDesc=?,phoneState=? where phoneId = ?";
		update(sql, p.getPhoneTypeId(),p.getPhonePrice(),p.getColor(),p.getCapacity(),p.getPhoneDesc(),p.getPhoneState(),p.getPhoneId());
	}

	/**
	 * ����ֻ�
	 */
	@Override
	public void add(Phone p) {
		String sql = "insert into phone(phoneTypeId,phonePrice,color,capacity,picture,phoneDesc,phoneState) values(?,?,?,?,?,?,0)";
		update(sql, p.getPhoneTypeId(),p.getPhonePrice(),p.getColor(),p.getCapacity(),p.getPicture(),p.getPhoneDesc());
	}
	/**
	 * ɾ���ֻ�
	 */
	public void delete(Object obj){
		String sql = "update phone set phoneState = 1 where phoneId = ?";
		//�ж��ǲ���int����
		if(obj instanceof Integer){
			update(sql, obj);
		}
		//�ж��ǲ���String��������
		if(obj instanceof String []){
			String [] ids = (String[]) obj;
			for (String str : ids) {
				update(sql, str);
			}
		}
	}
	
	
}
