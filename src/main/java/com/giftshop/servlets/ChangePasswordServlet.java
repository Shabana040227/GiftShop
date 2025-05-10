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
import jakarta.servlet.http.HttpSession;


public class ChangePasswordServlet extends HttpServlet {

    // Password must be at least 8 characters with uppercase, lowercase, digit, and special character
    private static final String STRENGTH_REGEX =
            "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!]).{8,}$";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate strength
        if (!newPassword.matches(STRENGTH_REGEX)) {
            response.sendRedirect("change-password.jsp?error=strength");
            return;
        }

        // Validate new password and confirm match
        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("change-password.jsp?error=mismatch");
            return;
        }

        // Validate current password
        if (!user.getPassword().equals(currentPassword)) {
            response.sendRedirect("change-password.jsp?error=wrong");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            UserDAOImpl userDAO = new UserDAOImpl(conn);
            boolean updated = userDAO.updatePassword(user.getId(), newPassword);
            if (updated) {
                // Update the password in session object too
                user.setPassword(newPassword);
                session.setAttribute("user", user);
                response.sendRedirect("change-password.jsp?success=true");
            } else {
                response.sendRedirect("change-password.jsp?error=fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("change-password.jsp?error=fail");
        }
    }
}
