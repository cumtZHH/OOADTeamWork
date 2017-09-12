package com.rrz.polsm.dao;

import java.util.List;
import java.util.Map;

import com.rrz.polsm.pojo.Comment;

public interface ICommentDAO {
	
	List<Comment> query(Comment a,Map<String,String> map,int row,int page);
	int getTotal(Comment a,Map<String,String> map);
	Comment queryById(int id);
	void delete(Object obj);

}
