package com.rrz.polsm.service.impl;

import com.rrz.polsm.dao.IManagerDAO;
import com.rrz.polsm.dao.impl.ManagerDAOImpl;
import com.rrz.polsm.pojo.Manager;
import com.rrz.polsm.service.IManagerService;
import com.rrz.polsm.util.MD5Util;


public class ManagerServiceImpl implements IManagerService{
	/**
	 * �������
	 */
	private IManagerDAO managerDAO = new ManagerDAOImpl();

	/**
	 * ��¼ҵ��
	 */
	@Override
	public Manager login(String loginName, String loginPass) {
		//�ȸ��ݵ�¼�����ҹ���Ա�Ƿ����
		Manager m = managerDAO.queryByLoginName(loginName);
		if(m==null){
			return null;
		}
		//���ж������Ƿ���ȷ
		if(m.getLoginPass().equals(MD5Util.getMD5(loginPass))){
			return m;
		}else{
			return null;
		}
		
	}

}
