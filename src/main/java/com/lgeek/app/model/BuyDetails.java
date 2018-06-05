package com.lgeek.app.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author AlbertPC
 */
public class BuyDetails {
   
	private Integer id ;
	private String orderId;
    private String request;
    private String state;
    private String confirm;
    private String delivery;
    private String comment;
    private Date date;
    private Integer quantity;
    private Float cost;
    private String name;
   	private String phone ;
   	private String address;
    private String u_id;
//    private String p_id;
	private Shop shop;
	private Product product;

	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Float getCost() {
		return cost;
	}
	public void setCost(Float cost) {
		this.cost = cost;
	}
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
//	public String getU_id() {
//		return u_id;
//	}
//	public void setU_id(String u_id) {
//		this.u_id = u_id;
//	}
//	public String getP_id() {
//		return p_id;
//	}
//	public void setP_id(String p_id) {
//		this.p_id = p_id;
//	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public BuyDetails(String orderId ,String request, String state, String confirm, String delivery, String comment, Date date,
			Integer quantity, Float cost, String name, String phone, String address, String u_id, Product product) {
		super();
		this.orderId = orderId;
		this.request = request;
		this.state = state;
		this.confirm = confirm;
		this.delivery = delivery;
		this.comment = comment;
		this.date = date;
		this.quantity = quantity;
		this.cost = cost;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.u_id = u_id;
		this.product = product;
	}
	
	public BuyDetails() {
		super();
	}
}
	
