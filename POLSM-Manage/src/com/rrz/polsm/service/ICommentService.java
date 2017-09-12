package com.rrz.polsm.service;

import java.util.Map;

import com.rrz.polsm.pojo.Comment;
import com.rrz.polsm.util.Page;

public interface ICommentService {
	
	Page<Comment> query(Comment a,Map<String,String> map,int row,int page);
	Comment queryById(int id);
	void delete(Object obj);

}
