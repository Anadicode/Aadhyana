
package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;

import Model.Attendence;
import Model.Batch;
import Model.Student;
import Model.Teacher;
import Service.AttendenceService;
import Service.BatchService;
import Service.TeacherService;
import Service.studentService;

@WebServlet("/AdminDashBoard")
public class AdminDashBoard extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        studentService studentService = new studentService();
        TeacherService teacherService = new TeacherService();
        BatchService batchService = new BatchService();
        AttendenceService attendenceService = new AttendenceService();

        // Existing student, teacher and batch logic
        List<Student> activeStudents =
                studentService.getAllActiveStudents();

        List<Student> deactiveStudents =
                studentService.getAllInActiveStudents();

        List<Student> allStudents =
                studentService.getAllStudents();

        List<Teacher> teachers =
                teacherService.getAllTeacher();

        List<Batch> batches =
                batchService.getAllBatch();

        // Store attendance records for active batches
        Map<Integer, List<Attendence>> allBatchAttendences =
                new HashedMap<>();

        // Store active batch IDs
        List<Integer> batchIds = new ArrayList<>();

        for (var batch : batches) {
            if ("ACTIVE".equalsIgnoreCase(batch.getBStatus())) {
                batchIds.add(batch.getBId());
            }
        }

        // Get attendance history for each active batch
        for (var batchId : batchIds) {
            allBatchAttendences.put(
                    batchId,
                    attendenceService.getEntireBatchAttendences(batchId)
            );
        }

        // Calculate average overall attendance across active batches
        double totalAvgAttendence = 0.0;

        if (!batchIds.isEmpty()) {
            for (var batchId : batchIds) {
                totalAvgAttendence +=
                        attendenceService.getBatchOverallAttendance(batchId);
            }

            totalAvgAttendence /= batchIds.size();
        }

        // Calculate average attendance for today across active batches
        double totalTodayAttendence = 0.0;

        if (!batchIds.isEmpty()) {
            for (var batchId : batchIds) {
                totalTodayAttendence +=
                        attendenceService.getBatchTodayAttendance(batchId);
            }

            totalTodayAttendence /= batchIds.size();
        }

        // Keep the existing console output
        System.out.println(totalAvgAttendence);

        // Existing attributes
        request.setAttribute("totalAvgAttendence", totalAvgAttendence);
        request.setAttribute("activeStudents", activeStudents);
        request.setAttribute("deactiveStudents", deactiveStudents);
        request.setAttribute("allStudents", allStudents);
        request.setAttribute("teachers", teachers);
        request.setAttribute("batches", batches);

        // New attribute for today's attendance
        request.setAttribute("totalTodayAttendence", totalTodayAttendence);

        // Preserve the attendance map if your JSP uses it
        request.setAttribute("allBatchAttendences", allBatchAttendences);

        RequestDispatcher rd =
                request.getRequestDispatcher("/AdminDashBoard.jsp");

        rd.forward(request, response);
    }
}

