package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.rrz.polsm.dao.IUserDAO;
import com.rrz.polsm.pojo.User;


public class UserDAOImpl extends BaseDAO implements IUserDAO{
	/**
	 * �������
	 */
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	/**
	 * ��ҳ��������ѯ�û�
	 */
	@Override
	public List<User> query(User u, Map<String, String> map, int row, int page) {
		List<User> list = new ArrayList<>();
		String sql = "select userId,loginName,personPicture,userName,passWord,gender,passQuestion,passAnswer,email,tel,IDCard,money,consume,"
	+ "registerTime,userInfo.levelId,userState,levelName,levelDesc,discount from userinfo,level where userinfo.levelId = level.levelId";
		//����
		if(u.getUserId()!=-1){
			sql += " and userId = "+u.getUserId();
		}
		if(u.getLoginName()!=null&&!"".equals(u.getLoginName())){
			sql += " and loginName like '%"+u.getLoginName()+"%'";
		}
		if(u.getUserName()!=null&&!"".equals(u.getUserName())){
			sql += " and userName like '%"+u.getUserName()+"%'";
		}
		if(u.getTel()!=null&&!"".equals(u.getTel())){
			sql += " and tel like '%"+u.getTel()+"%'";
		}
		if(u.getUserState()!=-1){
			sql +=" and userState = "+u.getUserState();
		}
		String consumeStart = map.get("consumeStart");
		String consumeEnd = map.get("consumeEnd");
		String registerTimeStart = map.get("registerTimeStart");
		String registerTimeEnd = map.get("registerTimeEnd");
		if(consumeStart!=null&&!"".equals(consumeStart)){
			sql += " and consume >= "+consumeStart;
		}
		if(consumeEnd!=null&&!"".equals(consumeEnd)){
			sql += " and consume <= "+consumeEnd;
		}
		if(registerTimeStart!=null&&!"".equals(u.getRegisterTime())){
			sql += " and registerTime >= '"+registerTimeStart+"'";
		}
		if(registerTimeEnd!=null&&!"".equals(u.getRegisterTime())){
			sql += " and registerTime <= '"+registerTimeEnd+"'";
		}
		sql +=" order by userId";
		//��ҳ
		if(row!=0&&page!=0){
			sql += " limit "+(page-1)*row+","+row;
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				User user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setLoginName(rs.getString("loginName"));
				user.setPersonPicture(rs.getString("personPicture"));
				user.setUserName(rs.getString("userName"));
				user.setPassWord(rs.getString("passWord"));
				user.setGender(rs.getInt("gender"));
				user.setPassQuestion(rs.getString("passQuestion"));
				user.setPassAnswer(rs.getString("passAnswer"));
				user.setEmail(rs.getString("email"));
				user.setTel(rs.getString("tel"));
				user.setIDCard(rs.getString("IDCard"));
				user.setMoney(rs.getDouble("money"));
				user.setConsume(rs.getDouble("consume"));
				String registerTime = new SimpleDateFormat("yyy-MM-dd HH:mm:ss").format(rs.getTimestamp("registerTime"));
				user.setRegisterTime(registerTime);
				user.setLevelId(rs.getInt("userinfo.levelId"));
				user.setUserState(rs.getInt("userState"));
				user.setLevelName(rs.getString("levelName"));
				user.setLevelDesc(rs.getString("levelDesc"));
				user.setDiscount(rs.getDouble("discount"));
				list.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			closeAll(con, ps, rs);
		}
		return list;
	}

