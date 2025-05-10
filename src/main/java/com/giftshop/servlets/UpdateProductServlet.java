package com.giftshop.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import com.giftshop.daoimpl.ProductDAOImpl;
import com.giftshop.interfaces.ProductDAO;
import com.giftshop.models.Product;
import com.giftshop.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,       // 10 MB
    maxRequestSize = 1024 * 1024 * 15     // 15 MB
)
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));

            Part filePart = request.getPart("imageFile"); // get the uploaded file
            String fileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString();

            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String filePath = "uploads" + File.separator + fileName;
            File file = new File(uploadPath, fileName);

            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
            }

            Product updatedProduct = new Product();
            updatedProduct.setId(id);
            updatedProduct.setName(name);
            updatedProduct.setDescription(description);
            updatedProduct.setPrice(price);
            updatedProduct.setImage_url(filePart.getSize() > 0 ? filePath : null); // update only if new image uploaded

            ProductDAO productDAO = new ProductDAOImpl(DBConnection.getConnection());
            boolean result = productDAO.updateProduct(updatedProduct);

            if (result) {
                response.sendRedirect("manage-products.jsp?success=Product+updated+successfully");
            } else {
                response.sendRedirect("edit-product.jsp?id=" + id + "&error=Update+failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edit-product.jsp?id=" + request.getParameter("id") + "&error=Invalid+input");
        }
    }
}
