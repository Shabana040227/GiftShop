package com.giftshop.interfaces;

import java.util.List;

import com.giftshop.models.Order;


public interface OrderDAO {
	int placeOrder(Order order);
    Order getOrderById(int id);
    List<Order> getOrdersByUserId(int userId);
    List<Order> getAllOrders();
    boolean updateOrderStatus(int orderId, String status);
    boolean deleteOrder(int orderId);
	List<Order> getOrdersByFilter(int userId, String status, String startDate, String endDate);
}
