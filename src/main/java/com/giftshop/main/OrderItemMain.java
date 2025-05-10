package com.giftshop.main;

import java.sql.Connection;
import java.util.List;

import com.giftshop.daoimpl.OrderItemDAOImpl;
import com.giftshop.models.OrderItem;
import com.giftshop.util.DBConnection;

public class OrderItemMain {
	public static void main(String[] args) {
        try {
            Connection conn = DBConnection.getConnection();
            OrderItemDAOImpl orderItemDAO = new OrderItemDAOImpl(conn);

            // Insert a new order item
            OrderItem item = new OrderItem();
            item.setOrderId(1); // Make sure order_id 1 exists
            item.setProductId(4); // Make sure product_id 1 exists
            item.setQuantity(2);
            item.setPrice(19.99);

            boolean inserted = orderItemDAO.addOrderItem(item);
            System.out.println("Order item inserted: " + inserted);

            // Fetch items by order ID
            List<OrderItem> items = orderItemDAO.getOrderItemsByOrderId(1);
            System.out.println("Order items for order_id = 1:");
            for (OrderItem i : items) {
                System.out.println("ID: " + i.getId() + ", Product ID: " + i.getProductId() +
                        ", Quantity: " + i.getQuantity() + ", Price: " + i.getPrice());
            }

            // Optional: Delete a specific order item by ID
            /*
            boolean deleted = orderItemDAO.deleteOrderItem(1);
            System.out.println("Order item deleted: " + deleted);
            */

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
