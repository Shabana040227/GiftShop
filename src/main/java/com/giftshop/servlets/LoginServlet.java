package com.giftshop.servlets;

import java.io.IOException;
import java.sql.Connection;

import com.giftshop.daoimpl.UserDAOImpl;
import com.giftshop.interfaces.UserDAO;
import com.giftshop.models.User;
import com.giftshop.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Connection conn = DBConnection.getConnection();
            UserDAO userDAO = new UserDAOImpl(conn);
            User user = userDAO.getUserByEmailAndPassword(email,password);

            conn.close();

            if (user != null && user.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                response.sendRedirect("products"); 
            } else {
                response.sendRedirect("login.jsp?error=Invalid email or password");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=An error occurred during login");
        }
    }
}