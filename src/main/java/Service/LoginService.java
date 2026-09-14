package Service;

import DAO.LoginDAO;
import Model.User;

public class LoginService {
	LoginDAO loginDAO = new LoginDAO();
	
    public User login(String userId,String password) {
    	return loginDAO.isLogin(userId, password);
    }
    
    
}
