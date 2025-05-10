<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.giftshop.models.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f8f8;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 700px;
            background: white;
            margin: 40px auto;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            border-radius: 6px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        label {
            display: block;
            margin-top: 15px;
            color: #555;
        }
        input[type="text"], input[type="number"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        input[type="file"] {
            margin-top: 10px;
        }
        .btn-group {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
        }
        .btn-group button {
            padding: 10px 25px;
            border: none;
            border-radius: 4px;
            font-size: 15px;
            cursor: pointer;
        }
        .save-btn {
            background-color: #28a745;
            color: white;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        #imagePreview {
            max-width: 200px;
            margin-top: 15px;
            display: block;
        }

        /* Modal styles */
        .modal {
            display: none; 
            position: fixed; 
            top: 0; left: 0; 
            width: 100%; 
            height: 100%;
            background-color: rgba(0,0,0,0.5); 
            z-index: 999;
            justify-content: center; 
            align-items: center;
        }
        .modal-content {
            background: #fff; 
            padding: 20px; 
            border-radius: 5px; 
            text-align: center;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        .confirm-btn {
            background: red; 
            color: white; 
            padding: 10px 20px; 
            border: none;
            border-radius: 5px;
            margin-right: 10px;
        }
        .cancel-btn {
            background: gray; 
            color: white; 
            padding: 10px 20px; 
            border: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Product</h2>
    <form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<%= product.getId() %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= product.getName() %>" required>

    <label>Price:</label>
    <input type="text" name="price" value="<%= product.getPrice() %>" required>

    <label>Description:</label>
    <textarea name="description"><%= product.getDescription() %></textarea>
    
    <label>Category:</label>
    <textarea name="Category"><%= product.getCategory() %></textarea>

    <label>Current Image:</label>
    <img src="<%= product.getImage_url() %>" width="100" height="100"><br>

    <label>Upload New Image:</label>
    <input type="file" name="imageFile" accept="image/*">

    <div class="btn-group">
        <button type="submit" class="save-btn">Save</button>
        <button type="button" class="delete-btn" onclick="confirmDelete()">Delete</button>
    </div>
</form>
    
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="modal">
    <div class="modal-content">
        <p>Are you sure you want to delete this product?</p>
        <form action="DeleteProductServlet" method="post">
            <input type="hidden" name="productId" value="<%= product.getId() %>">
            <button type="submit" class="confirm-btn">Yes, Delete</button>
            <button type="button" class="cancel-btn" onclick="closeModal()">Cancel</button>
        </form>
    </div>
</div>

<script>
    function confirmDelete() {
        document.getElementById('deleteModal').style.display = 'flex';
    }

    function closeModal() {
        document.getElementById('deleteModal').style.display = 'none';
    }
</script>

</body>
</html>
