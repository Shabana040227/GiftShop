<%@ page import="java.util.List" %>
<%@ page import="com.giftshop.models.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        header, footer {
            background-color: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }

        .container {
            padding: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #eee;
        }

        .btn {
            padding: 8px 16px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn-remove {
            background-color: #dc3545;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .total {
            text-align: right;
            font-size: 1.2em;
        }

        textarea, input[type=number] {
            padding: 6px;
            width: 60px;
        }
    </style>
</head>
<body>

<header>
    <h1>Gift Shop</h1>
</header>

<div class="container">
    <h2>Your Shopping Cart</h2>

    <%
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <p>Your cart is empty. <a href="products">Continue Shopping</a></p>
    <%
        } else {
    %>

    <form action="update-cart" method="post">
        <table>
            <tr>
                <th>Product</th>
                <th>Qty</th>
                <th>Price</th>
                <th>Total</th>
                <th>Actions</th>
            </tr>
            <%
                double grandTotal = 0;
                for (CartItem item : cart) {
                    grandTotal += item.getTotalPrice();
            %>
            <tr>
                <td><%= item.getProductName() %></td>
                <td>
                    <input type="number" name="quantity_<%= item.getProductId() %>" value="<%= item.getQuantity() %>" min="1" />
                </td>
                <td>₹<%= item.getPrice() %></td>
                <td>₹<%= item.getTotalPrice() %></td>
                <td>
                    <form action="remove-from-cart" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= item.getProductId() %>" />
                        <button type="submit" class="btn btn-remove">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="3" class="total"><strong>Grand Total:</strong></td>
                <td colspan="2"><strong>₹<%= grandTotal %></strong></td>
            </tr>
        </table>

        <button type="submit" class="btn">Update Cart</button>
        <a href="checkout.jsp" class="btn">Proceed to Checkout</a>
    </form>

    <% } %>
</div>

<footer>
    <p>&copy; 2025 Gift Shop. All rights reserved.</p>
</footer>

</body>
</html>
