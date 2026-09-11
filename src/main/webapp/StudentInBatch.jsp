<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="Model.Student" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Batch Students</title>
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        margin: 0;
        background: linear-gradient(135deg, #f4f6f8 0%, #e8ecf1 100%);
        color: #222;
        min-height: 100vh;
    }

    nav {
        background-color: #1f2937;
        padding: 14px 30px;
        align-items: center;
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

    .container {
        max-width: 1000px;
        margin: 40px auto;
        padding: 0 20px;
    }

    .page-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
    }

    h2 {
        margin: 0;
        color: #1f2937;
        font-size: 26px;
        font-weight: 700;
    }

    .back-link {
        text-decoration: none;
        color: #2563eb;
        font-weight: 600;
        font-size: 14px;
    }

    .back-link:hover {
        text-decoration: underline;
    }

    .student-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 20px;
    }

    .student-card {
        background-color: #ffffff;
        border-radius: 14px;
        padding: 20px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
        border: 1px solid #eef0f3;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .student-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    .student-name {
        font-size: 18px;
        font-weight: 700;
        color: #1f2937;
        margin-bottom: 2px;
    }

    .student-id {
        font-size: 12px;
        color: #9ca3af;
        margin-bottom: 14px;
    }

    .student-detail {
        display: flex;
        justify-content: space-between;
        font-size: 13px;
        padding: 6px 0;
        border-bottom: 1px solid #f3f4f6;
    }

    .student-detail:last-child {
        border-bottom: none;
    }

    .detail-label {
        color: #9ca3af;
        font-weight: 600;
    }

    .detail-value {
        color: #374151;
        text-align: right;
    }

    .no-students {
        padding: 40px;
        text-align: center;
        color: #6b7280;
        font-style: italic;
        background-color: #ffffff;
        border-radius: 14px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
    }
</style>
</head>
<body>

<nav style="display:flex">
    <div class="logo">Aadhyana</div>

    <ul style="display:flex; gap:40px">
        <li><a href="<%= application.getContextPath() %>/">Home</a></li>
        <li><a href="<%= application.getContextPath() %>/batch">Batch</a></li>
        <li><a href="<%= application.getContextPath() %>/student">Student</a></li>
        <li><a href="<%= application.getContextPath() %>/about">About</a></li>
    </ul>
</nav>

<div class="container">
    <div class="page-header">
        <h2>Students in Batch</h2>
        <a class="back-link" href="<%= application.getContextPath() %>/batch">&larr; Back to Batches</a>
    </div>

    <%
        List<Student> students =
             (List<Student>) request.getAttribute("students");
    %>

    <% if (students == null || students.isEmpty()) { %>
        <div class="no-students">No students found in this batch.</div>
    <% } else { %>
        <div class="student-grid">
            <% for (Student e : students) { %>
            <div class="student-card">
                <div class="student-name"><%= e.getName() %></div>
                <div class="student-id">ID: <%= e.getId() %></div>

                <div class="student-detail">
                    <span class="detail-label">Phone</span>
                    <span class="detail-value"><%= e.getPhNumber() %></span>
                </div>
                <div class="student-detail">
                    <span class="detail-label">Age</span>
                    <span class="detail-value"><%= e.getAge() %></span>
                </div>
                <div class="student-detail">
                    <span class="detail-label">Email</span>
                    <span class="detail-value"><%= e.getEmailString() %></span>
                </div>
                <div class="student-detail">
                    <span class="detail-label">Address</span>
                    <span class="detail-value"><%= e.getAddressString() %></span>
                </div>
                <div class="student-detail">
                    <span class="detail-label">College</span>
                    <span class="detail-value"><%= e.getCollageNameString() %></span>
                </div>
                <div class="student-detail">
                    <span class="detail-label">Stream</span>
                    <span class="detail-value"><%= e.getStreamString() %></span>
                </div>
            </div>
            <% } %>
        </div>
    <% } %>
</div>

</body>
</html>
