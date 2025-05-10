<%@ page import="java.util.List" %>
<%@ page import="com.giftshop.models.Order" %>
<%@ page import="com.giftshop.models.OrderItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Your Orders</title>
  <style>
    body { font-family: Arial, sans-serif; margin:40px; background:#f4f4f4; }
    h2 { color:#333; }
    .order { background:#fff; padding:20px; margin-bottom:20px; border-radius:8px;
             box-shadow:0 2px 5px rgba(0,0,0,0.1); }
    .order-header { display:flex; justify-content:space-between; margin-bottom:10px; }
    .order-items table { width:100%; border-collapse:collapse; margin-top:10px; }
    .order-items th, .order-items td { padding:8px; border:1px solid #ddd; text-align:left; }
    .order-items th { background:#eee; }
  </style>
</head>
<body>
  <h2>Your Order History</h2>
  <%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    if (orders == null || orders.isEmpty()) {
  %>
    <p>You have no past orders. <a href="products">Shop now</a>.</p>
  <%
    } else {
      for (Order o : orders) {
  %>
    <div class="order">
      <div class="order-header">
        <div><strong>Order ID:</strong> <%= o.getId() %></div>
        <div><strong>Date:</strong> <%= o.getOrderDate() %></div>
        <div><strong>Status:</strong> <%= o.getStatus() %></div>
      </div>
      <div class="order-items">
        <table>
          <tr>
            <th>Product ID</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Total</th>
          </tr>
          <%
            for (OrderItem it : o.getItems()) {
          %>
          <tr>
            <td><%= it.getProductId() %></td>
            <td><%= it.getQuantity() %></td>
            <td>₹<%= it.getPrice() %></td>
            <td>₹<%= it.getQuantity() * it.getPrice() %></td>
          </tr>
          <% } %>
          <tr>
            <td colspan="3" style="text-align:right;"><strong>Order Total:</strong></td>
            <td><strong>₹<%= o.getTotalAmount() %></strong></td>
          </tr>
        </table>
      </div>
    </div>
  <%
      }
    }
  %>
</body>
</html>
