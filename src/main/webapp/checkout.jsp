<%@ page import="java.util.List" %>
<%@ page import="com.giftshop.models.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gift Shop - Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        
        .checkout-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 25px;
            margin-bottom: 30px;
        }
        
        h3 {
            color: #6c63ff;
            border-bottom: 2px solid #e3e7ff;
            padding-bottom: 10px;
            margin-top: 0;
        }
        
        .empty-cart {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 18px;
            background-color: #e3e7ff;
            border-radius: 8px;
        }
        
        .empty-cart a {
            display: inline-block;
            margin-top: 15px;
            background-color: #6c63ff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        
        .empty-cart a:hover {
            background-color: #5a52d5;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        
        th {
            background-color: #e3e7ff;
            color: #333;
            font-weight: normal;
        }
        
        tr:hover {
            background-color: #f9f9f9;
        }
        
        .total-row {
            font-weight: bold;
            background-color: #e3e7ff;
        }
        
        .total-row td {
            padding: 15px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }
        
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            min-height: 100px;
            box-sizing: border-box;
        }
        
        textarea:focus {
            border-color: #6c63ff;
            outline: none;
            box-shadow: 0 0 0 2px rgba(108, 99, 255, 0.2);
        }
        
        .place-order-btn {
            background-color: #6c63ff;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: block;
            margin: 20px auto 0;
            width: 250px;
        }
        
        .place-order-btn:hover {
            background-color: #5a52d5;
        }
        
        .back-to-cart {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #6c63ff;
            text-decoration: none;
        }
        
        .back-to-cart:hover {
            text-decoration: underline;
        }
        
        footer {
            background: #6c63ff;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    
    <div class="container">
        <h2>Checkout</h2>
        
        <div class="checkout-container">
            <%
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                if (cart == null || cart.isEmpty()) {
            %>
                <div class="empty-cart">
                    <p>Your cart is empty. Please add items before checkout.</p>
                    <a href="products">Browse Products</a>
                </div>
            <%
                } else {
            %>
                <h3>Order Summary</h3>
                <table>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                    <%
                        double grandTotal = 0;
                        for (CartItem item : cart) {
                            grandTotal += item.getTotalPrice();
                    %>
                        <tr>
                            <td><%= item.getProductName() %></td>
                            <td><%= item.getQuantity() %></td>
                            <td>₹<%= item.getPrice() %></td>
                            <td>₹<%= item.getTotalPrice() %></td>
                        </tr>
                    <%
                        }
                    %>
                    <tr class="total-row">
                        <td colspan="3">Grand Total</td>
                        <td>₹<%= grandTotal %></td>
                    </tr>
                </table>

                <h3>Shipping Information</h3>
                <form action="checkout" method="post">
                    <div class="form-group">
                        <label for="shippingAddress">Shipping Address</label>
                        <textarea id="shippingAddress" name="shippingAddress" required placeholder="Enter your complete shipping address including name, street, city, state, and PIN code"></textarea>
                    </div>
                    <button type="submit" class="place-order-btn">Place Order</button>
                </form>
                <a href="view-cart.jsp" class="back-to-cart">Back to Cart</a>
            <% } %>
        </div>
    </div>
</body>
</html>