<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.giftshop.models.User" %>
<%@ page import="com.giftshop.interfaces.UserDAO" %>
<%@ page import="com.giftshop.daoimpl.UserDAOImpl" %>
<%@ page import="com.giftshop.util.DBConnection" %>

<%
    UserDAO userDAO = new UserDAOImpl(DBConnection.getConnection());
    List<User> userList = userDAO.getAllUsers();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background-color: #f9f9f9;
        }
        .admin-container {
            padding: 30px;
        }
        .admin-title {
            font-size: 24px;
            margin-bottom: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            background: white;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        th, td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #eee;
        }
        th {
            background-color: #555;
            color: #fff;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="admin-container">
    <h2 class="admin-title">Manage Users</h2>
    <table>
        <tr>
            <th>User ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
        </tr>
        <%
            for(User u : userList) {
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getRole() %></td>
        </tr>
        <%
            }
        %>
    </table>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
