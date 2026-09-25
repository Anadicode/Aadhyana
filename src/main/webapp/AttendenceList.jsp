<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="Model.Student"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Take Attendance</title>

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

.attendance-info {
    background: #ffffff;
    border-radius: 14px;
    padding: 18px 22px;
    margin-bottom: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
    border: 1px solid #eef0f3;
}

.info-label {
    color: #6b7280;
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 6px;
}

.date-input {
    border: 1px solid #d1d5db;
    border-radius: 8px;
    padding: 9px 12px;
    font-size: 14px;
    color: #374151;
}

.attendance-list {
    background: #ffffff;
    border-radius: 14px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
    border: 1px solid #eef0f3;
    overflow: hidden;
}

.attendance-header {
    display: grid;
    grid-template-columns: 70px 1fr 180px;
    padding: 15px 20px;
    background: #f9fafb;
    border-bottom: 1px solid #e5e7eb;
    color: #6b7280;
    font-size: 13px;
    font-weight: 700;
}

.student-row {
    display: grid;
    grid-template-columns: 70px 1fr 180px;
    align-items: center;
    padding: 16px 20px;
    border-bottom: 1px solid #f1f3f5;
    transition: background 0.2s ease;
}

.student-row:last-child {
    border-bottom: none;
}

.student-row:hover {
    background: #f9fafb;
}

.student-id {
    color: #9ca3af;
    font-size: 13px;
}

.student-name {
    color: #1f2937;
    font-size: 15px;
    font-weight: 600;
}

.status-container {
    display: flex;
    gap: 15px;
    align-items: center;
}

.status-option {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 14px;
    cursor: pointer;
}

.status-option input {
    cursor: pointer;
}

.present {
    color: #15803d;
}

.absent {
    color: #dc2626;
}

.submit-section {
    display: flex;
    justify-content: flex-end;
    margin-top: 25px;
}

.submit-btn {
    background-color: #1f2937;
    color: #ffffff;
    border: none;
    border-radius: 8px;
    padding: 11px 24px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s ease, transform 0.2s ease;
}

.submit-btn:hover {
    background-color: #111827;
    transform: translateY(-1px);
}

.no-students {
    padding: 40px;
    text-align: center;
    color: #6b7280;
    font-style: italic;
    background-color: #ffffff;
    border-radius: 14px;
}

</style>

</head>

<body>

<nav style="display:flex">

    <div class="logo">
        Aadhyana
    </div>

    <ul style="display:flex; gap:40px">

        <li>
            <a href="<%= application.getContextPath() %>/">
                Home
            </a>
        </li>

        <li>
            <a href="<%= application.getContextPath() %>/batch">
                Batch
            </a>
        </li>

        <li>
            <a href="<%= application.getContextPath() %>/student">
                Student
            </a>
        </li>

        <li>
            <a href="<%= application.getContextPath() %>/about">
                About
            </a>
        </li>

    </ul>

</nav>

<div class="container">

    <div class="page-header">

        <h2>Take Attendance</h2>

        <a class="back-link"
           href="<%= application.getContextPath() %>/batch">

            &larr; Back to Batches

        </a>

    </div>

    <%
        List<Student> students =
            (List<Student>) request.getAttribute("students");

        Integer batchId =
            (Integer) request.getAttribute("batchId");
    %>

    <% if (students == null || students.isEmpty()) { %>

        <div class="no-students">
            No students found in this batch.
        </div>

    <% } else { %>

        <form method="post"
              action="<%= application.getContextPath() %>/attendance/submit">

            <input type="hidden"
                   name="batchId"
                   value="<%= batchId %>">

            <input type="hidden"
                   name="attendanceDate"
                   id="hiddenAttendanceDate">

            <div class="attendance-info">

                <div class="info-label">
                    Attendance Date
                </div>

                <input
                    type="date"
                    class="date-input"
                    id="attendanceDate"
                    required>

            </div>

            <div class="attendance-list">

                <div class="attendance-header">

                    <div>
                        ID
                    </div>

                    <div>
                        Student Name
                    </div>

                    <div>
                        Status
                    </div>

                </div>

                <% for (Student student : students) { %>

                    <div class="student-row">

                        <div class="student-id">
                            <%= student.getId() %>
                        </div>

                        <div class="student-name">
                            <%= student.getName() %>
                        </div>

                        <div class="status-container">

                            <label class="status-option present">

                                <input
                                    type="radio"
                                    name="status_<%= student.getId() %>"
                                    value="PRESENT"
                                    required>

                                Present

                            </label>

                            <label class="status-option absent">

                                <input
                                    type="radio"
                                    name="status_<%= student.getId() %>"
                                    value="ABSENT"
                                    checked>

                                Absent

                            </label>

                        </div>

                    </div>

                <% } %>

            </div>

            <div class="submit-section">

                <button
                    type="submit"
                    class="submit-btn"
                    onclick="setAttendanceDate()">

                    Save Attendance

                </button>

            </div>

        </form>

    <% } %>

</div>

<script>

const today = new Date();

const year = today.getFullYear();

const month =
    String(today.getMonth() + 1).padStart(2, '0');

const day =
    String(today.getDate()).padStart(2, '0');

const formattedDate =
    year + '-' + month + '-' + day;

document.getElementById("attendanceDate").value =
    formattedDate;

function setAttendanceDate() {

    document.getElementById("hiddenAttendanceDate").value =
        document.getElementById("attendanceDate").value;

}

</script>

</body>
</html>

