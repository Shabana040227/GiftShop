package com.giftshop.servlets;

import java.io.IOException;
import java.sql.Connection;

import com.giftshop.daoimpl.ProductDAOImpl;
import com.giftshop.interfaces.ProductDAO;
import com.giftshop.models.Product;
import com.giftshop.util.DBConnection; // make sure this is your actual DB connection utility

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 💥 FIX: Initialize the connection properly
        try (Connection conn = DBConnection.getConnection()) {
            ProductDAO productDAO = new ProductDAOImpl(conn);
            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(productId);
            request.setAttribute("product", product);
            request.getRequestDispatcher("edit-product.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
