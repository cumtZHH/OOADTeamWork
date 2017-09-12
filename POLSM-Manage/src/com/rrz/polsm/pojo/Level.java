package com.rrz.polsm.pojo;

import java.io.Serializable;


public class Level implements Serializable{
	
	/**
	 * �û��ȼ����л�
	 */
	private static final long serialVersionUID = 8699307285365650350L;
	//����
	private int levelId;//�ȼ�Id
	private String levelName;//�ȼ�����
	private String levelDesc;//����
	private double discount;//�ۿ�
	private int levelState;//�ȼ�״̬
	/**
	 * @return the levelId
	 */
	public int getLevelId() {
		return levelId;
	}
	/**
	 * @param levelId the levelId to set
	 */
	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}
	/**
	 * @return the levelName
	 */
	public String getLevelName() {
		return levelName;
	}
	/**
	 * @param levelName the levelName to set
	 */
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	/**
	 * @return the levelDesc
	 */
	public String getLevelDesc() {
		return levelDesc;
	}
	/**
	 * @param levelDesc the levelDesc to set
	 */
	public void setLevelDesc(String levelDesc) {
		this.levelDesc = levelDesc;
	}
	/**
	 * @return the discount
	 */
	public double getDiscount() {
		return discount;
	}
	/**
	 * @param discount the discount to set
	 */
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public int getLevelState() {
		return levelState;
	}
	public void setLevelState(int levelState) {
		this.levelState = levelState;
	}
	/**
	 * ���캯��
	 */
	public Level() {
		super();
	}
}
