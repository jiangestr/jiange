package com.jiange.model;

public class UserInf {
	private String userName;
	private String petName;
	private String realName;
	
	private String telphone;
	private String id;
	private String carId;
	private String idType;
	
	
	public UserInf(String userName, String petName, String realName, String telphone, String id, String carId,
			String idType) {
		super();
		this.userName = userName;
		this.petName = petName;
		this.realName = realName;
		this.telphone = telphone;
		this.id = id;
		this.carId = carId;
		this.idType = idType;
	}
	
	
	@Override
	public String toString() {
		return userName+","+petName+","+realName+","+telphone+","+id+","+carId+","+idType;
	}


	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getIdType() {
		return idType;
	}
	public void setIdType(String idType) {
		this.idType = idType;
	}
}
