<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aadhyana</title>
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        background-color: #f4f6f8;
        color: #222;
    }

    nav {
        background-color: #1f2937;
        padding: 12px 30px;
        align-items: center;
        justify-content: space-between;
    }

    .logo {
        color: #ffffff;
        font-size: 22px;
        font-weight: bold;
    }

    nav ul {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    nav ul li a {
        color: #d1d5db;
        text-decoration: none;
        font-size: 15px;
        transition: color 0.2s ease;
    }

    nav ul li a:hover {
        color: #ffffff;
    }

    .hero {
        max-width: 900px;
        margin: 80px auto;
        padding: 0 20px;
        text-align: center;
    }

    .hero h1 {
        font-size: 34px;
        color: #1f2937;
        margin-bottom: 10px;
    }

    .hero p {
        color: #6b7280;
        font-size: 16px;
        margin-bottom: 30px;
    }

    .hero a.cta {
        display: inline-block;
        background-color: #2563eb;
        color: #ffffff;
        text-decoration: none;
        padding: 10px 24px;
        border-radius: 6px;
        font-size: 15px;
        transition: background-color 0.2s ease;
    }

    .hero a.cta:hover {
        background-color: #1d4ed8;
    }
</style>
</head>
<body>

<nav style="display:flex">
    <div class="logo">Aadhyana</div>

    <ul style="display:flex; gap:40px">
        <li><a href="<%= application.getContextPath() %>/batch">Batch</a></li>
        <li><a href="<%= application.getContextPath() %>/student">Student</a></li>
        <li><a href="<%= application.getContextPath() %>/about">About</a></li>
    </ul>
</nav>

<div class="hero">
    <h1>Hello, Servlet by Anirban</h1>
    <p>Welcome to Aadhyana — manage your batches and students in one place.</p>
</div>

</body>
</html>