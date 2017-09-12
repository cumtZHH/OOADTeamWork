package com.rrz.polsm.pojo;

import java.io.Serializable;


public class Voucher implements Serializable{
	
	/**
	 * ����ȯ���л�
	 */
	private static final long serialVersionUID = 4925287902425373271L;
	/**
	 * ����
	 */
	private int voucherId;//����ȯId
	private int userId;//�û�Id
	private double voucherPrice;//�۸�
	private String voucherTime;//����ȯ��ȡʱ��
	private String voucherDesc;//����
	private int voucherState;//����ȯ״̬
	/**
	 * @return the voucherId
	 */
	public int getVoucherId() {
		return voucherId;
	}
	/**
	 * @param voucherId the voucherId to set
	 */
	public void setVoucherId(int voucherId) {
		this.voucherId = voucherId;
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
	 * @return the voucherPrice
	 */
	public double getVoucherPrice() {
		return voucherPrice;
	}
	/**
	 * @param voucherPrice the voucherPrice to set
	 */
	public void setVoucherPrice(double voucherPrice) {
		this.voucherPrice = voucherPrice;
	}
	/**
	 * @return the voucherTime
	 */
	public String getVoucherTime() {
		return voucherTime;
	}
	/**
	 * @param voucherTime the voucherTime to set
	 */
	public void setVoucherTime(String voucherTime) {
		this.voucherTime = voucherTime;
	}
	/**
	 * @return the voucherDesc
	 */
	public String getVoucherDesc() {
		return voucherDesc;
	}
	/**
	 * @param voucherDesc the voucherDesc to set
	 */
	public void setVoucherDesc(String voucherDesc) {
		this.voucherDesc = voucherDesc;
	}
	/**
	 * @return the voucherState
	 */
	public int getVoucherState() {
		return voucherState;
	}
	/**
	 * @param voucherState the voucherState to set
	 */
	public void setVoucherState(int voucherState) {
		this.voucherState = voucherState;
	}
	/**
	 * ���캯��
	 */
	public Voucher() {
		super();
	}
	
	
	
}
