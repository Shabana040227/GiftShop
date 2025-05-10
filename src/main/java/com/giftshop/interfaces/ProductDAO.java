package com.giftshop.interfaces;

import java.sql.SQLException;
import java.util.List;

import com.giftshop.models.Product;

public interface ProductDAO {
	boolean addProduct(Product product);
    Product getProductById(int id);
    List<Product> getAllProducts();
    boolean updateProduct(Product product);
    boolean deleteProduct(int id);
	List<Product> getProductsByCategory(String category) throws SQLException;
}
