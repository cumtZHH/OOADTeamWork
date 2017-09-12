package com.rrz.polsm.pojo;

import java.io.Serializable;


public class Manager implements Serializable{
	
	/**
	 * ����Ա���л�
	 */
	private static final long serialVersionUID = 935323963987879971L;
	//����
	private int managerId;//����ԱId
	private String loginName;//��¼��
	private String loginPass;//��¼����
	/**
	 * @return the managerId
	 */
	public int getManagerId() {
		return managerId;
	}
	/**
	 * @param managerId the managerId to set
	 */
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	/**
	 * @return the loginName
	 */
	public String getLoginName() {
		return loginName;
	}
	/**
	 * @param loginName the loginName to set
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	/**
	 * @return the loginPass
	 */
	public String getLoginPass() {
		return loginPass;
	}
	/**
	 * @param loginPass the loginPass to set
	 */
	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}
	/**
	 * ���캯��
	 */
	public Manager() {
		super();
	}
	

}
