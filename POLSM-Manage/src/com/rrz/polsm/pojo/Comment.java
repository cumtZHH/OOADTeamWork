package com.rrz.polsm.pojo;

import java.io.Serializable;


public class Comment implements Serializable{
	
	/**
	 * ���۱����л�
	 */
	private static final long serialVersionUID = 6440592833664892496L;
	//����
	private int commentId;//����Id
	private int userId;//�û�Id
	private int phoneId;//�ֻ�����Id
	private String commentContent;//��������
	private String commentTime;//����ʱ��
	private String commentLevel;//��������
	private int commentState;//����״̬
	
	/**
	 * ˲ʱ����
	 * @return
	 */
	private Phone phone;//���۵��ֻ�����
	private String userName;//������
	
	public int getCommentId() {
		return commentId;
	}


	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getPhoneId() {
		return phoneId;
	}


	public void setPhoneId(int phoneId) {
		this.phoneId = phoneId;
	}


	public String getCommentContent() {
		return commentContent;
	}


	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}


	public String getCommentTime() {
		return commentTime;
	}


	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}

	public Phone getPhone() {
		return phone;
	}


	public void setPhone(Phone phone) {
		this.phone = phone;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getCommentLevel() {
		return commentLevel;
	}


	public void setCommentLevel(String commentLevel) {
		this.commentLevel = commentLevel;
	}


	public int getCommentState() {
		return commentState;
	}


	public void setCommentState(int commentState) {
		this.commentState = commentState;
	}


	/**
	 * ���캯��
	 */
	public Comment() {
		super();
	}
	

}
