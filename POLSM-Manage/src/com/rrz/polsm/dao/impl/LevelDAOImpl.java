package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.rrz.polsm.dao.ILevelDAO;
import com.rrz.polsm.pojo.Level;
import com.rrz.polsm.pojo.Phone;

public class LevelDAOImpl extends BaseDAO implements ILevelDAO {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;


	@Override
	public List<Level> query(Level l, Map<String, String> map, int row, int page) {
		List<Level> levels = new ArrayList<>();
		String sql = "select levelId,levelName,levelDesc,discount,levelState from level where 1=1";
		if(l!=null){
			if(l.getLevelId()!=-1){
				sql += " and levelId = "+l.getLevelId();
			}
			if(l.getLevelState()!=-1){
				sql += " and levelState = "+l.getLevelState();
			}
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Level level = new Level();
				level.setLevelId(rs.getInt("levelId"));
				level.setLevelName(rs.getString("levelName"));
				level.setLevelDesc(rs.getString("levelDesc"));
				level.setDiscount(rs.getDouble("discount"));
				level.setLevelState(rs.getInt("levelState"));
				levels.add(level);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll(con, ps, rs);
		}
		// TODO Auto-generated method stub
		return levels;
	}

	
	@Override
	public int getTotal(Level l) {
		String sql = "select count(levelId) from level where 1=1";
		if(l!=null){
			if(l.getLevelId()!=-1){
				sql += " and levelId = "+l.getLevelId();
			}
			if(l.getLevelState()!=-1){
				sql += " and levelState = "+l.getLevelState();
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
			
		}finally {
			closeAll(con, ps, rs);
		}
		return 0;
	}

	
	@Override
	public Level queryByAttr(String str, Object obj) {
		Level level = null;
		String sql = "select levelId,levelName,levelDesc,discount,levelState from level where "+str+"='"+obj+"'";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				level = new Level();
				level.setLevelId(rs.getInt("levelId"));
				level.setLevelName(rs.getString("levelName"));
				level.setLevelDesc(rs.getString("levelDesc"));
				level.setDiscount(rs.getDouble("discount"));
				level.setLevelState(rs.getInt("levelState"));
				return level;
			}
		} catch (Exception e) {
			
		}finally {
			closeAll(con, ps, rs);
		}
		return null;
	}


	@Override
	public void edit(Level l) {
		String sql = "update level set levelName=?,levelDesc=?,discount=?,levelState=? where levelId=?";
		update(sql, l.getLevelName(),l.getLevelDesc(),l.getDiscount(),l.getLevelState(),l.getLevelId());
	}

	@Override
	public void add(Level l) {
		String sql = "insert into level(levelName,levelDesc,discount,levelState) values(?,?,?,0)";
		update(sql,l.getLevelName(),l.getLevelDesc(),l.getDiscount());
	}

	
	@Override
	public void delete(Object obj) {
		String sql = "update level set levelState = 1 where levelId = ?";
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
