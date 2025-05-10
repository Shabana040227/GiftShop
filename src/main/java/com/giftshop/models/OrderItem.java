package com.giftshop.models;

public class OrderItem {
	  private int id;
	    private int orderId;
	    private int productId;
	    private int quantity;
	    private double price;

	    // Constructors
	    public OrderItem() {}

	    public OrderItem(int orderId, int productId, int quantity, double price) {
	        this.orderId = orderId;
	        this.productId = productId;
	        this.quantity = quantity;
	        this.price = price;
	    }

	    // Getters and Setters
	    public int getId() { return id; }
	    public void setId(int id) { this.id = id; }

	    public int getOrderId() { return orderId; }
	    public void setOrderId(int orderId2) { this.orderId = orderId2; }

	    public int getProductId() { return productId; }
	    public void setProductId(int productId) { this.productId = productId; }

	    public int getQuantity() { return quantity; }
	    public void setQuantity(int quantity) { this.quantity = quantity; }

	    public double getPrice() { return price; }
	    public void setPrice(double price) { this.price = price; }

		public void setId(boolean orderId2) {
			// TODO Auto-generated method stub
			
		}
}
