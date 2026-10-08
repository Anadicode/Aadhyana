<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="Model.Student" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Aadhyana - Take Attendance</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f5f7;
            color: #333;
        }


        /* =========================
           NAVBAR
        ========================= */

        .navbar {
            height: 64px;

            background: #1f2937;
            color: white;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 30px;
        }

        .logo {
            font-size: 22px;
            font-weight: 600;
        }

        .logo span {
            color: #9ca3af;
        }

        .nav-links {
            display: flex;
            gap: 32px;

            list-style: none;
        }

        .nav-links a {
            color: #d1d5db;

            text-decoration: none;

            font-size: 14px;

            transition: color 0.2s;
        }

        .nav-links a:hover {
            color: white;
        }


        /* =========================
           MAIN CONTAINER
        ========================= */

        .container {
            width: 94%;
            max-width: 1100px;

            margin: 30px auto;
        }


        /* =========================
           PAGE HEADER
        ========================= */

        .page-header {
            display: flex;

            justify-content: space-between;
            align-items: center;

            margin-bottom: 22px;
        }

        .page-title h1 {
            font-size: 25px;

            font-weight: 600;

            color: #222;

            margin-bottom: 6px;
        }

        .page-title p {
            font-size: 14px;

            color: #777;
        }

        .back-link {
            color: #4b5563;

            text-decoration: none;

            font-size: 13px;

            border: 1px solid #d1d5db;

            background: white;

            padding: 9px 14px;
        }

        .back-link:hover {
            background: #f8f9fa;
        }


        /* =========================
           ATTENDANCE INFORMATION
        ========================= */

        .attendance-info {
            background: white;

            border: 1px solid #e5e7eb;

            padding: 18px 20px;

            margin-bottom: 18px;
        }

        .info-label {
            font-size: 13px;

            color: #555;

            font-weight: 600;

            margin-bottom: 8px;
        }

        .date-input {
            border: 1px solid #d1d5db;

            padding: 9px 11px;

            font-size: 13px;

            color: #333;

            background: white;
        }

        .date-input:focus {
            outline: none;

            border-color: #6b7280;
        }


        /* =========================
           ATTENDANCE TABLE
        ========================= */

        .attendance-list {
            background: white;

            border: 1px solid #e5e7eb;

            overflow-x: auto;
        }

        .attendance-header {
            display: grid;

            grid-template-columns: 80px 1fr 210px;

            padding: 13px 20px;

            background: #f8f9fa;

            border-bottom: 1px solid #ddd;

            color: #555;

            font-size: 13px;

            font-weight: 600;
        }

        .student-row {
            display: grid;

            grid-template-columns: 80px 1fr 210px;

            align-items: center;

            min-height: 58px;

            padding: 10px 20px;

            border-bottom: 1px solid #eee;
        }

        .student-row:last-child {
            border-bottom: none;
        }

        .student-row:hover {
            background: #fafafa;
        }

        .student-id {
            font-size: 13px;

            color: #777;
        }

        .student-name {
            font-size: 14px;

            color: #333;

            font-weight: 500;
        }


        /* =========================
           STATUS
        ========================= */

        .status-container {
            display: flex;

            align-items: center;

            gap: 20px;
        }

        .status-option {
            display: flex;

            align-items: center;

            gap: 6px;

            font-size: 13px;

            cursor: pointer;
        }

        .status-option input {
            cursor: pointer;
        }

        .present {
            color: #166534;
        }

        .absent {
            color: #b91c1c;
        }


        /* =========================
           SUBMIT
        ========================= */

        .submit-section {
            display: flex;

            justify-content: flex-end;

            margin-top: 18px;
        }

        .submit-btn {
            background: #1f2937;

            color: white;

            border: none;

            padding: 10px 20px;

            font-size: 13px;

            font-weight: 600;

            cursor: pointer;
        }

        .submit-btn:hover {
            background: #111827;
        }


        /* =========================
           NO STUDENTS
        ========================= */

        .no-students {
            background: white;

            border: 1px solid #e5e7eb;

            padding: 40px;

            text-align: center;

            color: #777;

            font-size: 14px;
        }


        /* =========================
           FOOTER
        ========================= */

        .footer {
            text-align: center;

            color: #999;

            font-size: 12px;

            padding: 10px 0 25px;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 800px) {

            .navbar {
                padding: 0 18px;
            }

            .nav-links {
                gap: 15px;
            }

            .container {
                width: 92%;
            }

            .attendance-header,
            .student-row {
                grid-template-columns: 60px 1fr 180px;
            }

        }


        @media (max-width: 600px) {

            .nav-links {
                display: none;
            }

            .page-header {
                align-items: flex-start;

                flex-direction: column;

                gap: 12px;
            }

            .page-title h1 {
                font-size: 22px;
            }

            .attendance-header,
            .student-row {
                grid-template-columns: 55px 1fr 165px;
            }

            .status-container {
                gap: 10px;
            }

        }

    </style>

</head>


<body>


<!-- =========================
     NAVBAR
========================= -->

<nav class="navbar">

    <div class="logo">
        Aadhyana <span>Admin</span>
    </div>


    <ul class="nav-links">

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


<!-- =========================
     MAIN CONTENT
========================= -->

<div class="container">


    <!-- PAGE HEADER -->

    <div class="page-header">

        <div class="page-title">

            <h1>Take Attendance</h1>

            <p>
                Mark attendance for students in this batch.
            </p>

        </div>


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


        <!-- NO STUDENTS -->

        <div class="no-students">

            No students found in this batch.

        </div>


    <% } else { %>


        <!-- =========================
             ATTENDANCE FORM
        ========================= -->

        <form method="post"
              action="<%= application.getContextPath() %>/attendance/submit">


            <!-- DATE -->

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


            <!-- STUDENT LIST -->

            <div class="attendance-list">


                <!-- HEADER -->

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


                <!-- STUDENTS -->

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


            <!-- SUBMIT -->

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


<!-- =========================
     FOOTER
========================= -->

<div class="footer">

    Aadhyana Institute Administration System

</div>


<!-- =========================
     JAVASCRIPT
========================= -->

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

