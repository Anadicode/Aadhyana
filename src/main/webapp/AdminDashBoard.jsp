<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Aadhyana - Admin Dashboard</title>

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

        .admin {
            font-size: 14px;
            color: #e5e7eb;
        }


        /* =========================
           MAIN CONTAINER
        ========================= */

        .container {
            width: 94%;
            max-width: 1400px;
            margin: 30px auto;
        }

        .page-title {
            margin-bottom: 25px;
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


        /* =========================
           STAT CARDS
        ========================= */

        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }

        .stat-card {
            background: white;
            border: 1px solid #e5e7eb;
            padding: 20px;
        }

        .stat-card h3 {
            font-size: 13px;
            font-weight: normal;
            color: #777;
            margin-bottom: 10px;
        }

        .stat-number {
            font-size: 27px;
            font-weight: 600;
            color: #222;
        }

        .stat-info {
            margin-top: 7px;
            font-size: 12px;
            color: #999;
        }


        /* =========================
           COMMON SECTION
        ========================= */

        .section {
            background: white;
            border: 1px solid #e5e7eb;
            padding: 20px;
            margin-bottom: 22px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;

            margin-bottom: 18px;
        }

        .section-header h2 {
            font-size: 17px;
            font-weight: 600;
            color: #333;
        }

        .section-header span {
            font-size: 12px;
            color: #888;
        }


        /* =========================
           TWO COLUMN LAYOUT
        ========================= */

        .two-column {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 22px;

            margin-bottom: 22px;
        }


        /* =========================
           CHART
        ========================= */

        .chart-box {
            height: 280px;
        }


        /* =========================
           ATTENDANCE
        ========================= */

        .attendance-row {
            display: grid;
            grid-template-columns: 100px 1fr 45px;

            align-items: center;

            gap: 12px;

            margin-bottom: 18px;
        }

        .batch-name {
            font-size: 13px;
            color: #444;
        }

        .progress {
            height: 8px;
            background: #e5e7eb;
        }

        .progress-value {
            height: 100%;
            background: #4b5563;
        }

        .percentage {
            font-size: 13px;
            text-align: right;
            color: #555;
        }


        /* =========================
           TABLE
        ========================= */

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            font-size: 13px;
            font-weight: 600;

            background: #f8f9fa;
            color: #555;

            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        td {
            font-size: 13px;
            padding: 12px;

            border-bottom: 1px solid #eee;

            color: #444;
        }

        tr:last-child td {
            border-bottom: none;
        }


        /* =========================
           ALERTS
        ========================= */

        .alert {
            display: flex;
            align-items: center;

            padding: 12px 14px;

            border-left: 4px solid #6b7280;

            background: #f8f9fa;

            margin-bottom: 10px;

            font-size: 13px;

            color: #444;
        }

        .alert:last-child {
            margin-bottom: 0;
        }


        /* =========================
           RECENT ACTIVITY
        ========================= */

        .activity {
            padding: 13px 0;

            border-bottom: 1px solid #eee;

            font-size: 13px;
        }

        .activity:last-child {
            border-bottom: none;
        }

        .activity-title {
            color: #444;
        }

        .activity-time {
            color: #999;
            font-size: 11px;
            margin-top: 4px;
        }


        /* =========================
           QUICK ACTIONS
        ========================= */

        .actions {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }

        .action {
            text-decoration: none;

            text-align: center;

            padding: 13px 8px;

            border: 1px solid #ddd;

            color: #444;

            font-size: 13px;

            background: #fafafa;
        }

        .action:hover {
            background: #f0f1f2;
            border-color: #bbb;
        }


        /* =========================
           FOOTER
        ========================= */

        .footer {
            text-align: center;

            color: #999;

            font-size: 12px;

            padding: 15px 0 25px;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 1000px) {

            .stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .two-column {
                grid-template-columns: 1fr;
            }

        }


        @media (max-width: 600px) {

            .navbar {
                padding: 0 18px;
            }

            .container {
                width: 92%;
                margin: 20px auto;
            }

            .stats {
                grid-template-columns: 1fr;
            }

            .admin {
                display: none;
            }

            .page-title h1 {
                font-size: 22px;
            }

        }

    </style>

</head>


<body>


<!-- =========================
     NAVBAR
========================= -->

