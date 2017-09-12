package com.rrz.polsm.pojo;

import java.io.Serializable;


public class OrderDetail implements Serializable{

	/**
	 * ������ϸ�����л�
	 */
	private static final long serialVersionUID = -2189625633351443496L;
	
	/**
	 * ����
	 */
	private int orderDeatileId;//������ϸ��Id
	private int orderFormId;//������Id
	private int phoneId;//�ֻ�Id
	/**
	 * ˲ʱ����
	 */
	private Phone phone;//�ֻ�

	public int getOrderDeatileId() {
		return orderDeatileId;
	}
	public void setOrderDeatileId(int orderDeatileId) {
		this.orderDeatileId = orderDeatileId;
	}
	public int getOrderFormId() {
		return orderFormId;
	}
	public void setOrderFormId(int orderFormId) {
		this.orderFormId = orderFormId;
	}
	public int getPhoneId() {
		return phoneId;
	}
	public void setPhoneId(int phoneId) {
		this.phoneId = phoneId;
	}
	public Phone getPhone() {
		return phone;
	}
	public void setPhone(Phone phone) {
		this.phone = phone;
	}
	/**
	 * ���캯��
	 */
	public OrderDetail() {
		super();
	}
	
	
	
}
