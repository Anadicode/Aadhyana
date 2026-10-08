
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="Model.Batch" %>
<%@ page import="Model.Subject" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Student Registration</title>

<style>

* {
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #f4f5f7;
    margin: 0;
    padding: 30px 20px;
    color: #1f2937;
}

/* Form container */

form {
    max-width: 600px;
    margin: 0 auto;
    background-color: #ffffff;
    padding: 30px 35px;
    border: 1px solid #e5e7eb;
    border-radius: 6px;
}

/* Form title */

form::before {
    content: "Student Registration";
    display: block;
    font-size: 22px;
    font-weight: 600;
    margin-bottom: 25px;
    color: #1f2937;
    text-align: center;
}

/* Form fields */

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    margin-bottom: 7px;
    font-weight: 600;
    font-size: 14px;
    color: #374151;
}

.form-group input,
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 10px 12px;
    font-size: 14px;
    font-family: inherit;
    color: #1f2937;
    border: 1px solid #d1d5db;
    border-radius: 5px;
    background-color: #ffffff;
    outline: none;
    transition: border-color 0.2s ease;
}

.form-group input::placeholder,
.form-group textarea::placeholder {
    color: #9ca3af;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #1f2937;
    background-color: #ffffff;
}

.form-group textarea {
    resize: vertical;
}

/* Buttons */

.button-container {
    display: flex;
    gap: 10px;
    margin-top: 25px;
}

.register-btn,
.reset-btn {
    flex: 1;
    padding: 11px;
    font-size: 14px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.2s ease,
                color 0.2s ease,
                border-color 0.2s ease;
}

.register-btn {
    background-color: #1f2937;
    color: #ffffff;
    border: 1px solid #1f2937;
}

.register-btn:hover {
    background-color: #111827;
    border-color: #111827;
}

.reset-btn {
    background-color: #ffffff;
    color: #374151;
    border: 1px solid #d1d5db;
}

.reset-btn:hover {
    background-color: #f3f4f6;
}

/* Mobile */

@media (max-width: 480px) {

    body {
        padding: 20px 12px;
    }

    form {
        padding: 25px 20px;
    }

    .button-container {
        flex-direction: column;
    }

}

</style>

</head>

<body>


<form action="<%= application.getContextPath() %>/student/ragister"
      method="post">

    <!-- Student ID -->

    <div class="form-group">

        <label for="stId">Student ID</label>

        <input type="number"
               id="stId"
               name="stId"
               placeholder="Enter student ID"
               required>

    </div>


    <!-- Student Name -->

    <div class="form-group">

        <label for="name">Student Name</label>

        <input type="text"
               id="name"
               name="name"
               placeholder="Enter student name"
               maxlength="100"
               required>

    </div>


    <!-- Phone -->

    <div class="form-group">

        <label for="phone">Phone Number</label>

        <input type="tel"
               id="phone"
               name="phone"
               placeholder="Enter 10 digit phone number"
               maxlength="10"
               pattern="[0-9]{10}"
               required>

    </div>


    <!-- Address -->

    <div class="form-group">

        <label for="address">Address</label>

        <textarea id="address"
                  name="address"
                  rows="4"
                  placeholder="Enter address"
                  maxlength="255"
                  required></textarea>

    </div>


    <!-- Age -->

    <div class="form-group">

        <label for="age">Age</label>

        <input type="number"
               id="age"
               name="age"
               min="1"
               max="100"
               placeholder="Enter age"
               required>

    </div>


    <!-- Email -->

    <div class="form-group">

        <label for="email">Email</label>

        <input type="email"
               id="email"
               name="email"
               placeholder="Enter email"
               maxlength="150"
               required>

    </div>


    <!-- College -->

    <div class="form-group">

        <label for="collegeName">College Name</label>

        <input type="text"
               id="collegeName"
               name="collegeName"
               placeholder="Enter college name"
               maxlength="150"
               required>

    </div>


    <!-- Stream -->

    <div class="form-group">

        <label for="stream">Stream</label>

        <select id="stream" name="stream" required>

            <option value="">-- Select Stream --</option>

            <option value="BCA">BCA</option>

            <option value="B.Tech">B.Tech</option>

            <option value="MCA">MCA</option>

            <option value="M.Tech">M.Tech</option>

            <option value="BBA">BBA</option>

            <option value="MBA">MBA</option>

        </select>

    </div>


    <!-- Subject -->

    <div class="form-group">

        <label for="sId">Subject</label>

        <select id="sId" name="sId" required>

            <option value="">-- Select Subject --</option>

            <% 

             List<Subject> subjects =
                 (List<Subject>) request.getAttribute("subjects");

             for(var e:subjects){

            %>

            <option value="<%=e.getSubjectId() %>">
                <%=e.getSubjectName() %>
            </option>

            <%} %>

        </select>

    </div>


    <!-- Teacher -->

    <div class="form-group">

        <label for="tId">Teacher</label>

        <select id="tId" name="tId" required>

            <option value="">-- Select Teacher --</option>

            <option value="1">Samik Dey</option>

            <option value="2">Pramit Maity</option>

            <option value="3">Amit Roy</option>

            <option value="4">Sneha Das</option>

            <option value="5">Arindam Ghosh</option>

        </select>

    </div>


    <!-- Batch -->

    <div class="form-group">

        <label for="bId">Batch</label>

        <select id="bId" name="bId" required>

            <option value="">-- Select Batch --</option>

            <% 

            List<Batch> batches =
                (List<Batch>) request.getAttribute("batches");

            for(var e : batches){

            %>

            <option value="<%=e.getBId()%>">
                <%=e.getBName() %>
            </option>

            <%} %>

        </select>

    </div>


    <!-- Buttons -->

    <div class="button-container">

        <button type="submit" class="register-btn">
            Register Student
        </button>

        <button type="reset" class="reset-btn">
            Reset
        </button>

    </div>

</form>


</body>

</html>