	/**
	 * ��÷�ҳ��ѯ�û�������
	 */
	@Override
	public int getTotal(User u,Map<String, String> map) {
		String sql = "select count(userId) from userinfo,level where userinfo.levelId = level.levelId";
		//����
		if(u.getUserId()!=-1){
			sql += " and userId = "+u.getUserId();
		}
		if(u.getLoginName()!=null&&!"".equals(u.getLoginName())){
			sql += " and loginName like '%"+u.getLoginName()+"%'";
		}
		if(u.getUserName()!=null&&!"".equals(u.getUserName())){
			sql += " and userName like '%"+u.getUserName()+"%'";
		}
		if(u.getTel()!=null&&!"".equals(u.getTel())){
			sql += " and tel like '%"+u.getTel()+"%'";
		}
		if(u.getUserState()!=-1){
			sql +=" and userState = "+u.getUserState();
		}
		String consumeStart = map.get("consumeStart");
		String consumeEnd = map.get("consumeEnd");
		String registerTimeStart = map.get("registerTimeStart");
		String registerTimeEnd = map.get("registerTimeEnd");
		if(consumeStart!=null&&!"".equals(consumeStart)){
			sql += " and consume >= "+consumeStart;
		}
		if(consumeEnd!=null&&!"".equals(consumeEnd)){
			sql += " and consume <= "+consumeEnd;
		}
		if(registerTimeStart!=null&&!"".equals(u.getRegisterTime())){
			sql += " and registerTime >= '"+registerTimeStart+"'";
		}
		if(registerTimeEnd!=null&&!"".equals(u.getRegisterTime())){
			sql += " and registerTime <= '"+registerTimeEnd+"'";
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			closeAll(con, ps, rs);
		}
		return 0;
	}
	/**
	 * �������Բ����û�
	 */
	@Override
	public User queryByAttr(String str, Object obj) {
		User user = null;
		String sql = "select userId,loginName,personPicture,userName,passWord,gender,passQuestion,passAnswer,email,tel,IDCard,money,consume,"
	+ "registerTime,userInfo.levelId,userState,levelName,levelDesc,discount from userinfo,level where userinfo.levelId = level.levelId and "+ str+"="+ obj;
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setLoginName(rs.getString("loginName"));
				user.setPersonPicture(rs.getString("personPicture"));
				user.setUserName(rs.getString("userName"));
				user.setPassWord(rs.getString("passWord"));
				user.setGender(rs.getInt("gender"));
				user.setPassQuestion(rs.getString("passQuestion"));
				user.setPassAnswer(rs.getString("passAnswer"));
				user.setEmail(rs.getString("email"));
				user.setTel(rs.getString("tel"));
				user.setIDCard(rs.getString("IDCard"));
				user.setMoney(rs.getDouble("money"));
				user.setConsume(rs.getDouble("consume"));
				String registerTime = new SimpleDateFormat("yyy-MM-dd HH:mm:ss").format(rs.getTimestamp("registerTime"));
				user.setRegisterTime(registerTime);
				user.setLevelId(rs.getInt("userinfo.levelId"));
				user.setUserState(rs.getInt("userState"));
				user.setLevelName(rs.getString("levelName"));
				user.setLevelDesc(rs.getString("levelDesc"));
				user.setDiscount(rs.getDouble("discount"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}

	/**
	 * �༭�û���Ϣ
	 */
	@Override
	public void edit(User u) {
		String sql = "update userinfo set loginName=?,userName=?,gender=?,passQuestion=?,passAnswer=?,email=?,tel=?,"
				+ "money=?,IDCard=?,levelId=?,userState=? where userId=?";
		update(sql, u.getLoginName(),u.getUserName(),u.getGender(),u.getPassQuestion(),u.getPassAnswer(),u.getEmail(),
		u.getTel(),u.getMoney(),u.getIDCard(),u.getLevelId(),u.getUserState(),u.getUserId());
	}

	/**
	 * ����û�
	 */
	@Override
	public void add(User u) {
		String sql = "insert into userinfo(loginName,userName,passWord,tel,money,registerTime,consume,levelId,userState) values(?,?,?,?,?,?,?,?,0)";
		update(sql, u.getLoginName(),u.getUserName(),u.getPassWord(),u.getTel(),0,new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()),0,1,0);
	}

	/**
	 * ɾ���û�
	 */
	@Override
	public void delete(Object obj) {
		String sql = "update userinfo set userState = 1 where userId = ?";
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
