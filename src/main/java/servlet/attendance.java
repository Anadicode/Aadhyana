package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import Model.Attendence;
import Model.Student;
import Service.AttendenceService;
import Service.BatchService;

@WebServlet("/attendance/*")
public class attendance extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        // Not used
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String path = request.getPathInfo();


        // ==========================================
        // 1. OPEN ATTENDANCE PAGE
        // POST /attendance
        // ==========================================

        if (path == null || path.equals("/")) {

            String batchIdString =
                    request.getParameter("batchId");


            // Check batchId
            if (batchIdString == null || batchIdString.isBlank()) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Batch ID is missing"
                );

                return;
            }


            int batchId;

            try {

                batchId = Integer.parseInt(batchIdString);

            } catch (NumberFormatException e) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Batch ID"
                );

                return;
            }


            System.out.println(
                "Opening attendance for batch: " + batchId
            );


            BatchService batchService =
                    new BatchService();

            List<Student> students =
                    batchService.getAllStudentInaBatch(batchId);


            // Send data to JSP
            request.setAttribute("students", students);
            request.setAttribute("batchId", batchId);


            RequestDispatcher rd =
                    request.getRequestDispatcher(
                        "/AttendenceList.jsp"
                    );

            rd.forward(request, response);

            return;
        }



        // ==========================================
        // 2. SUBMIT ATTENDANCE
        // POST /attendance/submit
        // ==========================================

        if (path.equals("/submit")) {

            System.out.println(
                "Submitting attendance..."
            );


            // ------------------------------------------
            // Get form data
            // ------------------------------------------

            String batchIdString =
                    request.getParameter("batchId");

            String attendanceDateString =
                    request.getParameter("attendanceDate");


            // ------------------------------------------
            // Validate batch ID
            // ------------------------------------------

            if (batchIdString == null ||
                batchIdString.isBlank()) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Batch ID is missing"
                );

                return;
            }


            // ------------------------------------------
            // Validate attendance date
            // ------------------------------------------

            if (attendanceDateString == null ||
                attendanceDateString.isBlank()) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Attendance date is missing"
                );

                return;
            }


            // ------------------------------------------
            // Convert batch ID
            // ------------------------------------------

            int batchId;

            try {

                batchId =
                    Integer.parseInt(batchIdString);

            } catch (NumberFormatException e) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Batch ID"
                );

                return;
            }


            // ------------------------------------------
            // Convert String date -> java.sql.Date
            // ------------------------------------------

            Date attendanceDate;

            try {

                attendanceDate =
                    Date.valueOf(attendanceDateString);

            } catch (IllegalArgumentException e) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid attendance date"
                );

                return;
            }


            System.out.println(
                "Batch ID: " + batchId
            );

            System.out.println(
                "Attendance Date: " + attendanceDate
            );


            // ==========================================
            // Get all students of this batch
            // ==========================================

            BatchService batchService =
                    new BatchService();

            List<Student> students =
                    batchService.getAllStudentInaBatch(batchId);


            // ==========================================
            // Create Attendance List
            // ==========================================

            List<Attendence> attendenceList =
                    new ArrayList<>();


            // ==========================================
            // Read attendance of every student
            // ==========================================

            for (Student student : students) {

                String status =
                        request.getParameter(
                            "status_" + student.getId()
                        );


                // Safety check
                if (status == null ||
                    status.isBlank()) {

                    status = "ABSENT";
                }


                // Create Attendence object
                Attendence attendence =
                        new Attendence();


                attendence.setAttendeprivatence_date(
                    attendanceDate
                );

                attendence.setB_Id(
                    batchId
                );

                attendence.setST_ID(
                    student.getId()
                );

                attendence.setStatus(
                    status
                );


                // Add to list
                attendenceList.add(
                    attendence
                );


                // Console checking
                System.out.println(
                    "Student ID: " +
                    student.getId() +
                    " | Name: " +
                    student.getName() +
                    " | Status: " +
                    status
                );
            }


            // ==========================================
            // Save Attendance
            // ==========================================

            AttendenceService attendenceService =
                    new AttendenceService();


            attendenceService.saveAttendance(
                attendenceList
            );


            System.out.println(
                "Attendance saved successfully!"
            );


            // ==========================================
            // Redirect
            // ==========================================

            response.sendRedirect(
                request.getContextPath() + "/batch"
            );

            return;
        }



        // ==========================================
        // INVALID PATH
        // ==========================================

        response.sendError(
            HttpServletResponse.SC_NOT_FOUND,
            "Invalid attendance URL"
        );
    }
}