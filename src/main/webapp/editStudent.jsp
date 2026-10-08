<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="Model.Student" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Student</title>

<style>

    * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        background: #f4f5f7;
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

    .container {
        max-width: 650px;
        margin: 35px auto;
        padding: 0 20px;
    }

    .page-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 22px;
    }

    h2 {
        margin: 0;
        color: #1f2937;
        font-size: 25px;
        font-weight: 700;
    }

    .back-link {
        text-decoration: none;
        color: #374151;
        font-weight: 600;
        font-size: 14px;
    }

    .back-link:hover {
        color: #111827;
        text-decoration: underline;
    }

    .edit-card {
        background-color: #ffffff;
        border-radius: 6px;
        padding: 28px;
        border: 1px solid #e5e7eb;
    }

    .form-group {
        margin-bottom: 18px;
    }

    label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        color: #374151;
        margin-bottom: 6px;
    }

    input[type="text"],
    input[type="number"],
    input[type="email"] {
        width: 100%;
        padding: 10px 12px;
        font-size: 14px;
        border: 1px solid #d1d5db;
        border-radius: 5px;
        outline: none;
        background-color: #ffffff;
        color: #111827;
        transition: border-color 0.2s ease;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="email"]:focus {
        border-color: #1f2937;
    }

    .form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 16px;
    }

    .form-actions {
        display: flex;
        gap: 10px;
        margin-top: 24px;
        padding-top: 20px;
        border-top: 1px solid #e5e7eb;
    }

    .save-btn {
        background-color: #1f2937;
        color: #ffffff;
        border: none;
        padding: 10px 22px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 600;
        transition: background-color 0.2s ease;
    }

    .save-btn:hover {
        background-color: #111827;
    }

    .cancel-link {
        display: inline-flex;
        align-items: center;
        padding: 10px 22px;
        border-radius: 5px;
        font-size: 14px;
        font-weight: 600;
        text-decoration: none;
        color: #374151;
        background-color: #f3f4f6;
        border: 1px solid #e5e7eb;
        transition: background-color 0.2s ease;
    }

    .cancel-link:hover {
        background-color: #e5e7eb;
    }

</style>

</head>

<body>

<nav style="display:flex">

```
<div class="logo">Aadhyana</div>

<ul style="display:flex; gap:40px">

    <li><a href="<%= application.getContextPath() %>/">Home</a></li>

    <li><a href="<%= application.getContextPath() %>/batch">Batch</a></li>

    <li><a href="<%= application.getContextPath() %>/student">Student</a></li>

    <li><a href="<%= application.getContextPath() %>/about">About</a></li>

</ul>
```

</nav>

<div class="container">

```
<div class="page-header">

    <h2>Edit Student</h2>

    <a class="back-link" href="<%= application.getContextPath() %>/student">&larr; Back to Students</a>

</div>

<%

    Student student = (Student) request.getAttribute("student");

%>

<div class="edit-card">

    <form action="<%= application.getContextPath() %>/student/edit" method="post">

        <input type="hidden" name="id" value="<%= student.getId() %>">

        <div class="form-group">

            <label for="name">Full Name</label>

            <input type="text" id="name" name="name" value="<%= student.getName() %>" required>

        </div>

        <div class="form-row">

            <div class="form-group">

                <label for="phNumber">Phone Number</label>

                <input type="text" id="phNumber" name="phNumber" value="<%= student.getPhNumber() %>" required>

            </div>

            <div class="form-group">

                <label for="age">Age</label>

                <input type="number" id="age" name="age" value="<%= student.getAge() %>" required>

            </div>

        </div>

        <div class="form-group">

            <label for="emailString">Email</label>

            <input type="email" id="emailString" name="emailString" value="<%= student.getEmailString() %>" required>

        </div>

        <div class="form-group">

            <label for="addressString">Address</label>

            <input type="text" id="addressString" name="addressString" value="<%= student.getAddressString() %>" required>

        </div>

        <div class="form-row">

            <div class="form-group">

                <label for="collageNameString">College</label>

                <input type="text" id="collageNameString" name="collageNameString" value="<%= student.getCollageNameString() %>" required>

            </div>

            <div class="form-group">

                <label for="streamString">Stream</label>

                <input type="text" id="streamString" name="streamString" value="<%= student.getStreamString() %>" required>

            </div>

        </div>

        <div class="form-row">

            <div class="form-group">

                <label for="T_id">Teacher ID</label>

                <input type="number" id="T_id" name="T_id" value="<%= student.getT_id() %>" required>

            </div>

            <div class="form-group">

                <label for="sub_id">Subject ID</label>

                <input type="number" id="sub_id" name="sub_id" value="<%= student.getSub_id() %>" required>

            </div>

        </div>

        <div class="form-group">

            <label for="B_id">Batch ID</label>

            <input type="number" id="B_id" name="B_id" value="<%= student.getB_id() %>" required>

        </div>

        <div class="form-actions">

            <input type="submit" class="save-btn" value="Save Changes">

            <a class="cancel-link" href="<%= application.getContextPath() %>/student">Cancel</a>

        </div>

    </form>

</div>
```

</div>

</body>

</html>
