package com.lgeek.app.model;

import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer id;
    private String code;//物料编码
    private String name;
    private String describe;
    private String model;//规格型号
    private String unit;//单位
    private Float untaxPrice;//未税单价
    private Float taxPrice;//含税单价
    private Float price;//市场价格
    private String image;
    private Integer stock;
    private String brand;
    private Date createTime;
    private Integer flag ;
    private Category category;
    private Shop shop;
    
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

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    
    public Product(int id, String name, String describe, Float price, String image, int stock, String brand, Category category) {
        this.id = id;
        this.name = name;
        this.describe = describe;
        this.price = price;
        this.image = image;
        this.stock = stock;
        this.brand = brand;
        this.category = category;
    }

    public Product(int id, String name, String describe, Float price, String image, int stock, String brand) {
        this.id = id;
        this.name = name;
        this.describe = describe;
        this.price = price;
        this.image = image;
        this.stock = stock;
        this.brand = brand;
    }

    public Product(int id, String name, String describe, Float price, String image, int stock, String brand, Category category, Shop shop) {
        this.id = id;
        this.name = name;
        this.describe = describe;
        this.price = price;
        this.image = image;
        this.stock = stock;
        this.brand = brand;
        this.category = category;
        this.shop = shop;
    }
   
    public Product() {
    }
    
	public Product(int id) {
		super();
		this.id = id;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Float getTaxPrice() {
		return taxPrice;
	}
	public void setTaxPrice(Float taxPrice) {
		this.taxPrice = taxPrice;
	}
	public Float getUntaxPrice() {
		return untaxPrice;
	}
	public void setUntaxPrice(Float untaxPrice) {
		this.untaxPrice = untaxPrice;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
  
}
