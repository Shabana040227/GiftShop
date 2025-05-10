package com.giftshop.main;

import java.sql.Connection;
import java.util.List;

import com.giftshop.daoimpl.ProductDAOImpl;
import com.giftshop.interfaces.ProductDAO;
import com.giftshop.models.Product;
import com.giftshop.util.DBConnection;

public class ProductMain {
	public static void main(String[] args) {
        Connection conn = DBConnection.getConnection();
        ProductDAO productDAO = new ProductDAOImpl(conn);

        // Create a new product
        Product newProduct = new Product();
        newProduct.setName("micky mouse");
        newProduct.setDescription("A cute micky mouse.");
        newProduct.setPrice(19.99);
        newProduct.setImage_url("images/micky_mouse.jpg");
        newProduct.setCategory("Toys");

        boolean added = productDAO.addProduct(newProduct);
        System.out.println("Product added: " + added);

        // Fetch all products
        List<Product> productList = productDAO.getAllProducts();
        System.out.println("Product List:");
        for (Product p : productList) {
            System.out.println(p.getId() + " | " + p.getName() + " | " + p.getPrice());
        }

        // Get a product by ID
        Product singleProduct = productDAO.getProductById(4);
        if (singleProduct != null) {
            System.out.println("Fetched Product: " + singleProduct.getName());
        } else {
            System.out.println("Product not found!");
        }

        // Update product
        if (singleProduct != null) {
            singleProduct.setPrice(24.99);
            boolean update = productDAO.updateProduct(singleProduct);
            System.out.println("Product updated: " + update);
        }

        // Delete product
        boolean deleted = productDAO.deleteProduct(4); // Change ID as needed
        System.out.println("Product deleted: " + deleted);
    }
}
