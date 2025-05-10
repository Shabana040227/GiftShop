<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gift Shop - Order Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        
        
        
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
        }
        
        .success-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 40px;
            text-align: center;
            border-top: 5px solid #6c63ff;
        }
        
        .success-icon {
            font-size: 80px;
            color: #6c63ff;
            margin-bottom: 20px;
        }
        
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        
        .order-id {
            background-color: #e3e7ff;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            color: #6c63ff;
            display: inline-block;
            margin: 15px 0;
        }
        
        .action-buttons {
            margin-top: 30px;
        }
        
        .action-buttons a {
            display: inline-block;
            margin: 0 10px;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s;
        }
        
        .primary-btn {
            background-color: #6c63ff;
            color: white;
        }
        
        .primary-btn:hover {
            background-color: #5a52d5;
        }
        
        .secondary-btn {
            background-color: #e3e7ff;
            color: #6c63ff;
        }
        
        .secondary-btn:hover {
            background-color: #d1d5ff;
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
        <div class="success-container">
            <div class="success-icon">✅</div>
            <h2>Thank You for Your Order!</h2>
            <p>Your order has been placed successfully and is being processed.</p>
            
            <div class="order-id">
                Order ID: <%= request.getAttribute("orderId") %>
            </div>
            
            <p>A confirmation email has been sent with your order details.</p>
            
            <div class="action-buttons">
                <a href="order-history-servlet" class="primary-btn">View Order History</a>
                <a href="products" class="secondary-btn">Continue Shopping</a>
            </div>
        </div>
    </div>

    
</body>
</html>
<%@ include file="footer.jsp" %>