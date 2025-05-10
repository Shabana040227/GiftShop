<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.giftshop.models.Order" %>
<%@ page import="com.giftshop.interfaces.OrderDAO" %>
<%@ page import="com.giftshop.daoimpl.OrderDAOImpl" %>
<%@ page import="com.giftshop.util.DBConnection" %>

<%
    OrderDAO orderDAO = new OrderDAOImpl(DBConnection.getConnection());
    List<Order> orderList = orderDAO.getAllOrders();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Orders</title>
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
    <h2 class="admin-title">Manage Orders</h2>
    <table>
        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Total</th>
            <th>Status</th>
            <th>Date</th>
        </tr>
        <%
            for(Order o : orderList) {
        %>
        <tr>
            <td><%= o.getId() %></td>
            <td><%= o.getUserId() %></td>
            <td>₹<%= o.getTotalAmount() %></td>
            <td><%= o.getStatus() %></td>
            <td><%= o.getOrderDate() %></td>
        </tr>
        <%
            }
        %>
    </table>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