<div class="navbar">

    <div class="logo">
        Aadhyana <span>Admin</span>
    </div>

    <div class="admin">
        Administrator
    </div>

</div>


<!-- =========================
     MAIN CONTENT
========================= -->

<div class="container">


    <!-- PAGE TITLE -->

    <div class="page-title">

        <h1>Admin Dashboard</h1>

        <p>
            Overview of institute activities and records.
        </p>

    </div>


    <!-- =========================
         STATISTICS
    ========================= -->

    <div class="stats">


        <div class="stat-card">

            <h3>Total Students</h3>

            <div class="stat-number">
                1250
            </div>

            <div class="stat-info">
                Registered students
            </div>

        </div>


        <div class="stat-card">

            <h3>Active Batches</h3>

            <div class="stat-number">
                18
            </div>

            <div class="stat-info">
                Currently active
            </div>

        </div>


        <div class="stat-card">

            <h3>Total Teachers</h3>

            <div class="stat-number">
                24
            </div>

            <div class="stat-info">
                Registered teachers
            </div>

        </div>


        <div class="stat-card">

            <h3>Fees Collected</h3>

            <div class="stat-number">
                ₹8.4 L
            </div>

            <div class="stat-info">
                Total amount received
            </div>

        </div>


    </div>


    <!-- =========================
         STUDENT / FEE CHARTS
    ========================= -->

    <div class="two-column">


        <!-- STUDENTS BY BATCH -->

        <div class="section">

            <div class="section-header">

                <h2>Students by Batch</h2>

                <span>Current records</span>

            </div>

            <div class="chart-box">

                <canvas id="batchChart"></canvas>

            </div>

        </div>


        <!-- FEE SUMMARY -->

        <div class="section">

            <div class="section-header">

                <h2>Fee Summary</h2>

                <span>Current records</span>

            </div>

            <div class="chart-box">

                <canvas id="feeChart"></canvas>

            </div>

        </div>


    </div>


    <!-- =========================
         ATTENDANCE / STREAM
    ========================= -->

    <div class="two-column">


        <!-- ATTENDANCE -->

        <div class="section">

            <div class="section-header">

                <h2>Attendance by Batch</h2>

                <span>Percentage</span>

            </div>


            <div class="attendance-row">

                <div class="batch-name">
                    Java
                </div>

                <div class="progress">

                    <div class="progress-value"
                         style="width: 87%;">
                    </div>

                </div>

                <div class="percentage">
                    87%
                </div>

            </div>


            <div class="attendance-row">

                <div class="batch-name">
                    MERN
                </div>

                <div class="progress">

                    <div class="progress-value"
                         style="width: 81%;">
                    </div>

                </div>

                <div class="percentage">
                    81%
                </div>

            </div>


            <div class="attendance-row">

                <div class="batch-name">
                    Python
                </div>

                <div class="progress">

                    <div class="progress-value"
                         style="width: 76%;">
                    </div>

                </div>

                <div class="percentage">
                    76%
                </div>

            </div>


            <div class="attendance-row">

                <div class="batch-name">
                    AWS
                </div>

                <div class="progress">

                    <div class="progress-value"
                         style="width: 91%;">
                    </div>

                </div>

                <div class="percentage">
                    91%
                </div>

            </div>


        </div>


        <!-- STUDENT STREAM -->

        <div class="section">

            <div class="section-header">

                <h2>Student Stream</h2>

                <span>Distribution</span>

            </div>

            <div class="chart-box">

                <canvas id="streamChart"></canvas>

            </div>

        </div>


    </div>


    <!-- =========================
         BATCH TABLE
    ========================= -->

    <div class="section">

        <div class="section-header">

            <h2>Batch Overview</h2>

            <span>Active batches</span>

        </div>


        <div class="table-container">

            <table>

                <thead>

                    <tr>

                        <th>Batch</th>
                        <th>Students</th>
                        <th>Teacher</th>
                        <th>Status</th>

                    </tr>

                </thead>


                <tbody>

                    <tr>

                        <td>Java-01</td>

                        <td>42</td>

                        <td>Rahul Sir</td>

                        <td>Active</td>

                    </tr>


                    <tr>

                        <td>MERN-01</td>

                        <td>38</td>

                        <td>Amit Sir</td>

                        <td>Active</td>

                    </tr>


                    <tr>

                        <td>Python-01</td>

                        <td>31</td>

                        <td>Sourav Sir</td>

                        <td>Active</td>

                    </tr>


                    <tr>

                        <td>AWS-01</td>

                        <td>27</td>

                        <td>Rahul Sir</td>

                        <td>Active</td>

                    </tr>


                </tbody>

            </table>

        </div>

    </div>


    <!-- =========================
         ALERTS
    ========================= -->

    <div class="section">

        <div class="section-header">

            <h2>Attention Required</h2>

            <span>Important records</span>

        </div>


        <div class="alert">

            12 students have attendance below 75%.
            
        </div>


        <div class="alert">

            18 students have pending fee payments.

        </div>


        <div class="alert">

            2 batches currently have no assigned teacher.

        </div>

    </div>


    <!-- =========================
         RECENT ACTIVITY / ACTIONS
    ========================= -->

    <div class="two-column">


        <!-- RECENT ACTIVITY -->

        <div class="section">

            <div class="section-header">

                <h2>Recent Activity</h2>

                <span>Latest updates</span>

            </div>


            <div class="activity">

                <div class="activity-title">
                    New student Rahul added.
                </div>

                <div class="activity-time">
                    10 minutes ago
                </div>

            </div>


            <div class="activity">

                <div class="activity-title">
                    Fee payment recorded for Amit.
                </div>

                <div class="activity-time">
                    35 minutes ago
                </div>

            </div>


            <div class="activity">

                <div class="activity-title">
                    Attendance updated for Java-01.
                </div>

                <div class="activity-time">
                    1 hour ago
                </div>

            </div>


            <div class="activity">

                <div class="activity-title">
                    New batch MERN-03 created.
                </div>

                <div class="activity-time">
                    2 hours ago
                </div>

            </div>


        </div>


        <!-- QUICK ACTIONS -->

        <div class="section">

            <div class="section-header">

                <h2>Quick Actions</h2>

                <span>Manage records</span>

            </div>


            <div class="actions">


                <a href="addStudent.jsp"
                   class="action">

                    Add Student

                </a>


                <a href="addBatch.jsp"
                   class="action">

                    Add Batch

                </a>


                <a href="Student"
                   class="action">

                    Students

                </a>


                <a href="Batch"
                   class="action">

                    Batches

                </a>


            </div>

        </div>


    </div>


