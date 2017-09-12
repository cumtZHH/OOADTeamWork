package com.rrz.polsm.pojo;

import java.io.Serializable;


public class Address implements Serializable{
	
	/**
	 * �ջ��ַ���л�
	 */
	private static final long serialVersionUID = 2539179457971274745L;
	/**
	 * ����
	 */
	private int addressId;//�ջ��ַId
	private String receiverName;//�ջ�������
	private String receiverTel;//�ջ��˵绰
	private int userId;//�û�Id
	private String addressInfo;//�ջ���ַ
	private String postcode;//�ʱ�
	
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAddressInfo() {
		return addressInfo;
	}
	public void setAddressInfo(String addressInfo) {
		this.addressInfo = addressInfo;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverTel() {
		return receiverTel;
	}
	public void setReceiverTel(String receiverTel) {
		this.receiverTel = receiverTel;
	}
	/**
	 * ���캯��
	 */
	public Address() {
		super();
	}
	
	

}
