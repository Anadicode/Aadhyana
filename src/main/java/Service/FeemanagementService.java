package Service;

import org.apache.poi.ss.usermodel.Sheet;

import DAO.FeeManagementDAO;

public class FeemanagementService {

    private FeeManagementDAO fs = new FeeManagementDAO();

    public void insertFees(Sheet sheet) {

        fs.insertFees(sheet);

    }
}