</div>


<!-- =========================
     FOOTER
========================= -->

<div class="footer">

    Aadhyana Institute Administration System

</div>



<!-- =========================
     CHARTS
========================= -->

<script>


    /* =========================
       STUDENTS BY BATCH
    ========================= */

    const batchChart =
        document.getElementById("batchChart");

    new Chart(batchChart, {

        type: "bar",

        data: {

            labels: [
                "Java",
                "MERN",
                "Python",
                "AWS",
                "Data Science"
            ],

            datasets: [

                {

                    label: "Students",

                    data: [
                        42,
                        38,
                        31,
                        27,
                        35
                    ]

                }

            ]

        },

        options: {

            responsive: true,

            maintainAspectRatio: false,

            plugins: {

                legend: {
                    display: false
                }

            },

            scales: {

                y: {

                    beginAtZero: true,

                    ticks: {
                        stepSize: 10
                    }

                }

            }

        }

    });



    /* =========================
       FEE SUMMARY
    ========================= */

    const feeChart =
        document.getElementById("feeChart");

    new Chart(feeChart, {

        type: "doughnut",

        data: {

            labels: [
                "Paid",
                "Due"
            ],

            datasets: [

                {

                    data: [
                        840000,
                        160000
                    ]

                }

            ]

        },

        options: {

            responsive: true,

            maintainAspectRatio: false,

            plugins: {

                legend: {

                    position: "bottom"

                }

            }

        }

    });



    /* =========================
       STUDENT STREAM
    ========================= */

    const streamChart =
        document.getElementById("streamChart");

    new Chart(streamChart, {

        type: "doughnut",

        data: {

            labels: [
                "BCA",
                "B.Tech",
                "MCA",
                "Other"
            ],

            datasets: [

                {

                    data: [
                        45,
                        30,
                        15,
                        10
                    ]

                }

            ]

        },

        options: {

            responsive: true,

            maintainAspectRatio: false,

            plugins: {

                legend: {

                    position: "bottom"

                }

            }

        }

    });


</script>


</body>

</html>

