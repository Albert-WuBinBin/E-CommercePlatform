package com.lgeek.app.model;



import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {

    private Map<Integer, ShoppingCartItem> products = new HashMap<>();

    public void updateItemQuantity(Integer id, int quantity) {
        ShoppingCartItem sci = products.get(id);
        if (sci != null) {
            sci.setQuantity(quantity);
        }
    }

    public void removeItem(Integer id) {
        products.remove(id);
    }

  
    public void clear() {
        products.clear();
    }

    public boolean isEmpty() {
        return products.isEmpty();
    }

    public float getTotalMoney() {
        float total = 0;

        for (ShoppingCartItem sci : getItems()) {
            total += sci.getItemMoney();
        }

        return total;
    }

    public Collection<ShoppingCartItem> getItems() {
        return products.values();
    }

    public int getProductNumber() {
        int total = 0;

        for (ShoppingCartItem sci : products.values()) {
            total += sci.getQuantity();
        }

        return total;
    }

    public Map<Integer, ShoppingCartItem> getProducts() {
        return products;
    }

    public boolean hasProduct(Integer id) {
        return products.containsKey(id);
    }

    /**
	 * 向购物车中添加一件商品		
	 * @param product
	 */
    public void addProduct(Product product) {

        ShoppingCartItem sci = products.get(product.getId());

        if (sci == null) {
            sci = new ShoppingCartItem(product);
            products.put(product.getId(), sci);
        } else {
            sci.increment();
        }
    }
}
