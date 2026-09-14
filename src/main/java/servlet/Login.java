package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.nio.file.attribute.UserDefinedFileAttributeView;

import Model.User;
import Service.LoginService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	LoginService loginService = new LoginService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		   rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String userId = request.getParameter("userId");
		  String password = request.getParameter("password");
		  
		  
		  User user = loginService.login(userId, password);
		  
		  if(user!=null) {
			  HttpSession session = request.getSession();
			  session.setAttribute("user", user);
			  
			  response.sendRedirect(request.getContextPath()+"/");
		  }
		  else {
			  request.setAttribute(
		                "error",
		                "Invalid username or password"
		            );

			  response.sendRedirect(request.getContextPath()+"/login");
		  }
		  
	}

}
