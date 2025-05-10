package com.giftshop.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.giftshop.daoimpl.UserDAOImpl;
import com.giftshop.interfaces.UserDAO;
import com.giftshop.models.User;
import com.giftshop.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Ensure user is logged in
        HttpSession session = request.getSession();
        User sessionUser = (User) session.getAttribute("currentUser");
        if (sessionUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Fetch fresh user info from the database
        try (Connection conn = DBConnection.getConnection()) {
            UserDAO dao = new UserDAOImpl(conn);
            User profileUser = dao.getUserById(sessionUser.getId());
            request.setAttribute("profileUser", profileUser);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Ensure user is logged in
        HttpSession session = request.getSession();
        User sessionUser = (User) session.getAttribute("user");
        if (sessionUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Build updated user object (only editable fields)
        User updated = new User();
        updated.setId(sessionUser.getId());
        updated.setName(request.getParameter("name"));
        updated.setAddress(request.getParameter("address"));
        updated.setCity(request.getParameter("city"));
        updated.setState(request.getParameter("state"));
        updated.setZipCode(request.getParameter("zip"));
        updated.setPhone(request.getParameter("phone"));

        // Persist update
        try (Connection conn = DBConnection.getConnection()) {
            UserDAO dao = new UserDAOImpl(conn);
            boolean success = dao.updateUser(updated);
            if (success) {
                // Refresh session user
                sessionUser.setName(updated.getName());
                sessionUser.setAddress(updated.getAddress());
                sessionUser.setCity(updated.getCity());
                sessionUser.setState(updated.getState());
                sessionUser.setZipCode(updated.getZipCode());
                sessionUser.setPhone(updated.getPhone());
                response.sendRedirect("profile?success=1");
            } else {
                response.sendRedirect("profile?error=1");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
