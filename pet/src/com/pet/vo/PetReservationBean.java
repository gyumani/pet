package com.pet.vo;

public class PetReservationBean {
	private String userId;
	private String name;
	private String point_addr;
	private String pickUp;
	private String dateStart;
	private String dateEnd;
	private String withPackage;
	private String dogSize[];
	private String memo;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPoint_addr() {
		return point_addr;
	}
	public void setPoint_addr(String point_addr) {
		this.point_addr = point_addr;
	}
	public String getPickUp() {
		return pickUp;
	}
	public void setPickUp(String pickUp) {
		this.pickUp = pickUp;
	}
	public String getDateStart() {
		return dateStart;
	}
	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}
	public String getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	public String getWithPackage() {
		return withPackage;
	}
	public void setWithPackage(String withPackage) {
		this.withPackage = withPackage;
	}
	public String[] getDogSize() {
		return dogSize;
	}
	public void setDogSize(String[] dogSize) {
		this.dogSize = dogSize;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
}
