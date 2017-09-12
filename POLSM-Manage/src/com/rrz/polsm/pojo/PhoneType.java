package com.rrz.polsm.pojo;

import java.io.Serializable;

public class PhoneType implements Serializable{
	
	/**
	 * �ֻ��������л�
	 */
	private static final long serialVersionUID = 8020702626221083482L;
	/**
	 * ����
	 */
	private int phoneTypeId;//�ֻ�����Id
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
	private double phoneTypePrice;//����
	private int phoneTypeState;//�Ƿ��¼�״̬

	public int getPhoneTypeId() {
		return phoneTypeId;
	}


	public void setPhoneTypeId(int phoneTypeId) {
		this.phoneTypeId = phoneTypeId;
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

	public double getPhoneTypePrice() {
		return phoneTypePrice;
	}


	public void setPhoneTypePrice(double phoneTypePrice) {
		this.phoneTypePrice = phoneTypePrice;
	}


	/**
	 * ���캯��
	 */
	public PhoneType() {
		super();
	}
	
}
