package com.lgeek.app.model;

public class ShoppingCartItem {

    private Product product;
    private int quantity;

    public ShoppingCartItem(Product product) {
        this.product = product;
        this.quantity = 1;
    }

    public Product getProduct() {
        return product;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public float getItemMoney() {
        return product.getPrice() * quantity;
    }
    public void increment() {
        quantity++;
    }

}
