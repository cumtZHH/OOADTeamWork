package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.rrz.polsm.dao.IPhoneTypeDAO;
import com.rrz.polsm.pojo.PhoneType;


public class PhoneTypeDAOImpl extends BaseDAO implements IPhoneTypeDAO {
	/**
	 * �������
	 */
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	/**
	 * �����ֻ����
	 */
	@Override
	public List<PhoneType> query(PhoneType pt,Map<String,String> map,int row,int page){
		
		List<PhoneType> phoneTypes = new ArrayList<>();
		String sql = "select phoneTypeId,phoneTypeName,size,weight,callTime,liveTime,cpu,pixel,system,phoneTypeTime,"
				+ "mainPicture,net,phoneTypePrice,phoneTypeState from phonetype where 1=1 ";
		//��Ӳ�ѯ��ʽ�ַ���
		if(pt!=null){
			if(pt.getPhoneTypeId()!=-1){
				sql += " and phoneTypeId = "+pt.getPhoneTypeId();
			}
			if(pt.getSize()!=null&&!pt.getSize().equals("-1")){
				sql += " and size = '"+pt.getSize()+"'";
			}
			if(pt.getPhoneTypeState()!=-1){
				sql += " and phoneTypeState = "+pt.getPhoneTypeState();
			}
			if(pt.getCpu()!=null&&!"".equals(pt.getCpu())&&!pt.getCpu().equals("-1")){
				sql += " and cpu = '"+pt.getCpu()+"'";
			}
			if(pt.getPixel()!=null&&!"".equals(pt.getPixel())&&!pt.getPixel().equals("-1")){
				sql += " and pixel = '"+pt.getPixel()+"'";
			}
		}
		sql +=" order by phoneTypeId";
		//��ҳ
		if(row!=0&&page!=0){
			sql += " limit "+(page-1)*row+","+row;
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				PhoneType p = new PhoneType();
				p.setPhoneTypeId(rs.getInt("phoneTypeId"));
				p.setPhoneTypeName(rs.getString("phoneTypeName"));
				p.setSize(rs.getString("size"));
				p.setWeight(rs.getString("weight"));
				p.setCallTime(rs.getString("callTime"));
				p.setLiveTime(rs.getString("liveTime"));
				p.setCpu(rs.getString("cpu"));
				p.setPixel(rs.getString("pixel"));
				p.setSystem(rs.getString("system"));
				p.setPhoneTypeTime(rs.getString("phoneTypeTime"));
				p.setMainPicture(rs.getString("mainPicture"));
				p.setNet(rs.getString("net"));
				p.setPhoneTypePrice(rs.getDouble("phoneTypePrice"));
				p.setPhoneTypeState(rs.getInt("phoneTypeState"));
				phoneTypes.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return phoneTypes;
	}

	/**
	 * ���ݲ�ѯ������������
	 */
	@Override
	public int getTotal(PhoneType pt) {
		String sql = "select count(phoneTypeId) from phonetype where 1=1 ";
		//��Ӳ�ѯ��ʽ�ַ���
		if(pt!=null){
			if(pt.getPhoneTypeId()!=-1){
				sql += " and phoneTypeId = "+pt.getPhoneTypeId();
			}
			if(pt.getSize()!=null&&!pt.getSize().equals("-1")){
				sql += " and size = '"+pt.getSize()+"'";
			}
			if(pt.getPhoneTypeState()!=-1){
				sql += " and phoneTypeState = "+pt.getPhoneTypeState();
			}
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
	 * �����ֻ����Բ����ֻ�����
	 */
	@Override
	public PhoneType queryByAttr(String str, Object obj) {
		PhoneType pt = null;
		String sql = "select phoneTypeId,phoneTypeName,size,weight,callTime,liveTime,cpu,pixel,system,phoneTypeTime,"
				+ "mainPicture,net,phoneTypePrice,phoneTypeState from phonetype where "+str+" = '"+obj+"'";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				pt = new PhoneType();
				pt.setPhoneTypeId(rs.getInt("phoneTypeId"));
				pt.setPhoneTypeName(rs.getString("phoneTypeName"));
				pt.setSize(rs.getString("size"));
				pt.setWeight(rs.getString("weight"));
				pt.setCallTime(rs.getString("callTime"));
				pt.setLiveTime(rs.getString("liveTime"));
				pt.setCpu(rs.getString("cpu"));
				pt.setPixel(rs.getString("pixel"));
				pt.setSystem(rs.getString("system"));
				pt.setPhoneTypeTime(rs.getString("phoneTypeTime"));
				pt.setMainPicture(rs.getString("mainPicture"));
				pt.setNet(rs.getString("net"));
				pt.setPhoneTypePrice(rs.getDouble("phoneTypePrice"));
				pt.setPhoneTypeState(rs.getInt("phoneTypeState"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, rs);
		}
		return pt;
	}

	/**
	 * �޸��ֻ�������Ϣ
	 */
	@Override
	public void edit(PhoneType pt) {
		String sql = "update phonetype set phoneTypeName=?,size=?,weight=?,callTime=?,liveTime=?,cpu=?,pixel=?,"
			+ "system=?,phoneTypeTime=?,mainPicture=?,net=?,phoneTypePrice=?,phoneTypeState=? where phoneTypeId = ?";
		update(sql,pt.getPhoneTypeName(),pt.getSize(),pt.getWeight(),pt.getCallTime(),pt.getLiveTime(),pt.getCpu(),pt.getPixel(),pt.getSystem(),
		pt.getPhoneTypeTime(),pt.getMainPicture(),pt.getNet(),pt.getPhoneTypePrice(),pt.getPhoneTypeState(),pt.getPhoneTypeId());
	
	}

	/**
	 * ���һ���ֻ�����
	 */
	@Override
	public void add(PhoneType pt) {
		String sql = "insert into phonetype(phoneTypeName,size,weight,callTime,liveTime,cpu,pixel,"
		+ "system,phoneTypeTime,mainPicture,net,phoneTypePrice,phoneTypeState) values(?,?,?,?,?,?,?,?,?,?,?,?,0)";
		update(sql, pt.getPhoneTypeName(),pt.getSize(),pt.getWeight(),pt.getCallTime(),pt.getLiveTime(),pt.getCpu(),
		pt.getPixel(),pt.getSystem(),pt.getPhoneTypeName(),pt.getMainPicture(),pt.getNet(),pt.getPhoneTypePrice());
	}
	/**
	 * ɾ���ֻ�����
	 */
	public void delete(Object obj){
		String sql = "update phonetype set phoneTypeState = 1 where phoneTypeId = ?";
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
