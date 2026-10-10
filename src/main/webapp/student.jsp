
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="Model.Student" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Students</title>

<style>

    * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        background-color: #f4f5f7;
        color: #1f2937;
    }

    nav {
        background-color: #1f2937;
        padding: 14px 30px;
        align-items: center;
        border-bottom: 1px solid #374151;
    }

    nav.top {
        justify-content: space-between;
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

    nav.sub {
        background-color: #ffffff;
        padding: 10px 30px;
        border-bottom: 1px solid #e5e7eb;
    }

    nav.sub ul li a {
        color: #374151;
        font-weight: 500;
    }

    nav.sub ul li a:hover {
        color: #111827;
    }

    .container {
        max-width: 1000px;
        margin: 30px auto;
        padding: 0 20px;
    }

    h2 {
        margin: 0 0 18px 0;
        color: #1f2937;
        font-size: 22px;
        font-weight: 600;
    }

    .search-container {
        margin-bottom: 18px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .search-icon {
        color: #6b7280;
        font-size: 20px;
    }

    .search-container input {
        width: 300px;
        padding: 10px 14px;
        border: 1px solid #d1d5db;
        border-radius: 5px;
        font-size: 14px;
        color: #1f2937;
        background-color: #ffffff;
        outline: none;
        transition: border-color 0.2s ease;
    }

    .search-container input:focus {
        border-color: #1f2937;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #ffffff;
        border: 1px solid #e5e7eb;
        border-radius: 6px;
        overflow: hidden;
    }

    thead {
        background-color: #1f2937;
    }

    thead th {
        color: #ffffff;
        text-align: left;
        padding: 12px 16px;
        font-size: 14px;
        font-weight: 600;
    }

    tbody tr {
        border-bottom: 1px solid #e5e7eb;
    }

    tbody tr:last-child {
        border-bottom: none;
    }

    tbody tr:nth-child(even) {
        background-color: #f9fafb;
    }

    tbody tr:hover {
        background-color: #f3f4f6;
    }

    tbody td {
        padding: 12px 16px;
        font-size: 14px;
        color: #374151;
    }

    .action-cell {
        display: flex;
        gap: 8px;
        align-items: center;
    }

    .edit-btn {
        background-color: #1f2937;
        color: #ffffff;
        border: none;
        padding: 6px 14px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 13px;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        transition: background-color 0.2s ease;
    }

    .edit-btn:hover {
        background-color: #111827;
    }

    .delete-btn {
        background-color: #ffffff;
        color: #b91c1c;
        border: 1px solid #fecaca;
        padding: 5px 14px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 13px;
        transition: background-color 0.2s ease,
                    color 0.2s ease;
    }

    .delete-btn:hover {
        background-color: #fef2f2;
        color: #991b1b;
    }

    .no-students {
        padding: 20px;
        text-align: center;
        color: #6b7280;
        background-color: #ffffff;
        border: 1px solid #e5e7eb;
        border-radius: 6px;
        font-style: italic;
    }

</style>

</head>

<body>

<nav class="top" style="display:flex">

    <div class="logo">Aadhyana</div>

    <ul style="display:flex; gap:40px">

        <li><a href="<%= application.getContextPath() %>/">Home</a></li>

        <li><a href="<%= application.getContextPath() %>/batch">Batch</a></li>

        <li><a href="<%= application.getContextPath() %>/student">Student</a></li>
        
        <li><a href="<%= application.getContextPath() %>/about">About</a></li>
     
    </ul>

</nav>

<% 
   String role = (String)session.getAttribute("role");
   if("admin".equals(role)){
%>
<nav class="sub" style="display:flex">

    <ul style="display:flex; gap:40px">

        <li>
            <a href="<%= application.getContextPath() %>/student/ragister">
                Register a Student
            </a>
        </li>

    </ul>

</nav>

<%} %>>

<div class="container">

    <h2>Student List</h2>

    <div class="search-container">

        <span class="search-icon">⌕</span>

        <input
            type="text"
            id="studentIdSearch"
            placeholder="Search Student by ID..."
        >

    </div>

    <%

        List<Student> students =
             (List<Student>) request.getAttribute("students");

    %>

    <% if (students == null || students.isEmpty()) { %>

        <div class="no-students">No students found.</div>

    <% } else { %>

        <table id="studentTable">

            <thead>

                <tr>

                    <th>Name</th>

                    <th>Address</th>

                    <th>ID</th>
                    
                    <% if("admin".equals(role)){ %>
                    <th>Action</th>
                    <%} %>
                </tr>

            </thead>

            <tbody>

                <% for (Student e : students) { %>

                <tr>

                    <td><%= e.getName() %></td>

                    <td><%= e.getAddressString() %></td>

                    <td class="student-id"><%= e.getId() %></td>
                    
                    
                    
                 <% if("admin".equals(role)){%>
                    <td class="action-cell">
                        <a
                            class="edit-btn"
                            href="<%= application.getContextPath() %>/student/edit?id=<%= e.getId() %>">
                            Edit
                        </a>

                        <form
                            action="<%= application.getContextPath() %>/student"
                            method="post"
                            style="margin:0;">

                            <input
                                type="hidden"
                                name="delete"
                                value="<%= e.getId() %>">

                            <input
                                type="submit"
                                class="delete-btn"
                                value="Delete">

                        </form>

                    </td>
                 <%} %>
                   
                </tr>

                <% } %>

            </tbody>

        </table>

    <% } %>

</div>

<script>

    const searchInput = document.getElementById("studentIdSearch");

    const rows = document.querySelectorAll("#studentTable tbody tr");

    searchInput.addEventListener("input", function () {

        let searchValue = this.value.trim();

        rows.forEach(function (row) {

            let studentId = row
                .querySelector(".student-id")
                .textContent
                .trim();

            if (studentId === searchValue || searchValue === "") {

                row.style.display = "";

            } else {

                row.style.display = "none";

            }

        });

    });

</script>

</body>

</html>

