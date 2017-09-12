package com.rrz.polsm.pojo;

import java.io.Serializable;


public class ShoppingCar implements Serializable{
	
	/**
	 * ���ﳵ���л�
	 */
	private static final long serialVersionUID = -2518006365040875490L;
	/**
	 * ����
	 */
	private int shoppingCarId;//���ﳵId
	private int userId;//�û�Id
	private int phoneId;//�ֻ�Id
	private String shoppingCarTime;//�ֻ�����
	/**
	 * @return the shoppingCarId
	 */
	public int getShoppingCarId() {
		return shoppingCarId;
	}
	/**
	 * @param shoppingCarId the shoppingCarId to set
	 */
	public void setShoppingCarId(int shoppingCarId) {
		this.shoppingCarId = shoppingCarId;
	}
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @return the phoneId
	 */
	public int getPhoneId() {
		return phoneId;
	}
	/**
	 * @param phoneId the phoneId to set
	 */
	public void setPhoneId(int phoneId) {
		this.phoneId = phoneId;
	}
	/**
	 * @return the shoppingCarTime
	 */
	public String getShoppingCarTime() {
		return shoppingCarTime;
	}
	/**
	 * @param shoppingCarTime the shoppingCarTime to set
	 */
	public void setShoppingCarTime(String shoppingCarTime) {
		this.shoppingCarTime = shoppingCarTime;
	}
	/**
	 * ���캯��
	 */
	public ShoppingCar() {
		super();
	}
	
}
