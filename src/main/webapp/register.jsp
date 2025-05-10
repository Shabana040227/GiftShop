<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Join Our Community</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            width: 100%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            position: relative;
        }
        
        .form-header {
            background: #4a00e0;
            color: white;
            padding: 30px;
            text-align: center;
            position: relative;
        }
        
        .form-header h2 {
            font-size: 28px;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .form-header p {
            font-size: 16px;
            opacity: 0.8;
        }
        
        .form-body {
            padding: 30px;
        }
        
        .input-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .input-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
            font-size: 14px;
        }
        
        .input-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e1e1;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
        }
        
        .input-group input:focus {
            border-color: #4a00e0;
            box-shadow: 0 0 0 3px rgba(74, 0, 224, 0.2);
            outline: none;
            background-color: white;
        }
        
        .input-group input::placeholder {
            color: #aaa;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .input-group {
            flex: 1;
        }
        
        .submit-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(to right, #4a00e0, #8e2de2);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            box-shadow: 0 5px 15px rgba(142, 45, 226, 0.4);
        }
        
        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(142, 45, 226, 0.6);
        }
        
        .submit-btn:active {
            transform: translateY(0);
        }
        
        .decoration {
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            top: -100px;
            right: -100px;
        }
        
        .decoration:before {
            content: '';
            position: absolute;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            bottom: -50px;
            left: -50px;
        }
        
        @media (max-width: 600px) {
            .container {
                border-radius: 15px;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            
            .form-header {
                padding: 20px;
            }
            
            .form-body {
                padding: 20px;
            }
        }
        
        .required-field::after {
            content: '*';
            color: #e74c3c;
            margin-left: 4px;
        }
        
        .form-footer {
            text-align: center;
            padding: 0 30px 30px;
            color: #666;
            font-size: 14px;
        }
        
        .form-footer a {
            color: #4a00e0;
            text-decoration: none;
            font-weight: 600;
        }
        
        .form-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="decoration"></div>
        <div class="form-header">
            <h2>Join Our Community</h2>
            <p>Create your account and get started today</p>
        </div>
        
        <form action="register" method="post" class="form-body">
            <div class="input-group">
                <label class="required-field">Full Name</label>
                <input type="text" name="name" placeholder="Enter your full name" required />
            </div>
            
            <div class="input-group">
                <label class="required-field">Email Address</label>
                <input type="email" name="email" placeholder="Enter your email address" required />
            </div>
            
            <div class="input-group">
                <label class="required-field">Password</label>
                <input type="password" name="password" placeholder="Create a strong password" required />
            </div>
            
            <div class="input-group">
                <label>Address</label>
                <input type="text" name="address" placeholder="Enter your street address" />
            </div>
            
            <div class="form-row">
                <div class="input-group">
                    <label>City</label>
                    <input type="text" name="city" placeholder="City" />
                </div>
                
                <div class="input-group">
                    <label>State</label>
                    <input type="text" name="state" placeholder="State" />
                </div>
            </div>
            
            <div class="form-row">
                <div class="input-group">
                    <label>Zip Code</label>
                    <input type="text" name="zip" placeholder="Zip Code" />
                </div>
                
                <div class="input-group">
                    <label>Phone</label>
                    <input type="text" name="phone" placeholder="Phone Number" />
                </div>
            </div>
            
            <button type="submit" class="submit-btn">Create Account</button>
        </form>
        
        <div class="form-footer">
            <p>Already have an account? <a href="login.jsp">Sign In</a></p>
        </div>
    </div>
    
    <%-- JSP can be used here for dynamic content or validation messages --%>
    <% 
        String errorMsg = request.getParameter("error");
        if(errorMsg != null && !errorMsg.isEmpty()) {
    %>
        <script>
            alert("<%= errorMsg %>");
        </script>
    <% } %>
</body>
</html>