package com.rrz.polsm.pojo;

import java.io.Serializable;


public class Phone implements Serializable{
	
	/**
	 * �ֻ����л�
	 */
	private static final long serialVersionUID = -2357696550954909696L;
	/**
	 * ����
	 */
	private int phoneId;//�ֻ�Id
	private int phoneTypeId;//�ֻ�����Id
	private double phonePrice;//�ֻ��۸�
	private String color;//�ֻ���ɫ
	private String capacity;//�ֻ�����
	private String picture;//�ֻ�ͼƬ
	private String phoneDesc;//�ֻ�����
	private int phoneState;//�Ƿ�������״̬
	/**
	 * ˲ʱ����
	 */
	private String phoneTypeName;//��������
	private String size;//�ߴ��С
	private String weight;//����
	private String callTime;//ͨ��ʱ��
	private String liveTime;//����ʱ��
	private String cpu;//cpu����
	private String pixel;//��������
	private String system;//����ϵͳ
	private String phoneTypeTime;//����ʱ��
	private String mainPicture;//��ͼ
	private String net;//�����ʽ
	private int phoneTypeState;//�Ƿ��¼�״̬
	
	public int getPhoneId() {
		return phoneId;
	}


	public void setPhoneId(int phoneId) {
		this.phoneId = phoneId;
	}


	public int getPhoneTypeId() {
		return phoneTypeId;
	}


	public void setPhoneTypeId(int phoneTypeId) {
		this.phoneTypeId = phoneTypeId;
	}


	public double getPhonePrice() {
		return phonePrice;
	}


	public void setPhonePrice(double phonePrice) {
		this.phonePrice = phonePrice;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getCapacity() {
		return capacity;
	}


	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}


	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	public String getPhoneDesc() {
		return phoneDesc;
	}


	public void setPhoneDesc(String phoneDesc) {
		this.phoneDesc = phoneDesc;
	}


	public int getPhoneState() {
		return phoneState;
	}


	public void setPhoneState(int phoneState) {
		this.phoneState = phoneState;
	}


	public String getPhoneTypeName() {
		return phoneTypeName;
	}


	public void setPhoneTypeName(String phoneTypeName) {
		this.phoneTypeName = phoneTypeName;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}


	public String getWeight() {
		return weight;
	}


	public void setWeight(String weight) {
		this.weight = weight;
	}


	public String getCallTime() {
		return callTime;
	}


	public void setCallTime(String callTime) {
		this.callTime = callTime;
	}


	public String getLiveTime() {
		return liveTime;
	}


	public void setLiveTime(String liveTime) {
		this.liveTime = liveTime;
	}


	public String getCpu() {
		return cpu;
	}


	public void setCpu(String cpu) {
		this.cpu = cpu;
	}


	public String getPixel() {
		return pixel;
	}


	public void setPixel(String pixel) {
		this.pixel = pixel;
	}


	public String getSystem() {
		return system;
	}


	public void setSystem(String system) {
		this.system = system;
	}


	public String getPhoneTypeTime() {
		return phoneTypeTime;
	}


	public void setPhoneTypeTime(String phoneTypeTime) {
		this.phoneTypeTime = phoneTypeTime;
	}


	public String getMainPicture() {
		return mainPicture;
	}


	public void setMainPicture(String mainPicture) {
		this.mainPicture = mainPicture;
	}


	public String getNet() {
		return net;
	}


	public void setNet(String net) {
		this.net = net;
	}


	public int getPhoneTypeState() {
		return phoneTypeState;
	}


	public void setPhoneTypeState(int phoneTypeState) {
		this.phoneTypeState = phoneTypeState;
	}


	/**
	 * ���캯��
	 */
	public Phone() {
		super();
	}
	
	
}
