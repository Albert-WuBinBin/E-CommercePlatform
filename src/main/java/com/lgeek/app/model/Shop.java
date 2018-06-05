package com.lgeek.app.model;

/**
 *
 * @author AlbertPC
 */
public class Shop {
    private Integer id;
    private String name;
    private String flag;
    public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	private Product product;
   
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    

    public Shop(String name) {
        this.name = name;
    }
    public Shop(Integer id) {
        this.id = id;
    }
    public Shop(Integer id, String name, Product product) {
        this.id = id;
        this.name = name;
        this.product = product;
    }
    
    public Shop() {
    }
    
	@Override
	public String toString() {
		return "Shop [id=" + id + ", name=" + name + ", flag=" + flag + "]";
	}
    	
}
