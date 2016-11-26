package com.jiange.model;

import java.util.Date;

public class Order {
	private int id ;
	private String username ;
	private String carName;
	private String license;
	private Date time_out;
	private Date time_in;
	private int days;
	private double pre_cost;
	private Date real_time_in;
	private double real_cost;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public Date getTime_out() {
		return time_out;
	}
	public void setTime_out(Date time_out) {
		this.time_out = time_out;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public double getPre_cost() {
		return pre_cost;
	}
	public void setPre_cost(double pre_cost) {
		this.pre_cost = pre_cost;
	}
	public Date getTime_in() {
		return time_in;
	}
	public void setTime_in(Date time_in) {
		this.time_in = time_in;
	}
	public double getReal_cost() {
		return real_cost;
	}
	public void setReal_cost(double real_cost) {
		this.real_cost = real_cost;
	}
	public Date getReal_time_in() {
		return real_time_in;
	}
	public void setReal_time_in(Date real_time_in) {
		this.real_time_in = real_time_in;
	}
	
	
}
