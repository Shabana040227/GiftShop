package com.giftshop.main;

import java.sql.Connection;

import com.giftshop.daoimpl.UserDAOImpl;
import com.giftshop.models.User;

public class Main {

	private static Connection conn;

	public static void main(String[] args) {
		
		try {
            UserDAOImpl userDAO = new UserDAOImpl(conn);

            // Register new user
            User user = new User();
            user.setName("Alice");
            user.setEmail("alice@example.com");
            user.setPassword("securepass123");
            user.setAddress("123 Gift Lane");
            user.setCity("New York");
            user.setState("NY");
            user.setZipCode("10001");
            user.setPhone("1234567890");
            user.setRole("customer");

            boolean success = userDAO.registerUser(user);
            System.out.println("User registration: " + success);

            // Login test
            User loginUser = userDAO.getUserByEmailAndPassword("alice@example.com", "securepass123");
            if (loginUser != null) {
                System.out.println("Login successful! Welcome " + loginUser.getName());
            } else {
                System.out.println("Login failed.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
        
	}

