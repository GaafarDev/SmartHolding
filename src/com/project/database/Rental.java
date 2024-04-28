package com.project.database;

import java.io.Serializable;
//import java.time.LocalDate;

public class Rental implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rentalId;
	private int tenantId;
	private int roomId;
	private String rentalDate;
	private String rentalDateEnd;
	
	public String getRentalDateEnd() {
		return rentalDateEnd;
	}
	public void setRentalDateEnd(String rentalDateEnd) {
		this.rentalDateEnd = rentalDateEnd;
	}
	public int getRentalId() {
		return rentalId;
	}
	public void setRentalId(int rentalId) {
		this.rentalId = rentalId;
	}
	public int getTenantId() {
		return tenantId;
	}
	public void setTenantId(int tenantId) {
		this.tenantId = tenantId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	} 
}
