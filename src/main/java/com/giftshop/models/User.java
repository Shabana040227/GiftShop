package com.giftshop.models;

public class User {
	    private int id;
	    private String name;
	    private String email;
	    private String password;
	    private String address;
	    private String city;
	    private String state;
	    private String zipCode;
	    private String phone;
	    private String role;

	    
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

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getZipCode() {
			return zipCode;
		}

		public void setZipCode(String zipCode) {
			this.zipCode = zipCode;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public User() {}

	    public User(int id, String name, String email, String password, String address, String city, String state, String zipCode, String phone, String role) {
	        this.id = id;
	        this.name = name;
	        this.email = email;
	        this.password = password;
	        this.address = address;
	        this.city = city;
	        this.state = state;
	        this.zipCode = zipCode;
	        this.phone = phone;
	        this.role = role;
	    }

		@Override
		public String toString() {
			return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", address="
					+ address + ", city=" + city + ", state=" + state + ", zipCode=" + zipCode + ", phone=" + phone
					+ ", role=" + role + "]";
		}
	    
	    

}
