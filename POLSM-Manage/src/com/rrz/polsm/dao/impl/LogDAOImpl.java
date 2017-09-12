package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.rrz.polsm.dao.ILogDAO;
import com.rrz.polsm.pojo.Log;


public class LogDAOImpl extends BaseDAO implements ILogDAO {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	
	@Override
	public List<Log> query(Log l, Map<String, String> map, int row, int page) {
		List<Log> list = new ArrayList<>();
		String sql = "select logId,log.managerId,ipAddress,message,logTime,loginName from log,manager where manager.managerId  = log.managerId ";
		if(l.getlogId()!=-1){
			sql += " and logId = "+l.getlogId();
		}
		if(l.getMessage()!=null&&!"".equals(l.getMessage())){
			sql +=" and message like '%"+l.getMessage()+"%'";
		}
		String logTimeStart = map.get("logTimeStart");
		String logTimeEnd = map.get("logTimeEnd");
		if(logTimeStart!=null&&!"".equals(logTimeStart)){
			sql += "and logTime >= '"+logTimeStart+"'";
		}
		if(logTimeEnd!=null&&!"".equals(logTimeEnd)){
			sql +=" and logTime <= '"+logTimeEnd+"'";
		}
		//
		if(row!=0&&page!=0){
			sql += " limit "+(page-1)*row+","+row;
		}
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Log log = new Log();
				log.setlogId(rs.getInt("logId"));
				log.setManagerId(rs.getInt("managerId"));
				log.setIpAddress(rs.getString("ipAddress"));
				log.setMessage(rs.getString("message"));
				String logTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("logTime"));
				log.setLogTime(logTime);
				log.setloginName(rs.getString("loginName"));
				list.add(log);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public int getTotal(Log l,Map<String, String> map) {
		String sql = "select count(logId) from log where 1=1 ";
		if(l.getlogId()!=-1){
			sql += " and logId = "+l.getlogId();
		}
		if(l.getMessage()!=null&&!"".equals(l.getMessage())){
			sql +=" and message like '%"+l.getMessage()+"%'";
		}
		String logTimeStart = map.get("logTimeStart");
		String logTimeEnd = map.get("logTimeEnd");
		if(logTimeStart!=null&&!"".equals(logTimeStart)){
			sql += "and logTime >= '"+logTimeStart+"'";
		}
		if(logTimeEnd!=null&&!"".equals(logTimeEnd)){
			sql +=" and logTime <= '"+logTimeEnd+"'";
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
		}
		return 0;
	}

	@Override
	public void add(Log l) {
		String sql = "insert into log(managerId,ipAddress,message,logTime) values(?,?,?,?)";
		update(sql, l.getManagerId(),l.getIpAddress(),l.getMessage(),l.getLogTime());
	}

}
