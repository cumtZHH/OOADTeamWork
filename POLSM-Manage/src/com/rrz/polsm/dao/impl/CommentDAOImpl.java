package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.rrz.polsm.dao.ICommentDAO;
import com.rrz.polsm.pojo.Comment;
import com.rrz.polsm.pojo.Phone;

public class CommentDAOImpl extends BaseDAO implements ICommentDAO{

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	

	@Override
	public List<Comment> query(Comment a, Map<String, String> map, int row, int page) {
		List<Comment> list = new ArrayList<>();
		String sql = "select commentId,userName,phoneTypeName,color,capacity,phonePrice,commentContent,commentTime,commentLevel,commentState "
				+ "from userinfo,phone,comment,phoneType where phone.phoneTypeId = phoneType.phoneTypeId and userinfo.userId = comment.userId and "
				+ "phone.phoneId = comment.phoneId ";
		//
		if(a!=null){
			if(a.getUserName()!=null&&!"".equals(a.getUserName())){
				sql +=" and userName like '%"+a.getUserName()+"%'";
			}
			if(a.getPhone().getPhoneTypeId()!=-1){
				sql +=" and phone.phoneTypeId = "+a.getPhone().getPhoneTypeId();
			}
			if(a.getCommentLevel()!=null&&!"".equals(a.getCommentLevel())&&!"-1".equals(a.getCommentLevel())){
				sql +=" and commentLevel = '"+a.getCommentLevel()+"'";
			}
			if(a.getCommentState()!=-1){
				sql +=" and commentState = "+a.getCommentState();
			}
		}
		if(map!=null){
			String commmentTimeStart = map.get("commentTimeStart");
			String commentTimeEnd = map.get("commentTimeEnd");
			if(commmentTimeStart!=null&&!"".equals(commmentTimeStart)){
				sql +=" and commmentTime >= '"+commmentTimeStart+"'";
			}
			if(commentTimeEnd!=null&&!"".equals(commentTimeEnd)){
				sql +=" and commentTime <= '"+commentTimeEnd+"'";
			}
		}
		//
		sql +=" order by commentId";
		//
		if(row!=0&&page!=0){
			sql += " limit "+(page-1)*row+","+row;
		}
		System.out.println(sql);
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Phone p = new Phone();
				p.setPhoneTypeName(rs.getString("phoneTypeName"));
				p.setColor(rs.getString("color"));
				p.setCapacity(rs.getString("capacity"));
				p.setPhonePrice(rs.getDouble("phonePrice"));
				Comment c = new Comment();
				c.setCommentId(rs.getInt("commentId"));
				c.setUserName(rs.getString("userName"));
				c.setCommentContent(rs.getString("commentContent"));
				c.setCommentLevel(rs.getString("commentLevel"));
				String commentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("commentTime"));
				c.setCommentState(rs.getInt("commentState"));
				c.setCommentTime(commentTime);
				c.setPhone(p);
				list.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll(con, ps, rs);
		}
		return list;
	}
	
	
	@Override
	public int getTotal(Comment a, Map<String, String> map) {
		String sql = "select count(userName) "
				+ "from userinfo,phone,comment where userinfo.userId = comment.userId and "
				+ "phone.phoneId = comment.phoneId and commentState = 0 ";
		if(a!=null){
			if(a.getUserName()!=null&&!"".equals(a.getUserName())){
				sql +=" and userName like '%"+a.getUserName()+"%'";
			}
			if(a.getPhone().getPhoneTypeId()!=-1){
				sql +=" and phoneTypeId = "+a.getPhone().getPhoneTypeId();
			}
			if(a.getCommentLevel()!=null&&!"".equals(a.getCommentLevel())&&!"-1".equals(a.getCommentLevel())){
				sql +=" and commentLevel = '"+a.getCommentLevel()+"'";
			}
			if(a.getCommentState()!=-1){
				sql +=" and commentState = "+a.getCommentState();
			}
		}
		if(map!=null){
			String commmentTimeStart = map.get("commentTimeStart");
			String commentTimeEnd = map.get("commentTimeEnd");
			if(commmentTimeStart!=null&&!"".equals(commmentTimeStart)){
				sql +=" and commmentTime >= '"+commmentTimeStart+"'";
			}
			if(commentTimeEnd!=null&&!"".equals(commentTimeEnd)){
				sql +=" and commentTime <= '"+commentTimeEnd+"'";
			}
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
		}finally {
			closeAll(con, ps, rs);
		}
		return 0;
	}

	
	@Override
	public Comment queryById(int id) {
		Comment comment = null;
		String sql = "select userName,phoneTypeName,color,capacity,phonePrice,commentContent,commentTime,commentLevel,commentState "
				+ "from userinfo,phone,comment,phoneType where phone.phoneTypeId = phoneType.phoneTypeId and userinfo.userId = comment.userId and "
				+ "phone.phoneId = comment.phoneId and commentId = "+id;
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				Phone p = new Phone();
				p.setPhoneTypeName(rs.getString("phoneTypeName"));
				p.setColor(rs.getString("color"));
				p.setCapacity(rs.getString("capacity"));
				p.setPhonePrice(rs.getDouble("phonePrice"));
				comment = new Comment();
				comment.setCommentId(id);
				comment.setUserName(rs.getString("userName"));
				comment.setCommentContent(rs.getString("commentContent"));
				comment.setCommentLevel(rs.getString("commentLevel"));
				String commentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("commentTime"));
				comment.setCommentState(rs.getInt("commentState"));
				comment.setCommentTime(commentTime);
				comment.setPhone(p);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll(con, ps, rs);
		}
		return comment;
	}


	@Override
	public void delete(Object obj) {
		String sql = "update comment set commentState = 1 where commentId = ?";
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
	

}
