package com.lgeek.app.model;

/**
 *
 * @author AlbertPC
 */
public class ReceiptAddress {
	private String name;
	private String phone;
	private String address;
	private String u_id;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	@Override
	public String toString() {
		return "ReceiptAddress [name=" + name + ", phone=" + phone + ", address=" + address + ", u_id=" + u_id + "]";
	}
	public ReceiptAddress(String name, String phone, String address, String u_id) {
		super();
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.u_id = u_id;
	}
	public ReceiptAddress() {
		super();
	}
	
	
}
