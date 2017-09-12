package com.rrz.polsm.pojo;

import java.io.Serializable;
import java.util.List;


public class User implements Serializable{
	
	/**
	 * �û����л�
	 */
	private static final long serialVersionUID = 7546935453752391655L;
	/**
	 * ����
	 */
	private int userId;//�û�Id
	private String loginName;//��¼��
	private String personPicture;//�û�ͷ��
	private String userName;//��ʵ����
	private String passWord;//��¼����
	private int gender;//�Ա�
	private String passQuestion;//�ܱ�����
	private String passAnswer;//�ܱ���
	private String email;//����
	private String tel;//�ֻ�����
	private String IDCard;//���֤
	private double money;//��ֵ���
	private double consume;//�ۼ����Ѷ��
	private String registerTime;//ע��ʱ��
	private int levelId;//�û��ȼ�Id
	private int userState;//�û�״̬
	/**
	 * ˲ʱ����
	 */
	private String levelName;//�ȼ�����
	private String levelDesc;//�ȼ�����
	private double discount;//�ۿ�
	private List<Address> addressList;//����û��ջ��ַ�ļ���
	
	
	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getLoginName() {
		return loginName;
	}


	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}


	public String getPersonPicture() {
		return personPicture;
	}


	public void setPersonPicture(String personPicture) {
		this.personPicture = personPicture;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassWord() {
		return passWord;
	}


	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}


	public int getGender() {
		return gender;
	}


	public void setGender(int gender) {
		this.gender = gender;
	}


	public String getPassQuestion() {
		return passQuestion;
	}


	public void setPassQuestion(String passQuestion) {
		this.passQuestion = passQuestion;
	}


	public String getPassAnswer() {
		return passAnswer;
	}


	public void setPassAnswer(String passAnswer) {
		this.passAnswer = passAnswer;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getIDCard() {
		return IDCard;
	}


	public void setIDCard(String iDCard) {
		IDCard = iDCard;
	}


	public double getMoney() {
		return money;
	}


	public void setMoney(double money) {
		this.money = money;
	}


	public double getConsume() {
		return consume;
	}


	public void setConsume(double consume) {
		this.consume = consume;
	}


	public String getRegisterTime() {
		return registerTime;
	}


	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}


	public int getLevelId() {
		return levelId;
	}


	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}


	public int getUserState() {
		return userState;
	}


	public void setUserState(int userState) {
		this.userState = userState;
	}


	public String getLevelName() {
		return levelName;
	}


	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}


	public String getLevelDesc() {
		return levelDesc;
	}


	public void setLevelDesc(String levelDesc) {
		this.levelDesc = levelDesc;
	}


	public double getDiscount() {
		return discount;
	}


	public void setDiscount(double discount) {
		this.discount = discount;
	}


	public List<Address> getAddressList() {
		return addressList;
	}


	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}


	/**
	 * ���캯��
	 */
	public User() {
		super();
	}
	
}
