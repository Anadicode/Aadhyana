package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import util.DBconnection;

public class FeeManagementDAO {

    // Inserting fees into DB
    public void insertFees(Sheet sheet) {

        String query = """
                INSERT INTO FEES
                (ST_ID, B_ID, TOTAL_AMOUNT,
                 PAID_AMOUNT, PAYMENT_DATE, PAYMENT_MODE)
                VALUES (?, ?, ?, ?, ?, ?)
                """;

        try (Connection con = DBconnection.getDBConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            // Skip header row
            for (int i = 1; i <= sheet.getLastRowNum(); i++) {

                Row row = sheet.getRow(i);

                if (row == null) {
                    continue;
                }

                int studentId =
                        (int) row.getCell(0).getNumericCellValue();

                int batchId =
                        (int) row.getCell(1).getNumericCellValue();

                double totalAmount =
                        row.getCell(2).getNumericCellValue();

                double paidAmount =
                        row.getCell(3).getNumericCellValue();

                /*
                 * Excel stores the payment date as a date cell.
                 */
                Date paymentDate =
                        new Date(
                            row.getCell(4)
                               .getDateCellValue()
                               .getTime()
                        );

                String paymentMode =
                        row.getCell(5).getStringCellValue();

                ps.setInt(1, studentId);
                ps.setInt(2, batchId);
                ps.setDouble(3, totalAmount);
                ps.setDouble(4, paidAmount);
                ps.setDate(5, paymentDate);
                ps.setString(6, paymentMode);

                ps.executeUpdate();
            }
             
            System.out.println("inserted success fully");
            ps.close();
            con.close();

        } catch (Exception e) {

            System.out.println(
                "Error at FeeManagementDAO: " + e
            );

            e.printStackTrace();
        }
    }

    // Getting students who have paid full fees

    // Getting students who have dues
}