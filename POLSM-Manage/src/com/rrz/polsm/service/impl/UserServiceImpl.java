package com.rrz.polsm.service.impl;

import java.util.Map;

import com.rrz.polsm.dao.IUserDAO;
import com.rrz.polsm.dao.impl.UserDAOImpl;
import com.rrz.polsm.pojo.Phone;
import com.rrz.polsm.pojo.User;
import com.rrz.polsm.service.IUserService;
import com.rrz.polsm.util.Page;


public class UserServiceImpl implements IUserService {
	/**
	 * ��������
	 */
	private IUserDAO userDAO = new UserDAOImpl();

	/**
	 * ��ҳ��������ѯ�û�����
	 */
	@Override
	public Page<User> query(User u, Map<String, String> map, int row, int page) {
		Page<User> phonePage = new Page<>();
		phonePage.setRows(userDAO.query(u,map,row,page));
		phonePage.setTotal(userDAO.getTotal(u,map));
		int maxPageNum = (int)Math.ceil((phonePage.getTotal()*1.0)/row);
		phonePage.setMaxPageNum(maxPageNum);
		return phonePage;
	}
	/**
	 * �������Բ����û�
	 */
	@Override
	public User queryByAttr(String str, Object obj) {
		return userDAO.queryByAttr(str, obj);
	}

	/**
	 * �༭�û���Ϣ
	 */
	@Override
	public void edit(User u) {
		userDAO.edit(u);
	}

	/**
	 * ����û�
	 */
	@Override
	public void add(User u) {
		userDAO.add(u);
	}

	/**
	 * ɾ���û�
	 */
	@Override
	public void delete(Object obj) {
		userDAO.delete(obj);
	}

}
