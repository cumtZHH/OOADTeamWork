package com.rrz.polsm.service.impl;

import java.util.Map;

import com.rrz.polsm.dao.ILogDAO;
import com.rrz.polsm.dao.impl.LogDAOImpl;
import com.rrz.polsm.pojo.Log;
import com.rrz.polsm.service.ILogService;
import com.rrz.polsm.util.Page;


public class LogServiceImpl implements ILogService {
	
	/**
	 * ��������
	 */
	private ILogDAO logDAO = new LogDAOImpl();

	/**
	 * �������Բ�ѯ��־
	 */
	@Override
	public Page<Log> query(Log l, Map<String, String> map, int row, int page) {
		Page<Log> logPage = new Page<>();
		logPage.setRows(logDAO.query(l, map, row, page));
		logPage.setTotal(logDAO.getTotal(l, map));
		int maxPageNum = (int)Math.ceil((logPage.getTotal()*1.0)/row);
		logPage.setMaxPageNum(maxPageNum);
		return logPage;
	}

	/**
	 * ���һ����־
	 */
	@Override
	public void add(Log l) {
		logDAO.add(l);
	}

}
