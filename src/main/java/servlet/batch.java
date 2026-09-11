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

import Model.Batch;
import Model.Student;
import Service.BatchService;




@WebServlet("/batch/*")
public class batch extends HttpServlet {
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pathString = request.getPathInfo();
		
		if(pathString == null || pathString.equals("/batch")) {
			
		    List<Batch> batchs = new ArrayList<>();
		    BatchService batch1 = new BatchService();
		
		    batchs = batch1.getAllBatch();
		
//		for(var e : batchs) {
//			System.out.println(e.getBName());
//		}
//		
		    request.setAttribute("batchs", batchs);
		
		    RequestDispatcher rd = request.getRequestDispatcher("/batch.jsp");
		    rd.forward(request, response);
		}
		else if(pathString.equals("/ragister")) {
			
		    
			RequestDispatcher rd = request.getRequestDispatcher("/batchRagistration.jsp");
			rd.forward(request, response);
		}
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		    String pathString = request.getPathInfo();
		    
		    if(pathString == null || pathString.equals("/batch")) {
		    
		         int id = Integer.parseInt(request.getParameter("change"));
		    
		         BatchService batchService = new BatchService();
		    
		         batchService.changeStatus(id);
		    
		         // System.out.println("yoo"+id);
		          response.sendRedirect(request.getContextPath()+"/batch");
		  
		  }else if(pathString.equals("/ragister")) {
			  
			  
			  Batch  batch = new Batch();
			  
			  int bId= Integer.parseInt(request.getParameter("bId"));
			  String bName = request.getParameter("bName");
			  Date bStartDate = Date.valueOf(request.getParameter("bStartDate"));
			  int tId=Integer.parseInt(request.getParameter("tId"));
			  String bStatus = request.getParameter("bStatus");
			  
			  batch.setBId(bId);
			  batch.setBName(bName);
			  batch.setBStartDate(bStartDate);
			  batch.setTId(tId);
			  batch.setBStatus(bStatus);
			  
			  BatchService batchService = new BatchService();
			  batchService.addABatch(batch);
			  
			  System.out.println("raegister");
			  
			  response.sendRedirect(request.getContextPath()+"/batch");
			  
		  }else if(pathString.equals("/batchStudent")) {
			    
			     int id = Integer.parseInt(request.getParameter("batchId"));
			     //System.out.println(id);
			     BatchService batchService = new BatchService();
			     List<Student> students = batchService.getAllStudentInaBatch(id);
			    
			     for(var e:students) {
			    	   System.out.println(e.getB_id()+" "+e.getName());
			     }
			     
			     request.setAttribute("students", students);
					
				 RequestDispatcher rd = request.getRequestDispatcher("/StudentInBatch.jsp");
				 rd.forward(request, response);
		  }
	
		   
		  
	 }  
	
	}
	


	


