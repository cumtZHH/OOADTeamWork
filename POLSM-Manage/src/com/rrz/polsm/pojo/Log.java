package com.rrz.polsm.pojo;

import java.io.Serializable;


public class Log implements Serializable{
	
	/**
	 * ��־���л�
	 */
	private static final long serialVersionUID = 4123226945140071303L;
	//����
	private int logId;//��־Id
	private int managerId;//����ԱId
	private String ipAddress;//��¼IP
	private String message;//������Ϣ
	private String logTime;//��¼ʱ��
	private String loginName;//����Ա����
	
	public int getlogId() {
		return logId;
	}
	public void setlogId(int logId) {
		this.logId = logId;
	}
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getLogTime() {
		return logTime;
	}
	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}
	public String getloginName() {
		return loginName;
	}
	public void setloginName(String loginName) {
		this.loginName = loginName;
	}
	/**
	 * ���캯��
	 */
	public Log() {
		super();
	}
	
	

}
