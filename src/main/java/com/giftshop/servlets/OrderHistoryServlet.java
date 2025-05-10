package com.giftshop.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.giftshop.daoimpl.OrderDAOImpl;
import com.giftshop.daoimpl.OrderItemDAOImpl;
import com.giftshop.interfaces.OrderDAO;
import com.giftshop.interfaces.OrderItemDAO;
import com.giftshop.models.Order;
import com.giftshop.models.OrderItem;
import com.giftshop.models.User;
import com.giftshop.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            OrderDAO orderDAO = new OrderDAOImpl(conn);
            List<Order> orders = orderDAO.getOrdersByUserId(user.getId());

            OrderItemDAO itemDAO = new OrderItemDAOImpl(conn);
            for (Order o : orders) {
                List<OrderItem> items = itemDAO.getItemsByOrderId(o.getId());
                o.setItems(items);
            }

            req.setAttribute("orders", orders);
            req.getRequestDispatcher("order-history.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}