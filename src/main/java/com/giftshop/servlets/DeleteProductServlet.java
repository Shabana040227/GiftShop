package com.giftshop.servlets;

import com.giftshop.interfaces.ProductDAO;
import com.giftshop.daoimpl.ProductDAOImpl;
import com.giftshop.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

public class DeleteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        ProductDAO productDAO = new ProductDAOImpl(DBConnection.getConnection());
        boolean result = productDAO.deleteProduct(id);

        if (result) {
            response.sendRedirect("manage-products.jsp?success=Product deleted successfully");
        } else {
            response.sendRedirect("manage-products.jsp?error=Delete failed");
        }
    }
}
