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
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f4f5f7;
            color: #1f2937;
        }

        .login-container {
            width: 380px;
            padding: 35px;
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 10px;
            color: #1f2937;
            font-size: 24px;
            font-weight: 700;
        }

        .login-container p {
            text-align: center;
            color: #6b7280;
            margin-bottom: 30px;
            font-size: 14px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #374151;
            font-weight: 600;
            font-size: 14px;
        }

        .input-group input {
            width: 100%;
            padding: 11px 13px;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            font-size: 15px;
            color: #1f2937;
            background-color: #ffffff;
            outline: none;
            transition: border-color 0.2s ease;
        }

        .input-group input:focus {
            border-color: #1f2937;
        }

        .login-btn {
            width: 100%;
            padding: 11px;
            border: none;
            border-radius: 5px;
            background-color: #1f2937;
            color: #ffffff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .login-btn:hover {
            background-color: #111827;
        }

        .error-message {
            margin-bottom: 15px;
            padding: 10px;
            background-color: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
            border-radius: 5px;
            text-align: center;
            font-size: 14px;
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #6b7280;
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

