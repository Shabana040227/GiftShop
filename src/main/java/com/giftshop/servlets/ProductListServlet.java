package com.giftshop.servlets;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.giftshop.daoimpl.ProductDAOImpl;
import com.giftshop.models.Product;
import com.giftshop.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductListServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try (Connection conn = DBConnection.getConnection()) {

        String category = request.getParameter("category");
        String sort = request.getParameter("sort");

        ProductDAOImpl productDAO = new ProductDAOImpl(conn);
        List<Product> productList;

        if (category != null && !category.isEmpty()) {
            productList = productDAO.getProductsByCategory(category);
        } else {
            productList = productDAO.getAllProducts();
        }

        if ("priceAsc".equals(sort)) {
            productList.sort((a, b) -> Double.compare(a.getPrice(), b.getPrice()));
        } else if ("priceDesc".equals(sort)) {
            productList.sort((a, b) -> Double.compare(b.getPrice(), a.getPrice()));
        }

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("products.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("Error loading products.");
    }
}
}
