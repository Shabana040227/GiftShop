<!-- header.jsp -->
<div style="background-color: #333; padding: 10px;">
	<a href="profile" style="color: white; margin-right: 20px; text-decoration: none;">Profile</a>
    <a href="home.jsp" style="color: white; margin-right: 20px; text-decoration: none;">Home</a>
    <a href="cart.jsp" style="color: white; margin-right: 20px; text-decoration: none;">Cart</a>
    <a href="order-history.jsp" style="color: white; margin-right: 20px; text-decoration: none;">Orders</a>
    <% if(session.getAttribute("role") != null && session.getAttribute("role").equals("admin")) { %>
        <a href="admin-dashboard.jsp" style="color: white; margin-right: 20px; text-decoration: none;">Admin</a>
    <% } %>
    <a href="logout" style="color: red; float: right; text-decoration: none;">Logout</a>
</div>
