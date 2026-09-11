<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     
     
     <form action="<%=application.getContextPath() %>/batch/ragister" method="post">

        <!-- Batch ID -->
        <div class="form-group">
            <label for="bId">Batch ID</label>
            <input type="number"
                   id="bId"
                   name="bId"
                   required>
        </div>

        <!-- Batch Name -->
        <div class="form-group">
            <label for="bName">Batch Name</label>
            <input type="text"
                   id="bName"
                   name="bName"
                   placeholder="Enter batch name"
                   required>
        </div>

        <!-- Start Date -->
        <div class="form-group">
            <label for="bStartDate">Start Date</label>
            <input type="date"
                   id="bStartDate"
                   name="bStartDate"
                   required>
        </div>

        <!-- Teacher ID -->
        <div class="form-group">
            <label for="tId">Teacher ID</label>
            <input type="number"
                   id="tId"
                   name="tId"
                   placeholder="Enter teacher ID"
                   required>
        </div>

        <!-- Batch Status -->
        <div class="form-group">
            <label for="bStatus">Batch Status</label>

            <select id="bStatus" name="bStatus" required>
                <option value="">-- Select Status --</option>
                <option value="ACTIVE">ACTIVE</option>
                <option value="DEACTIVE">DEACTIVE</option>
            </select>
        </div>

        <button type="submit">Register Batch</button>

    </form>
     
     
     
</body>
</html>