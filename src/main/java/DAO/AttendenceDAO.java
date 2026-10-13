package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Attendence;
import util.DBconnection;

public class AttendenceDAO {

    // Taking student attendance
    public void takeAttendence(List<Attendence> attendenceList) {

        String query = """
            INSERT INTO ATTENDENCE
            (ATTENDENCE_DATE, B_ID, ST_ID, STATUS)
            VALUES (?, ?, ?, ?)
            """;

        try (Connection con = DBconnection.getDBConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            con.setAutoCommit(false);

            try {
                for (Attendence attendance : attendenceList) {
                    ps.setDate(1, attendance.getAttendeprivatence_date());
                    ps.setInt(2, attendance.getB_Id());
                    ps.setInt(3, attendance.getST_ID());
                    ps.setString(4, attendance.getStatus());

                    ps.addBatch();
                }

                ps.executeBatch();
                con.commit();

                System.out.println("Attendance saved successfully.");

            } catch (Exception e) {
                con.rollback();
                throw e;
            } finally {
                con.setAutoCommit(true);
            }

        } catch (Exception e) {
            System.out.println("Error taking attendance: " + e.getMessage());
        }
    }


    // Overall attendance percentage of a batch
    public double getBatchOverallAttendance(int batchId) {

        String query = """
            SELECT
                COUNT(*) AS total,
                SUM(CASE
                    WHEN LOWER(TRIM(STATUS)) = 'present' THEN 1
                    ELSE 0
                END) AS present_count
            FROM ATTENDENCE
            WHERE B_ID = ?
            """;

        try (Connection con = DBconnection.getDBConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, batchId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int total = rs.getInt("total");
                    int present = rs.getInt("present_count");

                    if (total == 0) {
                        return 0.0;
                    }

                    return (present * 100.0) / total;
                }
            }

        } catch (Exception e) {
            System.out.println("Error calculating batch attendance: "
                    + e.getMessage());
        }

        return 0.0;
    }


    // Overall attendance percentage of a student
    public double getStudentOverallAttendance(int studentId) {

        String query = """
            SELECT
                COUNT(*) AS total,
                SUM(CASE
                    WHEN LOWER(TRIM(STATUS)) = 'present' THEN 1
                    ELSE 0
                END) AS present_count
            FROM ATTENDENCE
            WHERE ST_ID = ?
            """;

        try (Connection con = DBconnection.getDBConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int total = rs.getInt("total");
                    int present = rs.getInt("present_count");

                    if (total == 0) {
                        return 0.0;
                    }

                    return (present * 100.0) / total;
                }
            }

        } catch (Exception e) {
            System.out.println("Error calculating student attendance: "
                    + e.getMessage());
        }

        return 0.0;
    }


    // Today's attendance percentage of a batch
    public double getBatchTodayAttendance(int batchId) {

        String query = """
            SELECT
                COUNT(*) AS total,
                SUM(CASE
                    WHEN LOWER(TRIM(STATUS)) = 'present' THEN 1
                    ELSE 0
                END) AS present_count
            FROM ATTENDENCE
            WHERE B_ID = ?
              AND ATTENDENCE_DATE = CURDATE()
            """;

        try (Connection con = DBconnection.getDBConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, batchId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int total = rs.getInt("total");
                    int present = rs.getInt("present_count");

                    if (total == 0) {
                        return 0.0;
                    }

                    return (present * 100.0) / total;
                }
            }

        } catch (Exception e) {
            System.out.println("Error calculating today's batch attendance: "
                    + e.getMessage());
        }

        return 0.0;
    }


    // Today's attendance status of a student
    // Returns Present, Absent, or Not Marked
    public String getStudentTodayAttendance(int studentId) {

        String query = """
            SELECT STATUS
            FROM ATTENDENCE
            WHERE ST_ID = ?
              AND ATTENDENCE_DATE = CURDATE()
            LIMIT 1
            """;

        try (Connection con = DBconnection.getDBConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("STATUS");
                }
            }

        } catch (Exception e) {
            System.out.println("Error retrieving today's student attendance: "
                    + e.getMessage());
        }

        return "Not Marked";
    }


    // Get all attendance records of a batch
    public List<Attendence> batchAttendance(int batchId) {

        String query = """
            SELECT ATTENDENCE_DATE, B_ID, ST_ID, STATUS
            FROM ATTENDENCE
            WHERE B_ID = ?
            ORDER BY ATTENDENCE_DATE DESC
            """;

        List<Attendence> attendanceList = new ArrayList<>();

        try (Connection con = DBconnection.getDBConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, batchId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Attendence attendance = new Attendence();

                    attendance.setAttendeprivatence_date(
                            rs.getDate("ATTENDENCE_DATE"));
                    attendance.setB_Id(rs.getInt("B_ID"));
                    attendance.setST_ID(rs.getInt("ST_ID"));
                    attendance.setStatus(rs.getString("STATUS"));

                    attendanceList.add(attendance);
                }
            }

        } catch (Exception e) {
            System.out.println("Error retrieving batch attendance: "
                    + e.getMessage());
        }

        return attendanceList;
    }


    // Get all attendance records of a student
    public List<Attendence> studentAttendance(int studentId) {

        String query = """
            SELECT ATTENDENCE_DATE, B_ID, ST_ID, STATUS
            FROM ATTENDENCE
            WHERE ST_ID = ?
            ORDER BY ATTENDENCE_DATE DESC
            """;

        List<Attendence> attendanceList = new ArrayList<>();

        try (Connection con = DBconnection.getDBConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Attendence attendance = new Attendence();

                    attendance.setAttendeprivatence_date(
                            rs.getDate("ATTENDENCE_DATE"));
                    attendance.setB_Id(rs.getInt("B_ID"));
                    attendance.setST_ID(rs.getInt("ST_ID"));
                    attendance.setStatus(rs.getString("STATUS"));

                    attendanceList.add(attendance);
                }
            }

        } catch (Exception e) {
            System.out.println("Error retrieving student attendance: "
                    + e.getMessage());
        }

        return attendanceList;
    }
}

