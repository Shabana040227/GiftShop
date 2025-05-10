<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gift Store - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0; padding: 0;
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
        }
        .hero {
            padding: 60px;
            text-align: center;
            background: #e3e7ff;
        }
        .hero h1 {
            font-size: 36px;
        }
        footer {
            background: #6c63ff;
            color: white;
            text-align: center;
            padding: 15px;
            position: fixed; bottom: 0; width: 100%;
        }
    </style>
</head>
<body>

<header>
    <h1>🎁 Welcome to the Gift Store</h1>
</header>
<nav>
    <a href="products">Products</a>
    <a href="cart.jsp">Cart</a>
    <a href="login.jsp">Login</a>
    <a href="register.jsp">Sign Up</a>
</nav>

<div class="hero">
    <h1>Find the Perfect Gift for Any Occasion</h1>
    <p>Browse through our beautiful and curated collection of gifts.</p>
    <a href="products"><button>Shop Now</button></a>
</div>

<footer>
    &copy; 2025 Gift Store. All Rights Reserved.
</footer>

</body>
</html>
