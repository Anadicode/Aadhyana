<%@ page language="java" contentType="text/html; charset=UTF-8"
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
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f6f9;
        margin: 0;
        padding: 40px 20px;
        color: #333;
    }

    form {
        max-width: 600px;
        margin: 0 auto;
        background: #ffffff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
    }

    form::before {
        content: "Student Registration";
        display: block;
        font-size: 24px;
        font-weight: 600;
        margin-bottom: 25px;
        color: #2c3e50;
        text-align: center;
    }

    .form-group {
        margin-bottom: 18px;
    }

    .form-group label {
        display: block;
        margin-bottom: 6px;
        font-weight: 600;
        font-size: 14px;
        color: #444;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
        width: 100%;
        padding: 10px 12px;
        font-size: 14px;
        border: 1px solid #ccd1d9;
        border-radius: 6px;
        background-color: #fafafa;
        transition: border-color 0.2s ease, box-shadow 0.2s ease;
    }

    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus {
        outline: none;
        border-color: #4a90e2;
        box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.15);
        background-color: #fff;
    }

    .form-group textarea {
        resize: vertical;
    }

    .button-container {
        display: flex;
        gap: 12px;
        margin-top: 25px;
    }

    .register-btn,
    .reset-btn {
        flex: 1;
        padding: 12px;
        font-size: 15px;
        font-weight: 600;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.2s ease, transform 0.1s ease;
    }

    .register-btn {
        background-color: #4a90e2;
        color: #fff;
    }

    .register-btn:hover {
        background-color: #3a7bc8;
    }

    .reset-btn {
        background-color: #e0e0e0;
        color: #333;
    }

    .reset-btn:hover {
        background-color: #cfcfcf;
    }

    .register-btn:active,
    .reset-btn:active {
        transform: scale(0.98);
    }

    @media (max-width: 480px) {
        form {
            padding: 20px;
        }
    }
</style>
</head>
<body>


 <form action="<%= application.getContextPath() %>/student/ragister" method="post">

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
                 List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
            	 for(var e:subjects){
                %>
                <option value="<%=e.getSubjectId() %>"><%=e.getSubjectName() %></option>
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
                List<Batch> batches = (List<Batch>) request.getAttribute("batches");
                for(var e : batches){
                %>
                <option value="<%=e.getBId()%>"><%=e.getBName() %></option>
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