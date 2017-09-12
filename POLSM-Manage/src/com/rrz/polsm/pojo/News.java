package com.rrz.polsm.pojo;

import java.io.Serializable;


public class News implements Serializable{
	
	/**
	 * �������л�
	 */
	private static final long serialVersionUID = -5214942799815198279L;
	//����
	private int newsId;//����Id
	private String title;//����
	private String newsContent;//��������
	private String newsTime;//����ʱ��
	private int newsState;//���淢��״̬
	/**
	 * @return the newsId
	 */
	public int getNewsId() {
		return newsId;
	}
	/**
	 * @param newsId the newsId to set
	 */
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the newsContent
	 */
	public String getNewsContent() {
		return newsContent;
	}
	/**
	 * @param newsContent the newsContent to set
	 */
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	/**
	 * @return the newsTime
	 */
	public String getNewsTime() {
		return newsTime;
	}
	/**
	 * @param newsTime the newsTime to set
	 */
	public void setNewsTime(String newsTime) {
		this.newsTime = newsTime;
	}
	/**
	 * @return the newsState
	 */
	public int getNewsState() {
		return newsState;
	}
	/**
	 * @param newsState the newsState to set
	 */
	public void setNewsState(int newsState) {
		this.newsState = newsState;
	}
	

}
