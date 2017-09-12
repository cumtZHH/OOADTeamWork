package com.rrz.polsm.service.impl;

import java.util.Map;
import com.rrz.polsm.dao.INewsDAO;
import com.rrz.polsm.dao.impl.NewsDAOImpl;
import com.rrz.polsm.pojo.News;
import com.rrz.polsm.service.INewsService;
import com.rrz.polsm.util.Page;


public class NewsServiceImpl implements INewsService {
	/**
	 * ��������
	 */
	private INewsDAO newsDAO = new NewsDAOImpl();

	/**
	 * �����������ҹ���
	 */
	@Override
	public Page<News> query(News n, Map<String, String> map, int row, int page) {
		
		Page<News> levelPage = new Page<>();
		levelPage.setRows(newsDAO.query(n,map,row,page));
		levelPage.setTotal(newsDAO.getTotal(n));
		int maxPageNum = (int)Math.ceil((levelPage.getTotal()*1.0)/row);
		levelPage.setMaxPageNum(maxPageNum);
		return levelPage;
	}

	/**
	 * �������Բ��ҹ���
	 */
	@Override
	public News queryByAttr(String str, Object obj) {
		
		return newsDAO.queryByAttr(str, obj);
	}

	/**
	 * �༭����
	 */
	@Override
	public void edit(News n) {
		
		newsDAO.edit(n);
	}

	/**
	 * ��ӹ���
	 */
	@Override
	public void add(News n) {
		
		newsDAO.add(n);

	}

	/**
	 * ɾ������
	 */
	@Override
	public void delete(Object obj) {
		
		newsDAO.delete(obj);

	}

}
