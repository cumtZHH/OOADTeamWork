package com.rrz.polsm.dao.impl;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.pool.DruidPooledConnection;


public class BaseDAO {
	
	private static DruidDataSource ds = null;
	
	static {
		Properties pro = new Properties();
		try {
			InputStream in = BaseDAO.class.getClassLoader().getResourceAsStream("druid.properties");
			pro.load(in);
			in.close();
			ds = (DruidDataSource) DruidDataSourceFactory.createDataSource(pro);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * @return
	 */
	public Connection getCon(){
		DruidPooledConnection con = null;
		try {
			con = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	/**
	 * 
	 * @return 
	 */
	public boolean update(String sql,Object ...params){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i+1,params[i]);
			}
			if(ps.executeUpdate()==-1){
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeAll(con, ps, null);
		}
		return true;
	}
	/**
	 * 
	 */
	public void closeAll(Connection con,PreparedStatement ps,ResultSet rs){
		try {
			if(rs!=null)
				rs.close();
			if(ps!=null)
				ps.close();
			if(con!=null)
				con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
