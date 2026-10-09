<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List,Model.Student,Model.Teacher,Model.Batch" %>

<%
    List<Student> activeStudents =
        (List<Student>) request.getAttribute("activeStudents");

    List<Student> deactiveStudents =
        (List<Student>) request.getAttribute("deactiveStudents");

    List<Student> allStudents =
        (List<Student>) request.getAttribute("allStudents");

    List<Teacher> teachers =
        (List<Teacher>) request.getAttribute("teachers");

    List<Batch> batches =
        (List<Batch>) request.getAttribute("batches");

    int activeCount = activeStudents == null ? 0 : activeStudents.size();
    int inactiveCount = deactiveStudents == null ? 0 : deactiveStudents.size();
    int studentCount = allStudents == null ? 0 : allStudents.size();
    int teacherCount = teachers == null ? 0 : teachers.size();
    int batchCount = batches == null ? 0 : batches.size();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Aadhyana - Admin Dashboard</title>

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

.stats {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 18px;
    margin-bottom: 25px;
}

.stat-card,
.section {
    background: white;
    border: 1px solid #e5e7eb;
    border-radius: 10px;
}

.stat-card {
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

.section {
    padding: 20px;
    margin-bottom: 22px;
}

.section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
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

.two-column {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 22px;
    margin-bottom: 22px;
}

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

.pill {
    display: inline-block;
    padding: 5px 9px;
    border-radius: 20px;
    background: #e5e7eb;
    color: #374151;
    font-size: 11px;
}

.pill.active {
    background: #dcfce7;
    color: #166534;
}

.pill.inactive {
    background: #fee2e2;
    color: #991b1b;
}

.empty {
    padding: 18px;
    text-align: center;
    color: #888;
    font-size: 13px;
}

.actions {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 10px;
}

.action {
    text-decoration: none;
    text-align: center;
    padding: 13px 8px;
    border: 1px solid #ddd;
    border-radius: 6px;
    color: #444;
    font-size: 13px;
    background: #fafafa;
}

.action:hover {
    background: #f0f1f2;
    border-color: #bbb;
}

.note {
    font-size: 13px;
    line-height: 1.6;
    color: #777;
    background: #f8f9fa;
    padding: 14px;
    border-radius: 6px;
}

.footer {
    text-align: center;
    color: #999;
    font-size: 12px;
    padding: 15px 0 25px;
}

@media (max-width: 1000px) {
    .stats {
        grid-template-columns: repeat(2, minmax(0, 1fr));
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

    .section {
        padding: 15px;
    }
}
</style>
</head>

<body>

<div class="navbar">
    <div class="logo">
        Aadhyana <span>Admin</span>
    </div>

    <div class="admin">
        Administrator
    </div>
</div>

<div class="container">

    <div class="page-title">
        <h1>Admin Dashboard</h1>
        <p>Overview of institute activities and records.</p>
    </div>

    <!-- STATISTICS -->

    <div class="stats">

        <div class="stat-card">
            <h3>Total Students</h3>
            <div class="stat-number"><%= studentCount %></div>
            <div class="stat-info">All registered students</div>
        </div>

        <div class="stat-card">
            <h3>Active Students</h3>
            <div class="stat-number"><%= activeCount %></div>
            <div class="stat-info">Currently active students</div>
        </div>

        <div class="stat-card">
            <h3>Inactive Students</h3>
            <div class="stat-number"><%= inactiveCount %></div>
            <div class="stat-info">Inactive student records</div>
        </div>

        <div class="stat-card">
            <h3>Total Teachers</h3>
            <div class="stat-number"><%= teacherCount %></div>
            <div class="stat-info">Registered teachers</div>
        </div>

    </div>

    <!-- INSTITUTE OVERVIEW -->

    <div class="two-column">

        <div class="section">

            <div class="section-header">
                <h2>Institute Overview</h2>
                <span>Live service data</span>
            </div>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Metric</th>
                            <th>Count</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>Total Students</td>
                            <td><%= studentCount %></td>
                        </tr>

                        <tr>
                            <td>Active Students</td>
                            <td><%= activeCount %></td>
                        </tr>

                        <tr>
                            <td>Inactive Students</td>
                            <td><%= inactiveCount %></td>
                        </tr>

                        <tr>
                            <td>Total Teachers</td>
                            <td><%= teacherCount %></td>
                        </tr>

                        <tr>
                            <td>Total Batches</td>
                            <td><%= batchCount %></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

        <div class="section">

            <div class="section-header">
                <h2>Quick Actions</h2>
                <span>Manage records</span>
            </div>

            <div class="actions">

                <a class="action"
                   href="<%= application.getContextPath() %>/student/ragister">
                    Add Student
                </a>

                <a class="action"
                   href="<%= application.getContextPath() %>/batch/ragister">
                    Add Batch
                </a>

                <a class="action"
                   href="<%= application.getContextPath() %>/student">
                    Students
                </a>

                <a class="action"
                   href="<%= application.getContextPath() %>/batch">
                    Batches
                </a>

            </div>

            <p class="note" style="margin-top:14px">
                Fee totals, attendance rates, and recent activity are not
                available because the current dashboard servlet does not
                retrieve those metrics.
            </p>

        </div>

    </div>

    <!-- BATCH OVERVIEW -->

    <div class="section">

        <div class="section-header">
            <h2>Batch Overview</h2>
            <span><%= batchCount %> batch records</span>
        </div>

        <div class="table-container">

            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Batch ID</th>
                        <th>Batch Name</th>
                        <th>Start Date</th>
                        <th>Teacher ID</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>

                <%
                    if (batches == null || batches.isEmpty()) {
                %>

                    <tr>
                        <td colspan="6" class="empty">
                            No batch records found.
                        </td>
                    </tr>

                <%
                    } else {
                        int row = 1;

                        for (Batch batch : batches) {
                %>

                    <tr>
                        <td><%= row++ %></td>
                        <td><%= batch.getBId() %></td>
                        <td><%= batch.getBName() == null ? "-" : batch.getBName() %></td>
                        <td><%= batch.getBStartDate() == null ? "-" : batch.getBStartDate() %></td>
                        <td><%= batch.getTId() %></td>

                        <td>
                            <span class="pill <%= "ACTIVE".equalsIgnoreCase(batch.getBStatus()) ? "active" : ("INACTIVE".equalsIgnoreCase(batch.getBStatus()) ? "inactive" : "") %>">
                                <%= batch.getBStatus() == null ? "Unknown" : batch.getBStatus() %>
                            </span>
                        </td>
                    </tr>

                <%
                        }
                    }
                %>

                </tbody>
            </table>

        </div>
    </div>

    <!-- TEACHER DIRECTORY -->

    <div class="two-column">

        <div class="section">

            <div class="section-header">
                <h2>Teacher Directory</h2>
                <span><%= teacherCount %> teacher records</span>
            </div>

            <div class="table-container">

                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Teacher ID</th>
                            <th>Name</th>
                            <th>Subject ID</th>
                        </tr>
                    </thead>

                    <tbody>

                    <%
                        if (teachers == null || teachers.isEmpty()) {
                    %>

                        <tr>
                            <td colspan="4" class="empty">
                                No teacher records found.
                            </td>
                        </tr>

                    <%
                        } else {
                            int row = 1;

                            for (Teacher teacher : teachers) {
                    %>

                        <tr>
                            <td><%= row++ %></td>
                            <td><%= teacher.getTeacherId() %></td>
                            <td><%= teacher.getTeacherName() == null ? "-" : teacher.getTeacherName() %></td>
                            <td><%= teacher.getSubjectId() %></td>
                        </tr>

                    <%
                            }
                        }
                    %>

                    </tbody>
                </table>

            </div>
        </div>

        <!-- STUDENT DIRECTORY -->

        <div class="section">

            <div class="section-header">
                <h2>Student Directory</h2>
                <span><%= studentCount %> student records</span>
            </div>

            <div class="table-container">

                <table>
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Stream</th>
                            <th>Batch ID</th>
                        </tr>
                    </thead>

                    <tbody>

                    <%
                        if (allStudents == null || allStudents.isEmpty()) {
                    %>

                        <tr>
                            <td colspan="4" class="empty">
                                No student records found.
                            </td>
                        </tr>

                    <%
                        } else {
                            int limit = Math.min(allStudents.size(), 10);

                            for (int i = 0; i < limit; i++) {
                                Student student = allStudents.get(i);
                    %>

                        <tr>
                            <td><%= student.getId() %></td>
                            <td><%= student.getName() == null ? "-" : student.getName() %></td>
                            <td><%= student.getStreamString() == null ? "-" : student.getStreamString() %></td>
                            <td><%= student.getB_id() %></td>
                        </tr>

                    <%
                            }
                        }
                    %>

                    </tbody>
                </table>

                <% if (studentCount > 10) { %>

                    <p class="note" style="margin-top:10px">
                        Showing the first 10 students of <%= studentCount %>.
                        Open Students to view the full list.
                    </p>

                <% } %>

            </div>
        </div>

    </div>

</div>

<div class="footer">
    Aadhyana Institute Administration System
</div>

</body>
</html>