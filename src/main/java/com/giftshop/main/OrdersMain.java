package com.giftshop.main;

import java.sql.Connection;
import java.util.List;

import com.giftshop.daoimpl.OrderDAOImpl;
import com.giftshop.daoimpl.UserDAOImpl;
import com.giftshop.interfaces.OrderDAO;
import com.giftshop.interfaces.UserDAO;
import com.giftshop.models.Order;
import com.giftshop.models.User;
import com.giftshop.util.DBConnection;

public class OrdersMain {
	public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            OrderDAO orderDAO = new OrderDAOImpl(conn);
            UserDAO userDAO = new UserDAOImpl(conn); // Reuse if you have it already

            // Make sure a user exists
            User user = new User();
            user.setName("Test User");
            user.setEmail("test@example.com");
            user.setPassword("123456");
            user.setAddress("123 Test Lane");
            user.setCity("TestCity");
            user.setState("TS");
            user.setZipCode("12345");
            user.setPhone("1234567890");
            user.setRole("customer");

            userDAO.registerUser(user); // Optional if user already exists
            int userId = userDAO.getUserByEmailAndPassword("test@example.com", "123456").getId();

            // Create a new order
            Order order = new Order();
            order.setUserId(userId);
            order.setTotalAmount(199.99);
            order.setShippingAddress("123 Test Lane, TestCity, TS 12345");
            order.setStatus("Placed");

            int orderPlaced = orderDAO.placeOrder(order);
            System.out.println("Order placed: " + orderPlaced);

            // Retrieve order by ID
            Order fetchedOrder = orderDAO.getOrderById(order.getId());
            if (fetchedOrder != null) {
                System.out.println("Fetched Order ID: " + fetchedOrder.getId());
                System.out.println("Total: " + fetchedOrder.getTotalAmount());
                System.out.println("Status: " + fetchedOrder.getStatus());
            }

            // List all orders by user
            List<Order> userOrders = orderDAO.getOrdersByUserId(userId);
            System.out.println("Orders for user " + userId + ":");
            for (Order o : userOrders) {
                System.out.println("Order ID: " + o.getId() + ", Total: " + o.getTotalAmount());
            }

            // Update order status
            boolean updated = orderDAO.updateOrderStatus(order.getId(), "Shipped");
            System.out.println("Order status updated: " + updated);

            // Delete order (optional)
            // boolean deleted = orderDAO.deleteOrder(order.getId());
            // System.out.println("Order deleted: " + deleted);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
