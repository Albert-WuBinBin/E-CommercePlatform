package com.lgeek.app.model;

public class User1 {

    private String u_id;
    private String u_name;
    private String u_password;
    private String u_phone;
    private String u_email;
    private String u_address;
    private int u_age;
    private String u_sex;
    private int u_money;
    private String u_idcart;
    private String u_position;
    private Product product;
    private Shop shop;
    public String getu_id() {
        return u_id;
    }

    public void setId(String u_id) {
        this.u_id = u_id;
    }

    public String getu_name() {
        return u_name;
    }

    public void setu_name(String u_name) {
        this.u_name = u_name;
    }

    public String getu_password() {
        return u_password;
    }

    public void setu_password(String u_password) {
        this.u_password = u_password;
    }

    public String getu_phone() {
        return u_phone;
    }

    public void setu_phone(String u_phone) {
        this.u_phone = u_phone;
    }

    public String getu_email() {
        return u_email;
    }

    public void setu_email(String u_email) {
        this.u_email = u_email;
    }

    public int getu_age() {
        return u_age;
    }

    public void setu_age(int u_age) {
        this.u_age = u_age;
    }

    public String getu_sex() {
        return u_sex;
    }

    public void setu_sex(String u_sex) {
        this.u_sex = u_sex;
    }

    public int getu_money() {
        return u_money;
    }

    public void setu_money(int u_money) {
        this.u_money = u_money;
    }

    public String getu_idcart() {
        return u_idcart;
    }

    public void setu_idcart(String u_idcart) {
        this.u_idcart = u_idcart;
    }
    
    public String getu_position() {
        return u_position;
    }

    public void setu_position(String u_position) {
        this.u_position = u_position;
    }

    public String getu_address() {
        return u_address;
    }

    public void setu_address(String u_address) {
        this.u_address = u_address;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }
    
        public User1(String u_id, String u_name, String u_password, String u_phone, String u_email, String u_address, int u_age, String u_sex,int u_money,String u_idcart, String u_position) {
        this.u_id = u_id;
        this.u_name = u_name;
        this.u_password = u_password;
        this.u_phone = u_phone;
        this.u_email = u_email;
        this.u_address = u_address;
        this.u_age = u_age;
        this.u_sex = u_sex;
        this.u_money=u_money;
        this.u_idcart=u_idcart;
        this.u_position = u_position;
       
    }
    public User1(String u_id, String u_name, String u_password, String u_phone, String u_email, String u_address, int u_age, String u_sex,int u_money,String u_idcart, String u_position,Shop shop) {
        this.u_id = u_id;
        this.u_name = u_name;
        this.u_password = u_password;
        this.u_phone = u_phone;
        this.u_email = u_email;
        this.u_address = u_address;
        this.u_age = u_age;
        this.u_sex = u_sex;
        this.u_money=u_money;
        this.u_idcart=u_idcart;
        this.u_position = u_position;
        this.shop=shop;
    }

    public Product getProduct() {
        return product;
    }

    public void setProuct(Product product) {
        this.product = product;
    }

    public User1(String u_id, String u_name, String u_password, String u_phone, String u_email, String u_address, int u_age, String u_sex,int u_money,String u_idcart, String u_position, Product product) {
        this.u_id = u_id;
        this.u_name = u_name;
        this.u_password = u_password;
        this.u_phone = u_phone;
        this.u_email = u_email;
        this.u_address = u_address;
        this.u_age = u_age;
        this.u_sex = u_sex;
        this.u_money=u_money;
        this.u_idcart=u_idcart;
        this.u_position = u_position;
        this.product = product;
    }

    public User1() {
    }

	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_name=" + u_name + ", u_password=" + u_password + ", u_phone=" + u_phone + ", u_email=" + u_email
				+ ", u_address=" + u_address + ", u_age=" + u_age + ", u_sex=" + u_sex + ", u_money=" + u_money + ", u_idcart=" + u_idcart
				+ ", u_position=" + u_position  + ", shop=" + shop + "]";
	}
    
}
