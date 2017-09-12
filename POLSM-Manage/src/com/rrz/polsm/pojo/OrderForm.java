package com.rrz.polsm.pojo;

import java.io.Serializable;
import java.util.List;


public class OrderForm implements Serializable{
	
	/**
	 * ������ϸ���л�
	 */
	private static final long serialVersionUID = 4610531282465710342L;
	/**
	 * ����
	 */
	private String orderFormId;//����Id
	private int userId;//�û�Id
	private int addressId;//�ջ��ַId
	private String remark;//��ע
	private int orderFormState;//����״̬
	private double orderFormPrice;//�����ܼ۸�
	/**
	 * ˲ʱ����
	 */
	private User user;//�û�����
	private Address address;//�ջ��ַ
	private List<OrderDetail> orderDetailList;//��Ź����ֻ��ļ���
	private OrderState orderState;//�������µ�״̬״̬
	private List<OrderState> orderStateList;//��������״̬����
	
	public String getOrderFormId() {
		return orderFormId;
	}
	public void setOrderFormId(String orderFormId) {
		this.orderFormId = orderFormId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getOrderFormState() {
		return orderFormState;
	}
	public void setOrderFormState(int orderFormState) {
		this.orderFormState = orderFormState;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public List<OrderDetail> getOrderDetailList() {
		return orderDetailList;
	}
	public void setOrderDetailList(List<OrderDetail> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
	public OrderState getOrderState() {
		return orderState;
	}
	public void setOrderState(OrderState orderState) {
		this.orderState = orderState;
	}
	public List<OrderState> getOrderStateList() {
		return orderStateList;
	}
	public void setOrderStateList(List<OrderState> orderStateList) {
		this.orderStateList = orderStateList;
	}
	public double getOrderFormPrice() {
		return orderFormPrice;
	}
	public void setOrderFormPrice(double orderFormPrice) {
		this.orderFormPrice = orderFormPrice;
	}
	/**
	 * ���캯��
	 */
	public OrderForm() {
		super();
	}
	
}
