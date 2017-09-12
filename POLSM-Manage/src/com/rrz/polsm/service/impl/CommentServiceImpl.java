package com.rrz.polsm.service.impl;

import java.util.Map;

import com.rrz.polsm.dao.ICommentDAO;
import com.rrz.polsm.dao.impl.CommentDAOImpl;
import com.rrz.polsm.pojo.Comment;
import com.rrz.polsm.service.ICommentService;
import com.rrz.polsm.util.Page;

public class CommentServiceImpl implements ICommentService{
	/**
	 * 创建对象
	 */
	private ICommentDAO commentDAO = new CommentDAOImpl();
	
	/**
	 * 多条件分页查询评论表
	 */
	@Override
	public Page<Comment> query(Comment a, Map<String, String> map, int row, int page) {
		Page<Comment> commentPage = new Page<>();
		commentPage.setRows(commentDAO.query(a,map,row,page));
		commentPage.setTotal(commentDAO.getTotal(a,map));
		int maxPageNum = (int)Math.ceil((commentPage.getTotal()*1.0)/row);
		commentPage.setMaxPageNum(maxPageNum);
		return commentPage;
	}

	@Override
	public Comment queryById(int id) {
		return commentDAO.queryById(id);
	}

	@Override
	public void delete(Object obj) {
		commentDAO.delete(obj);
	}

}
