<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffecec;
            text-align: center;
            padding: 50px;
        }
        .error-box {
            display: inline-block;
            background-color: #fff0f0;
            padding: 30px;
            border: 1px solid #ffcccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(255, 0, 0, 0.1);
        }
        h2 {
            color: #cc0000;
        }
        p {
            color: #333;
        }
        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #fff;
            background-color: #cc0000;
            padding: 10px 20px;
            border-radius: 5px;
        }
        a:hover {
            background-color: #a60000;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h2>Oops! Something went wrong.</h2>
        <p><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "An unexpected error occurred. Please try again later." %></p>
        <a href="products"">Go to Home</a>
    </div>
</body>
</html>
