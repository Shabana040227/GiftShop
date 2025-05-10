<%@ include file="header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.giftshop.models.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gift Shop - Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        
        header {
            background-color: #6c63ff;
            padding: 20px;
            color: white;
            text-align: center;
        }
        
        nav {
            background: #333;
            display: flex;
            justify-content: center;
            padding: 10px 0;
        }
        
        nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        nav a:hover {
            color: #e3e7ff;
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
        
        .cart-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 25px;
            margin-bottom: 30px;
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
            margin-top: 20px;
        }
        
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        
        th {
            background-color: #6c63ff;
            color: white;
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
        
        .checkout-btn {
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
        
        .checkout-btn:hover {
            background-color: #5a52d5;
        }
        
        .continue-shopping {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #6c63ff;
            text-decoration: none;
        }
        
        .continue-shopping:hover {
            text-decoration: underline;
        }
        
        
    </style>
</head>
<body>

    <div class="container">
        <h2>Your Shopping Cart</h2>
        
        <div class="cart-container">
            <%
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                if (cart == null || cart.isEmpty()) {
            %>
                <div class="empty-cart">
                    <p>Your cart is currently empty.</p>
                    <a href="products">Browse Products</a>
                </div>
            <%
                } else {
            %>
                <form action="checkout.jsp" method="get">
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
                    <button type="submit" class="checkout-btn">Proceed to Checkout</button>
                </form>
                <a href="products" class="continue-shopping">Continue Shopping</a>
            <% } %>
        </div>
    </div>

</body>
</html>
<%@ include file="footer.jsp" %>