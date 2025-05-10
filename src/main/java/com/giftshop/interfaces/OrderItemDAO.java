package com.giftshop.interfaces;

import java.util.List;

import com.giftshop.models.OrderItem;

public interface OrderItemDAO {
	boolean addOrderItem(OrderItem orderItem);
    List<OrderItem> getOrderItemsByOrderId(int orderId);
    boolean deleteOrderItem(int id);
	List<OrderItem> getItemsByOrderId(int orderId);
}
