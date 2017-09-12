package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rrz.polsm.dao.IManagerDAO;
import com.rrz.polsm.pojo.Manager;


public class ManagerDAOImpl extends BaseDAO implements IManagerDAO{
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	
	@Override
	public Manager queryByLoginName(String loginName) {
		Manager m = null;
		String sql = "select managerId,loginPass from manager where loginName = '"+loginName+"'";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				m = new Manager();
				m.setManagerId(rs.getInt("managerId"));
				m.setLoginName(loginName);
				m.setLoginPass(rs.getString("loginPass"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(con, ps, rs);
		}
		return m;
	}

}
