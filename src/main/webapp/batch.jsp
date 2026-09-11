<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="Model.Batch" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Batches</title>
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
        background-color: #374151;
        padding: 10px 30px;
    }

    nav.sub ul li a {
        color: #93c5fd;
        font-weight: 500;
    }

    .container {
        max-width: 1000px;
        margin: 40px auto;
        padding: 0 20px;
    }

    h2 {
        margin-bottom: 25px;
        color: #1f2937;
        font-size: 26px;
        font-weight: 700;
    }

    .batch-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
        gap: 20px;
    }

    .batch-card {
        background-color: #ffffff;
        border-radius: 14px;
        padding: 20px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
        border: 1px solid #eef0f3;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .batch-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    .batch-card-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }

    .batch-name {
        font-size: 18px;
        font-weight: 700;
        color: #1f2937;
    }

    .batch-id {
        font-size: 12px;
        color: #9ca3af;
        margin-top: 2px;
    }

    .status-badge {
        display: inline-block;
        padding: 5px 12px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 600;
        text-transform: capitalize;
        background-color: #dbeafe;
        color: #1d4ed8;
        width: fit-content;
    }

    .status-badge.active {
        background-color: #dcfce7;
        color: #15803d;
    }

    .status-badge.inactive {
        background-color: #fee2e2;
        color: #b91c1c;
    }

    .status-btn {
        background-color: #2563eb;
        color: #ffffff;
        border: none;
        padding: 9px 16px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 13px;
        font-weight: 600;
        transition: background-color 0.2s ease;
        width: 100%;
    }

    .status-btn:hover {
        background-color: #1d4ed8;
    }

    .no-batches {
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

<nav class="top" style="display:flex">
    <div class="logo">Aadhyana</div>

    <ul style="display:flex; gap:40px">
        <li><a href="<%= application.getContextPath() %>/">Home</a></li>
        <li><a href="<%= application.getContextPath() %>/batch">Batch</a></li>
        <li><a href="<%= application.getContextPath() %>/student">Student</a></li>
        <li><a href="<%= application.getContextPath() %>/about">About</a></li>
    </ul>
</nav>

<nav class="sub" style="display:flex">
    <ul style="display:flex; gap:40px">
        <li><a href="<%= application.getContextPath() %>/batch/ragister">Register a New Batch</a></li>
    </ul>
</nav>

<div class="container">
    <h2>Batch List</h2>

    <%
        List<Batch> batchs =
             (List<Batch>) request.getAttribute("batchs");
    %>

    <% if (batchs == null || batchs.isEmpty()) { %>
        <div class="no-batches">No batches found.</div>
    <% } else { %>
        <div class="batch-grid">
            <% for (var e : batchs) {
                String status = e.getBStatus() == null ? "" : e.getBStatus().toString();
                String badgeClass = "status-badge";
                if (status.equalsIgnoreCase("active")) {
                    badgeClass += " active";
                } else if (status.equalsIgnoreCase("inactive")) {
                    badgeClass += " inactive";
                }
            %>
            <div class="batch-card">
                <div class="batch-card-header">
                    <div>
                        <div class="batch-name"><%= e.getBName() %></div>
                        <div class="batch-id">ID: <%= e.getBId() %></div>
                    </div>
                    <span class="<%= badgeClass %>"><%= status %></span>
                </div>
                
                <form action="<%= application.getContextPath() %>/batch" method="post" style="margin:0;">
                    <input type="hidden" name="change" value="<%= e.getBId() %>">
                    <input type="submit" class="status-btn" value="Change Status">
                </form>
                <form action="<%= application.getContextPath() %>/batch/batchStudent" method="post" style="margin:0;">
                    <input type="hidden" name="batchId" value="<%= e.getBId() %>">
                    <input type="submit" class="status-btn" value="View Batch">
                </form>
            </div>
            <% } %>
        </div>
    <% } %>
</div>

</body>
</html>