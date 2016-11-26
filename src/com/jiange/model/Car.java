package com.jiange.model;

public class Car {
	private int id;
	private String name;
	private String type;
	private String license;
	private int ride;
	private int load;
	private String picture;
	private double price;
	private int times;
	
	
	public int getTimes() {
		return times;
	}
	public void setTimes(int times) {
		this.times = times;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public int getRide() {
		return ride;
	}
	public void setRide(int ride) {
		this.ride = ride;
	}
	public int getLoad() {
		return load;
	}
	public void setLoad(int load) {
		this.load = load;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	//÷ÿ–¥toString∑Ω∑®
	public String toString() {
		return "Car [id=" + id + ", name=" + name + ", type=" + type + ", license=" + license + ", ride=" + ride
				+ ", load=" + load + ", picture=" + picture + ", price=" + price + "]";
	}
}
