package com.lgeek.app.model;

import java.util.Date;

public class User {

    private String id;
    private String name;
    private String password;
    private String phone;
    private String email;
    private String address;
    private Integer age;
    private String sex;
    private Integer money;
    private String idcart;
    private String position;
    private Date createTime;
    private Product product;
    private Shop shop;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getIdcart() {
        return idcart;
    }

    public void setIdcart(String idcart) {
        this.idcart = idcart;
    }
    
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }
    
        public User(String id, String name, String password, String phone, String email, String address, int age, String sex,int money,String idcart, String position) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.age = age;
        this.sex = sex;
        this.money=money;
        this.idcart=idcart;
        this.position = position;
       
    }
    public User(String id, String name, String password, String phone, String email, String address, int age, String sex,int money,String idcart, String position,Shop shop) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.age = age;
        this.sex = sex;
        this.money=money;
        this.idcart=idcart;
        this.position = position;
        this.shop=shop;
    }

    public Product getProduct() {
        return product;
    }

    public void setProuct(Product product) {
        this.product = product;
    }

    public User(String id, String name, String password, String phone, String email, String address, int age, String sex,int money,String idcart, String position, Product product) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.age = age;
        this.sex = sex;
        this.money=money;
        this.idcart=idcart;
        this.position = position;
        this.product = product;
    }
    
    public User(String id, String name, String phone, String email, String address, int age, String sex,
			String idcart) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.age = age;
		this.sex = sex;
		this.idcart = idcart;
	}

	public User() {
    }

	public User(String id) {
		super();
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", phone=" + phone + ", email=" + email
				+ ", address=" + address + ", age=" + age + ", sex=" + sex + ", money=" + money + ", idcart=" + idcart
				+ ", position=" + position + ", product=" + product + ", shop=" + shop + "]";
	}
    
}
