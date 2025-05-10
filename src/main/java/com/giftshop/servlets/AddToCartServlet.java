package com.giftshop.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.giftshop.daoimpl.ProductDAOImpl;
import com.giftshop.interfaces.ProductDAO;
import com.giftshop.models.CartItem;
import com.giftshop.models.Product;
import com.giftshop.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;
        for (CartItem item : cart) {
            if (item.getProductId() == productId) {
                item.setQuantity(item.getQuantity() + quantity);
                found = true;
                break;
            }
        }

        if (!found) {
            try {
                Connection conn = DBConnection.getConnection();
                ProductDAO productDAO = new ProductDAOImpl(conn);
                Product product = productDAO.getProductById(productId);
                conn.close();

                if (product != null) {
                    CartItem newItem = new CartItem(product.getId(), product.getName(), quantity, product.getPrice());
                    newItem.setProduct(product); // ✅ Fix: Set the full product object
                    cart.add(newItem);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}
