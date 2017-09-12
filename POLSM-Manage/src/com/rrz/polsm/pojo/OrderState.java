package com.rrz.polsm.pojo;

import java.io.Serializable;


public class OrderState implements Serializable{
	
	/**
	 * ����״̬�����л�
	 */
	private static final long serialVersionUID = -4384910365495316110L;
	//����
	private int orderStateId;//����״̬Id
	private String orderFormId;//������Id
	private String orderStateDesc;//��������
	private String orderStateTime;//����״̬ʱ��
	/**
	 * @return the orderStateId
	 */
	public int getOrderStateId() {
		return orderStateId;
	}
	/**
	 * @param orderStateId the orderStateId to set
	 */
	public void setOrderStateId(int orderStateId) {
		this.orderStateId = orderStateId;
	}
	/**
	 * @return the orderFormId
	 */
	public String getOrderFormId() {
		return orderFormId;
	}
	/**
	 * @param orderFormId the orderFormId to set
	 */
	public void setOrderFormId(String orderFormId) {
		this.orderFormId = orderFormId;
	}
	/**
	 * @return the orderStateDesc
	 */
	public String getOrderStateDesc() {
		return orderStateDesc;
	}
	/**
	 * @param orderStateDesc the orderStateDesc to set
	 */
	public void setOrderStateDesc(String orderStateDesc) {
		this.orderStateDesc = orderStateDesc;
	}
	/**
	 * @return the orderStateName
	 */
	public String getOrderStateTime() {
		return orderStateTime;
	}
	/**
	 * @param orderStateName the orderStateName to set
	 */
	public void setOrderStateTime(String orderStateTime) {
		this.orderStateTime = orderStateTime;
	}
	/**
	 * ���캯��
	 */
	public OrderState() {
		super();
	}
	
}
