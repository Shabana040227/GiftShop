<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error = request.getParameter("error");
    String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; margin:40px; }
        .container { background:#fff; padding:20px; max-width:400px; margin:auto; border-radius:8px; box-shadow:0 2px 5px rgba(0,0,0,0.1); }
        h2 { text-align:center; }
        label { display:block; margin-top:15px; }
        input { width:100%; padding:8px; margin-top:5px; border:1px solid #ccc; border-radius:4px; }
        button { margin-top:20px; width:100%; padding:10px; background:#007BFF; color:#fff; border:none; border-radius:4px; cursor:pointer; }
        button:hover { background:#0056b3; }
        .msg { text-align:center; margin-bottom:15px; }
        .error { color:red; }
        .success { color:green; }
        .back { text-align:center; margin-top:15px; }
    </style>
</head>
<body>
<div class="container">
    <h2>Change Password</h2>
    <% if ("mismatch".equals(error)) { %>
        <div class="msg error">New passwords do not match.</div>
    <% } else if ("wrong".equals(error)) { %>
        <div class="msg error">Current password is incorrect.</div>
    <% } else if ("fail".equals(error)) { %>
        <div class="msg error">Unable to update password. Try again.</div>
    <% } else if (success != null) { %>
        <div class="msg success">Password changed successfully!</div>
    <% } %>

    <form action="change-password" method="post">
        <label for="currentPassword">Current Password</label>
        <input type="password" id="currentPassword" name="currentPassword" required />

        <label for="newPassword">New Password</label>
        <input type="password" id="newPassword" name="newPassword" required />

        <label for="confirmPassword">Confirm New Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required />

        <button type="submit">Change Password</button>
    </form>

    <div class="back">
        <a href="profile">← Back to Profile</a>
    </div>
</div>
</body>
</html>
