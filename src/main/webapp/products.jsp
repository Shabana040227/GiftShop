<%@ page import="java.util.*, com.giftshop.models.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gift Shop - Products</title>
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
        
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .cart-button {
            text-decoration: none;
            background-color: #6c63ff;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        
        .cart-button:hover {
            background-color: #5a52d5;
        }
        
        .filter-form {
            background-color: #e3e7ff;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        
        .filter-form select, 
        .filter-form button[type="submit"] {
            margin-right: 10px;
            padding: 8px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        .filter-form button[type="submit"] {
            background-color: #6c63ff;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .filter-form button[type="submit"]:hover {
            background-color: #5a52d5;
        }
        
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .product-image {
            width: 100%;
            height: 180px;
            border-radius: 5px;
            margin-bottom: 10px;
            background-color: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        
        .product-image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        
        .product-icon {
            font-size: 50px;
            color: #6c63ff;
        }
        
        .product-card h3 {
            margin: 10px 0;
            color: #333;
        }
        
        .product-card p {
            color: #666;
            margin-bottom: 15px;
            height: 60px;
            overflow: hidden;
        }
        
        .product-card .price {
            font-weight: bold;
            color: #6c63ff;
            font-size: 18px;
            margin-bottom: 15px;
        }
        
        .add-to-cart-btn {
            background-color: #6c63ff;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            width: 100%;
            transition: background-color 0.3s;
        }
        
        .add-to-cart-btn:hover {
            background-color: #5a52d5;
        }
        
        .no-products {
            text-align: center;
            padding: 30px;
            background-color: #e3e7ff;
            border-radius: 8px;
            grid-column: 1 / -1;
        }
        
        
        .profile-link {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            background-color: #5a52d5;
            border-radius: 4px;
        }
        
        /* Category icons */
        .category-icon {
            margin-right: 5px;
        }
    </style>
</head>
<body>
        <div class="container">
        <div class="top-bar">
            <a href="profile" class="profile-link">My Account</a>
            <h2>Available Products</h2>
            <a href="view-cart.jsp" class="cart-button">🛒 View Cart</a>
        </div>

        <!-- Filter/Sort Form -->
        <form method="get" action="products" class="filter-form">
            <label for="category">Category:</label>
            <select name="category" id="category">
                <option value="">All</option>
                <option value="Toys">🧸 Gifts</option>
                <option value="Cards">💌 Greeting Cards</option>
                <option value="Flowers">🌹 Flowers</option>
                <option value="Food">🍰 Food</option>
                <option value="Decor">🏠 Decoration</option>
            </select>

            <label for="sort">Sort by:</label>
            <select name="sort" id="sort">
                <option value="">Default</option>
                <option value="priceAsc">Price: Low to High</option>
                <option value="priceDesc">Price: High to Low</option>
            </select>

            <button type="submit">Apply Filters</button>
        </form>

        <div class="products-grid">
            <%
                List<Product> products = (List<Product>) request.getAttribute("productList");
                if (products != null && !products.isEmpty()) {
                    for (Product p : products) {
                        // Determine icon based on category
                        String categoryIcon = "🎁"; // Default icon
                        if (p.getCategory() != null) {
                            if (p.getCategory().equals("Toys")) categoryIcon = "🧸";
                            else if (p.getCategory().equals("Cards")) categoryIcon = "💌";
                            else if (p.getCategory().equals("Flowers")) categoryIcon = "🌹";
                            else if (p.getCategory().equals("Food")) categoryIcon = "🍰";
                            else if (p.getCategory().equals("Decor")) categoryIcon = "🏠";
                        }
            %>
                <div class="product-card">
                    <div class="product-image">
                        <% if (p.getImage_url() != null && !p.getImage_url().isEmpty()) { %>
                            <img src="uploads/<%= p.getImage_url() %>" alt="<%= p.getName() %>" 
                                 onerror="this.style.display='none'; this.parentNode.innerHTML='<div class=\'product-icon\'><%= categoryIcon %></div>';">
                        <% } else { %>
                            <div class="product-icon"><%= categoryIcon %></div>
                        <% } %>
                    </div>
                    <h3><%= categoryIcon %> <%= p.getName() %></h3>
                    <p><%= p.getDescription() != null ? p.getDescription() : "No description available" %></p>
                    <div class="price">₹<%= p.getPrice() %></div>
                    <form action="add-to-cart" method="post">
                        <input type="hidden" name="productId" value="<%= p.getId() %>">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" class="add-to-cart-btn">Add to Cart</button>
                    </form>
                </div>
            <%
                    }
                } else {
            %>
                <div class="no-products">
                    <h3>No products available.</h3>
                    <p>Please check back later or try a different category.</p>
                </div>
            <%
                }
            %>
        </div>
    </div>

</body>
</html>
<%@ include file="footer.jsp" %>