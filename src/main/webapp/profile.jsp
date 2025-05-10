<%@ include file="header.jsp" %>
<%@ page import="com.giftshop.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    User u = (User) request.getAttribute("profileUser");
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Profile</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; margin: 40px; }
        .container { background: #fff; padding: 20px 30px; max-width: 500px; margin: auto; border-radius: 8px; 
                     box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        label { display: block; margin-top: 15px; color: #555; }
        input, textarea { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ccc; border-radius: 4px; }
        button { margin-top: 20px; padding: 10px 20px; background: #007BFF; color: #fff; border: none; 
                 border-radius: 4px; cursor: pointer; }
        button:hover { background: #0056b3; }
        .msg { text-align: center; margin-bottom: 15px; }
        .success { color: green; }
        .error { color: red; }
        .back-link { text-align: center; margin-top: 15px; }
    </style>
</head>
<body>
<div class="container">
	<p><a href="change-password">Change Password</a></p>
    <h2>Account Settings</h2>
    <% if (success != null) { %>
        <div class="msg success">Profile updated successfully!</div>
    <% } else if (error != null) { %>
        <div class="msg error">Update failed. Please try again.</div>
    <% } %>

    <form action="profile" method="post">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" value="<%= u.getName() %>" required />

        <label for="address">Address</label>
        <textarea id="address" name="address" rows="3"><%= u.getAddress() %></textarea>

        <label for="city">City</label>
        <input type="text" id="city" name="city" value="<%= u.getCity() %>" />

        <label for="state">State</label>
        <input type="text" id="state" name="state" value="<%= u.getState() %>" />

        <label for="zip">ZIP Code</label>
        <input type="text" id="zip" name="zip" value="<%= u.getZipCode() %>" />

        <label for="phone">Phone</label>
        <input type="text" id="phone" name="phone" value="<%= u.getPhone() %>" />

        <button type="submit">Save Changes</button>
    </form>

    <div class="back-link">
        <a href="products">← Back to Shop</a>
    </div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>