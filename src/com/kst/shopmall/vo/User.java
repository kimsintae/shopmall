package com.kst.shopmall.vo;

public class User {

	private int no;
	private String id,password,nickName,phone,mainAddress,detailAddress,postCode;
	
	private String prePhone,midPhone,lastPhone;

	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMainAddress() {
		return mainAddress;
	}

	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	//번호 맨 앞 3자리
	public String getPrePhone() {
		prePhone = phone.substring(0, 3);
		return prePhone;
	}

	
	//번호 가운데 자리
	public String getMidPhone() {
		midPhone = phone.substring(3, phone.length()-4);
		return midPhone;
	}

	//번호 마지막 자리
	public String getLastPhone() {
		lastPhone = phone.substring(phone.length()-4, phone.length());
		return lastPhone;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	
	
}
