package com.giftshop.servlets;

import java.io.IOException;
import java.sql.Connection;

import com.giftshop.daoimpl.UserDAOImpl;
import com.giftshop.interfaces.UserDAO;
import com.giftshop.models.User;
import com.giftshop.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     try {
         // Get form values
         String name = request.getParameter("name");
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         String address = request.getParameter("address");
         String city = request.getParameter("city");
         String state = request.getParameter("state");
         String zip = request.getParameter("zip");
         String phone = request.getParameter("phone");

         // Create User object
         User user = new User();
         user.setName(name);
         user.setEmail(email);
         user.setPassword(password);
         user.setAddress(address);
         user.setCity(city);
         user.setState(state);
         user.setZipCode(zip);
         user.setPhone(phone);
         user.setRole("customer"); // Default role

         // Save to database
         Connection conn = DBConnection.getConnection();
         UserDAO userDAO = new UserDAOImpl(conn);
         boolean result = userDAO.registerUser(user);
         conn.close();
         System.out.println("Registration successful");

         if (result) {
             response.sendRedirect("login.jsp");
         } else {
             response.sendRedirect("register.jsp?error=Registration failed");
         }
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("register.jsp?error=Exception occurred");
     }
 }
}
