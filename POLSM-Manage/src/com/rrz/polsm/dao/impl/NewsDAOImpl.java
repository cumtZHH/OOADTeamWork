package com.rrz.polsm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.rrz.polsm.dao.INewsDAO;
import com.rrz.polsm.pojo.News;


public class NewsDAOImpl extends BaseDAO implements INewsDAO {
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public List<News> query(News n, Map<String, String> map, int row, int page) {
		
		List<News> list = new ArrayList<>();
		String sql = "select newsId,title,newsContent,newsTime,newsState from news where 1=1";
		if(n.getNewsId()!=-1){
			sql +=" and newsId = "+n.getNewsId();
		}
		if(n.getTitle()!=null&&!"".equals(n.getTitle())){
			sql +=" and title like '%"+n.getTitle()+"%'";
		}
		if(n.getNewsState()!=-1){
			sql +=" and newsState = "+n.getNewsState();
		}
		String newsTimeStart = map.get("newsTimeStart");
		String newsTimeEnd = map.get("newsTimeEnd");
		if(newsTimeStart!=null&&!"".equals(newsTimeStart)){
			sql +=" and newsTime >='"+newsTimeStart+"'";
		}
		if(newsTimeEnd!=null&&!"".equals(newsTimeEnd)){
			sql +=" and newsTime <='"+newsTimeEnd+"'";
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
				News news = new News();
				news.setNewsId(rs.getInt("newsId"));
				news.setTitle(rs.getString("title"));
				news.setNewsContent(rs.getString("newsContent"));
				String newsTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("newsTime"));
				news.setNewsTime(newsTime);
				news.setNewsState(rs.getInt("newsState"));
				list.add(news);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			closeAll(con, ps, rs);
		}
		return list;
	}

	
	@Override
	public int getTotal(News n) {
		
		String sql = "select count(newsId) from news where 1=1";
		if(n.getNewsId()!=-1){
			sql +=" and newsId = "+n.getNewsId();
		}
		if(n.getTitle()!=null&&!"".equals(n.getTitle())){
			sql +=" and title like '%"+n.getTitle()+"%'";
		}
		if(n.getNewsState()!=-1){
			sql +=" and newsState = "+n.getNewsState();
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

	
	@Override
	public News queryByAttr(String str, Object obj) {
		
		News news = null;
		String sql = "select newsId,title,newsContent,newsTime,newsState from news where "+str+" = '"+obj+"'";
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				news = new News();
				news.setNewsId(rs.getInt("newsId"));
				news.setTitle(rs.getString("title"));
				news.setNewsContent(rs.getString("newsContent"));
				String newsTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("newsTime"));
				news.setNewsTime(newsTime);
				news.setNewsState(rs.getInt("newsState"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			closeAll(con, ps, rs);
		}
		return news;
	}

	
	@Override
	public void edit(News n) {
		
		String sql = "update news set title=?,newsContent=?,newsTime=?,newsState=? where newsId=?";
		update(sql, n.getTitle(),n.getNewsContent(),n.getNewsTime(),n.getNewsState(),n.getNewsId());

	}

	
	@Override
	public void add(News n) {
		
		String sql = "insert into news(title,newsContent,newsTime,newsState) values(?,?,?,?)";
		update(sql, n.getTitle(),n.getNewsContent(),n.getNewsTime(),n.getNewsState());
	}

	
	@Override
	public void delete(Object obj) {
		
		String sql = "update news set newsState = 1 where newsId = ?";
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
