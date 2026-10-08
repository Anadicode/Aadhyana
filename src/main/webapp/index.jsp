<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="jakarta.servlet.http.HttpSession" %>

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
        background-color: #f4f5f7;
        color: #1f2937;
        min-height: 100vh;
    }

    nav {
        background-color: #1f2937;
        padding: 14px 30px;
        align-items: center;
        justify-content: space-between;
        border-bottom: 1px solid #374151;
    }

    .logo {
        color: #ffffff;
        font-size: 22px;
        font-weight: 700;
        letter-spacing: 0.5px;
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
        margin: 55px auto;
        padding: 0 20px;
        text-align: center;
    }

    .hero p {
        max-width: 650px;
        margin: 0 auto 30px auto;
        color: #4b5563;
        font-size: 16px;
        line-height: 1.6;
    }

    .hero form {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        padding: 16px 18px;
        background-color: #ffffff;
        border: 1px solid #e5e7eb;
        border-radius: 6px;
    }

    .hero input[type="file"] {
        font-size: 14px;
        color: #374151;
    }

    .hero button {
        background-color: #1f2937;
        color: #ffffff;
        border: none;
        padding: 9px 18px;
        border-radius: 5px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .hero button:hover {
        background-color: #111827;
    }

</style>

</head>

<body>

<nav style="display:flex">

```
<div class="logo">Aadhyana</div>

<ul style="display:flex; gap:40px">

    <li><a href="<%= application.getContextPath() %>/batch">Batch</a></li>

    <li><a href="<%= application.getContextPath() %>/student">Student</a></li>

    <li><a href="<%= application.getContextPath() %>/about">About</a></li>

    <%

      HttpSession currentSession = request.getSession(false);

      if(currentSession!=null && currentSession.getAttribute("user") != null){

    %>

      <li><a href="<%= application.getContextPath() %>/logout">logout</a></li>

    <%}else{ %>

       <li><a href="<%= application.getContextPath() %>/login">login</a></li>

    <%} %>

</ul>
```

</nav>

<div class="hero">

```
<p>Welcome to Aadhyana — manage your batches and students in one place.</p>

<form action="<%= application.getContextPath() %>/import-fees"
    method="post"
    enctype="multipart/form-data">

   <input type="file" name="feeFile" accept=".xlsx" required>

   <button type="submit">Import Fees</button>

</form>
```

</div>

</body>

</html>
