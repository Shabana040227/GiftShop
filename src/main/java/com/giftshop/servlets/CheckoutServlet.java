package com.giftshop.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.giftshop.daoimpl.OrderDAOImpl;
import com.giftshop.daoimpl.OrderItemDAOImpl;
import com.giftshop.interfaces.OrderDAO;
import com.giftshop.interfaces.OrderItemDAO;
import com.giftshop.models.CartItem;
import com.giftshop.models.Order;
import com.giftshop.models.OrderItem;
import com.giftshop.models.User;
import com.giftshop.util.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[DEBUG] CheckoutServlet: doPost() called");

        // Retrieve shipping address from the request
        String shippingAddress = request.getParameter("shippingAddress");
        if (shippingAddress == null || shippingAddress.trim().isEmpty()) {
            System.out.println("[ERROR] Shipping address is required");
            response.sendRedirect("checkout.jsp?error=Shipping address is required");
            return;
        }
        System.out.println("[DEBUG] Shipping Address: " + shippingAddress);

        // Get user session and cart data
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        User user = (User) session.getAttribute("currentUser");

        // Check if cart is empty or null
        if (cart == null || cart.isEmpty()) {
            System.out.println("[ERROR] Cart is empty or null");
            response.sendRedirect("cart.jsp");
            return;
        }

        // Check if user is logged in
        if (user == null) {
            System.out.println("[ERROR] User not logged in");
            response.sendRedirect("login.jsp");
            return;
        }

        System.out.println("[DEBUG] User ID: " + user.getId());
        System.out.println("[DEBUG] Cart Size: " + cart.size());

        // Calculate total order amount
        double total = 0;
        for (CartItem item : cart) {
            total += item.getTotalPrice();
            System.out.println("[DEBUG] CartItem - ProductID: " + item.getProductId() + ", Qty: " + item.getQuantity() + ", Price: " + item.getPrice() + ", Total: " + item.getTotalPrice());
        }

        System.out.println("[DEBUG] Total Order Amount: " + total);

        // Get database connection
        Connection conn = DBConnection.getConnection();
        if (conn == null) {
            System.out.println("[ERROR] Database connection failed");
            response.sendRedirect("error.jsp");
            return;
        }

        // Initialize DAO classes
        OrderDAO orderDAO = new OrderDAOImpl(conn);
        OrderItemDAO orderItemDAO = new OrderItemDAOImpl(conn);

        try {
            // Create new Order object
            Order order = new Order();
            order.setUserId(user.getId());
            order.setTotalAmount(total);
            order.setShippingAddress(shippingAddress);
            order.setStatus("Placed");

            // Place order and get order ID
            int orderId = orderDAO.placeOrder(order);
            System.out.println("[DEBUG] Order Placed with ID: " + orderId);

            // Add order items to the database
            for (CartItem item : cart) {
                OrderItem oi = new OrderItem();
                oi.setOrderId(orderId);  // This should be set as order_id in DB
                oi.setProductId(item.getProductId());
                oi.setQuantity(item.getQuantity());
                oi.setPrice(item.getPrice());

                boolean added = orderItemDAO.addOrderItem(oi);
                System.out.println("[DEBUG] OrderItem added: ProductID=" + oi.getProductId() + ", Qty=" + oi.getQuantity() + ", Price=" + oi.getPrice() + " | Success=" + added);
            }

            // Clear the cart after placing the order
            session.removeAttribute("cart");
            System.out.println("[DEBUG] Cart cleared after order");

            // Optionally logout the user
            // session.removeAttribute("user");
            // session.invalidate();

            // Send orderId to success page
            request.setAttribute("orderId", orderId);
            RequestDispatcher rd = request.getRequestDispatcher("order-success.jsp");
            rd.forward(request, response);
            System.out.println("[DEBUG] Redirected to order-success.jsp");

        } catch (Exception e) {
            System.out.println("[ERROR] Database error while placing order: " + e.getMessage());
            response.sendRedirect("error.jsp");
        }
    }
}
