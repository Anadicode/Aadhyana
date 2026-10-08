<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Aadhyana - Register Batch</title>

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Arial, Helvetica, sans-serif;
    }

    body {
        background: #f4f5f7;
        min-height: 100vh;
        color: #1f2937;
    }

    /* Main container */

    .main-container {
        width: 100%;
        display: flex;
        justify-content: center;
        padding: 40px 20px;
    }

    /* Form card */

    .form-card {
        width: 520px;
        background: #ffffff;
        padding: 30px 35px;
        border-radius: 6px;
        border: 1px solid #e5e7eb;
    }

    .form-header {
        margin-bottom: 25px;
        padding-bottom: 18px;
        border-bottom: 1px solid #e5e7eb;
    }

    .form-header h2 {
        font-size: 24px;
        color: #1f2937;
        margin-bottom: 6px;
        font-weight: 700;
    }

    .form-header p {
        color: #6b7280;
        font-size: 14px;
    }

    /* Form fields */

    .form-group {
        margin-bottom: 18px;
    }

    .form-group label {
        display: block;
        margin-bottom: 7px;
        font-size: 14px;
        font-weight: 600;
        color: #374151;
    }

    .form-group input,
    .form-group select {
        width: 100%;
        height: 42px;
        padding: 0 12px;
        border: 1px solid #d1d5db;
        border-radius: 5px;
        background: #ffffff;
        color: #111827;
        font-size: 14px;
        outline: none;
        transition: border-color 0.2s ease;
    }

    .form-group input::placeholder {
        color: #9ca3af;
    }

    .form-group input:focus,
    .form-group select:focus {
        border-color: #1f2937;
    }

    .form-group select {
        cursor: pointer;
    }

    /* Button */

    .submit-btn {
        width: 100%;
        height: 43px;
        margin-top: 5px;
        border: none;
        border-radius: 5px;
        background: #1f2937;
        color: #ffffff;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .submit-btn:hover {
        background: #111827;
    }

    .submit-btn:active {
        transform: scale(0.99);
    }

    /* Mobile */

    @media (max-width: 600px) {

        nav {
            padding: 0 20px;
        }

        nav ul {
            gap: 15px;
        }

        .form-card {
            width: 100%;
            padding: 28px 25px;
        }
    }

</style>

</head>

<body>

<!-- Main Content -->

<div class="main-container">

```
<div class="form-card">

    <div class="form-header">

        <h2>Register Batch</h2>

        <p>
            Add a new batch to Aadhyana
        </p>

    </div>

    <form action="<%=application.getContextPath()%>/batch/ragister"
          method="post">

        <!-- Batch ID -->

        <div class="form-group">

            <label for="bId">
                Batch ID
            </label>

            <input
                type="number"
                id="bId"
                name="bId"
                placeholder="Enter batch ID"
                required>

        </div>

        <!-- Batch Name -->

        <div class="form-group">

            <label for="bName">
                Batch Name
            </label>

            <input
                type="text"
                id="bName"
                name="bName"
                placeholder="Enter batch name"
                required>

        </div>

        <!-- Start Date -->

        <div class="form-group">

            <label for="bStartDate">
                Start Date
            </label>

            <input
                type="date"
                id="bStartDate"
                name="bStartDate"
                required>

        </div>

        <!-- Teacher ID -->

        <div class="form-group">

            <label for="tId">
                Teacher ID
            </label>

            <input
                type="number"
                id="tId"
                name="tId"
                placeholder="Enter teacher ID"
                required>

        </div>

        <!-- Batch Status -->

        <div class="form-group">

            <label for="bStatus">
                Batch Status
            </label>

            <select
                id="bStatus"
                name="bStatus"
                required>

                <option value="">
                    -- Select Status --
                </option>

                <option value="ACTIVE">
                    ACTIVE
                </option>

                <option value="DEACTIVE">
                    DEACTIVE
                </option>

            </select>

        </div>

        <!-- Submit -->

        <button
            type="submit"
            class="submit-btn">

            Register Batch

        </button>

    </form>

</div>


</div>

</body>

</html>
