<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.giftshop.models.Product" %>
<%@ page import="com.giftshop.interfaces.ProductDAO" %>
<%@ page import="com.giftshop.daoimpl.ProductDAOImpl" %>
<%@ page import="com.giftshop.util.DBConnection" %>

<%
    ProductDAO productDAO = new ProductDAOImpl(DBConnection.getConnection());
    List<Product> productList = productDAO.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Products</title>
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
        .actions a {
            margin-right: 10px;
            color: #007BFF;
            text-decoration: none;
        }
        .actions a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="admin-container">
    <h2 class="admin-title">Manage Products</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Category</th>
            <th>Image</th>
            <th>Actions</th>
            
        </tr>
        <% 
        	for(Product product : productList) 
        	{ 
        %>
        <tr>
        	<td>    <%= product.getId() %>     </td>
            <td>	<%= product.getName() %>	</td>
            <td>	<%= product.getPrice() %>	</td>
            <td>    <%= product.getCategory() %> </td>
            <td>    <%= product.getImage_url() %> </td>
            <td>
                	<a href="EditProductServlet?id=<%= product.getId() %>" class="action-btn">Edit</a>
                	<a href="DeleteProductServlet?id=<%= product.getId() %>" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
            </td>
        </tr>
    <%
    } 
    %>
          
    </table>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
