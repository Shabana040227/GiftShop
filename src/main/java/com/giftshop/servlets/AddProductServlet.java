package com.giftshop.servlets;

import com.giftshop.interfaces.ProductDAO;
import com.giftshop.daoimpl.ProductDAOImpl;
import com.giftshop.models.Product;
import com.giftshop.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;


public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl");

        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setImage_url(imageUrl);

        Connection conn = DBConnection.getConnection();
        ProductDAO productDAO = new ProductDAOImpl(conn); // ✅
        boolean success = productDAO.addProduct(product);

        if (success) {
            response.sendRedirect("manage-products.jsp?msg=added");
        } else {
            response.sendRedirect("add-product.jsp?error=1");
        }
    }
}
