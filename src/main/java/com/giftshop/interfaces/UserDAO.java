package com.giftshop.interfaces;

import java.sql.SQLException;
import java.util.List;

import com.giftshop.models.User;

public interface UserDAO {
	boolean registerUser(User user);
    User getUserByEmailAndPassword(String email, String password);
    User getUserById(int id);
    List<User> getAllUsers();
    boolean updateUser(User user);
    boolean deleteUser(int id);
	boolean updatePassword(int userId, String newPassword) throws SQLException;
	User login(String email, String password) throws SQLException;
}
