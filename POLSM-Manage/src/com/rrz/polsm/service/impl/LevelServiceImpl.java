package com.rrz.polsm.service.impl;

import java.util.Map;

import com.rrz.polsm.dao.ILevelDAO;
import com.rrz.polsm.dao.impl.LevelDAOImpl;
import com.rrz.polsm.pojo.Level;
import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.service.ILevelService;
import com.rrz.polsm.util.Page;


public class LevelServiceImpl implements ILevelService {
	/**
	 * ��������
	 */
	private ILevelDAO levelDAO = new LevelDAOImpl();

	/**
	 * ���ҵȼ���Ϣ
	 */
	@Override
	public Page<Level> query(Level l, Map<String, String> map, int row, int page) {
		Page<Level> levelPage = new Page<>();
		levelPage.setRows(levelDAO.query(l,map,row,page));
		levelPage.setTotal(levelDAO.getTotal(l));
		int maxPageNum = (int)Math.ceil((levelPage.getTotal()*1.0)/row);
		levelPage.setMaxPageNum(maxPageNum);
		return levelPage;
	}

	/**
	 * �������Բ��ҵȼ���Ϣ
	 */
	@Override
	public Level queryByAttr(String str, Object obj) {
		return levelDAO.queryByAttr(str, obj);
	}

	/**
	 * �༭�ȼ���Ϣ
	 */
	@Override
	public void edit(Level l) {
		levelDAO.edit(l);
	}

	/**
	 * ��ӵȼ�
	 */
	@Override
	public void add(Level l) {
		levelDAO.add(l);

	}

	/**
	 * ɾ���ȼ�
	 */
	@Override
	public void delete(Object obj) {
		levelDAO.delete(obj);

	}

}
