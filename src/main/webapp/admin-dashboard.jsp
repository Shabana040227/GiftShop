<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
        }

        .navbar {
            background-color: #333;
            color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
        }

        .container {
            padding: 30px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .card {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            transition: transform 0.2s;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card a {
            display: inline-block;
            margin-top: 10px;
            color: #2196F3;
            text-decoration: none;
            font-weight: bold;
        }

        .card a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .navbar h1 {
                font-size: 18px;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<div class="navbar">
    <h1>Admin Dashboard</h1>
    <div>
        <a href="home.jsp">Home</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="container">
    <h2>Welcome, Admin!</h2>
    <div class="dashboard-grid">
        <div class="card">
            <h3>Manage Products</h3>
            <p>Add, update, or delete products in your store.</p>
            <a href="manage-products.jsp">Go to Products</a>
        </div>
        <div class="card">
            <h3>Manage Orders</h3>
            <p>View and process customer orders.</p>
            <a href="manage-orders.jsp">Go to Orders</a>
        </div>
        <div class="card">
            <h3>Manage Users</h3>
            <p>View and manage registered users.</p>
            <a href="manage-users.jsp">Go to Users</a>
        </div>
    </div>
</div>

</body>
</html>
