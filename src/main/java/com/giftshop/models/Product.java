package com.giftshop.models;

public class Product {
	
	    private int id;
	    private String name;
	    private String description;
	    private double price;
	    private String image_url;
	    private String category;

	    // Getters and Setters
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
	    public String getDescription() {
	        return description;
	    }
	    public void setDescription(String description) {
	        this.description = description;
	    }
	    public double getPrice() {
	        return price;
	    }
	    public void setPrice(double price) {
	        this.price = price;
	    }
	   
	    public String getCategory() {
	        return category;
	    }
	    public void setCategory(String category) {
	        this.category = category;
	    }
		public Product() {
			super();
		}
		
		public Product(int id, String name, String description, double price, String imageUrl, String category) {
			super();
			this.id = id;
			this.name = name;
			this.description = description;
			this.price = price;
			this.image_url = imageUrl;
			this.category = category;
		}
		@Override
		public String toString() {
			return "Product [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price
					+ ", imageUrl=" + image_url + ", category=" + category + "]";
		}
		public String getImage_url() {
			return image_url;
		}
		public void setImage_url(String image_url) {
			this.image_url = image_url;
		}
	    
	    

}
