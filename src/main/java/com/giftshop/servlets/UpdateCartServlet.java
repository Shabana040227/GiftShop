package com.giftshop.servlets;

import java.io.IOException;
import java.util.List;

import com.giftshop.models.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            for (CartItem item : cart) {
                String param = "quantity_" + item.getProductId();
                String quantityStr = request.getParameter(param);
                try {
                    int quantity = Integer.parseInt(quantityStr);
                    if (quantity > 0) {
                        item.setQuantity(quantity);
                    }
                } catch (NumberFormatException ignored) {}
            }
        }

        response.sendRedirect("view-cart.jsp");
    }
}
