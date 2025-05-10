package com.giftshop.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.giftshop.interfaces.OrderItemDAO;
import com.giftshop.models.OrderItem;

public class OrderItemDAOImpl implements OrderItemDAO {
    private Connection conn;
    public OrderItemDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addOrderItem(OrderItem item) {
        String sql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?,?,?,?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getProductId());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getPrice());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<OrderItem> getItemsByOrderId(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT * FROM order_items WHERE order_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderItem it = new OrderItem();
                it.setOrderId(orderId);
                it.setProductId(rs.getInt("product_id"));
                it.setQuantity(rs.getInt("quantity"));
                it.setPrice(rs.getDouble("price"));
                items.add(it);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

	@Override
	public List<OrderItem> getOrderItemsByOrderId(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteOrderItem(int id) {
		// TODO Auto-generated method stub
		return false;
	}
}
