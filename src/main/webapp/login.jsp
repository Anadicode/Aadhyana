<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #141e30, #243b55);
        }

        .login-container {
            width: 380px;
            padding: 35px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 10px;
            color: #222;
        }

        .login-container p {
            text-align: center;
            color: #777;
            margin-bottom: 30px;
            font-size: 14px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
            font-size: 14px;
        }

        .input-group input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: 0.3s;
        }

        .input-group input:focus {
            border-color: #243b55;
            box-shadow: 0 0 5px rgba(36, 59, 85, 0.3);
        }

        .login-btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: #243b55;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            background: #141e30;
        }

        .error-message {
            margin-bottom: 15px;
            padding: 10px;
            background: #ffe5e5;
            color: #d8000c;
            border-radius: 6px;
            text-align: center;
            font-size: 14px;
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #777;
        }
    </style>
</head>

<body>

    <div class="login-container">

        <h2>Welcome Back</h2>
        <p>Login to your account</p>

        <% 
            String error = (String) request.getAttribute("error");

            if (error != null) {
        %>
            <div class="error-message">
                <%= error %>
            </div>
        <% 
            }
        %>

        <form action="${pageContext.request.contextPath}/login" method="post">

            <div class="input-group">
                <label for="userId">User ID</label>

                <input
                    type="text"
                    id="userId"
                    name="userId"
                    placeholder="Enter your User ID"
                    required>
            </div>


            <div class="input-group">
                <label for="password">Password</label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required>
            </div>


            <button type="submit" class="login-btn">
                Login
            </button>

        </form>

        <div class="footer-text">
            Please enter your credentials to continue.
        </div>

    </div>

</body>
</html>

