package Service;

import java.util.List;

import DAO.AttendenceDAO;
import Model.Attendence;

public class AttendenceService {

    private AttendenceDAO attendence = new AttendenceDAO();

    // Save student attendance
    public void saveAttendance(List<Attendence> list) {
        attendence.takeAttendence(list);
    }

    // Get all attendance records of a batch
    public List<Attendence> getEntireBatchAttendences(int id) {
        return attendence.batchAttendance(id);
    }

    // Get all attendance records of a student
    public List<Attendence> getEntireStudentAttendences(int id) {
        return attendence.studentAttendance(id);
    }

    // Get overall attendance percentage of a batch
    public double getBatchOverallAttendance(int batchId) {
        return attendence.getBatchOverallAttendance(batchId);
    }

    // Get overall attendance percentage of a student
    public double getStudentOverallAttendance(int studentId) {
        return attendence.getStudentOverallAttendance(studentId);
    }

    // Get today's attendance percentage of a batch
    public double getBatchTodayAttendance(int batchId) {
        return attendence.getBatchTodayAttendance(batchId);
    }

    // Get today's attendance status of a student
    // Returns Present, Absent, or Not Marked
    public String getStudentTodayAttendance(int studentId) {
        return attendence.getStudentTodayAttendance(studentId);
    }
}

