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
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		studentService studentService = new studentService();
		TeacherService teacherService = new TeacherService();
		BatchService   batchService  = new BatchService();
		AttendenceService attendenceService = new AttendenceService();
		
		 List<Student> activeStudents =   studentService.getAllActiveStudents();
		 List<Student> deactiveStudents =   studentService.getAllInActiveStudents();
		 List<Student> allStudents =   studentService.getAllStudents();
		 List<Teacher> teachers = teacherService.getAllTeacher();
		 List<Batch> batches = batchService.getAllBatch();
		 
		 Map<Integer,List<Attendence>> allBatchAttendences = new HashedMap<>();
		 
		 
		 //storing all the ACTIVE batch ID's
		 List<Integer> batchIds = new ArrayList<>();	
		 
		 for(var e:batches) {
			 if(e.getBStatus().equals("ACTIVE")) {
				 batchIds.add(e.getBId());
			 }
		 }
		 
		 //storing each and every batch Attendence in to the map
		 for(var e:batchIds) {
			 allBatchAttendences.put(e, attendenceService.getEntireBatchAttendences(e));
		 }
		 
		 //calculating avg attendence in all batches
		 double totalAvgAttendence = 0;
		 for(var e:allBatchAttendences.keySet()) {
			 totalAvgAttendence += attendenceParcentage(allBatchAttendences.getOrDefault(e, null));
		 }
		 
		 totalAvgAttendence = totalAvgAttendence/allBatchAttendences.size();
		 
         System.out.println(totalAvgAttendence);
		 
		 request.setAttribute("totalAvgAttendence", totalAvgAttendence);
		 request.setAttribute("activeStudents", activeStudents);
	     request.setAttribute("deactiveStudents", deactiveStudents);
	     request.setAttribute("allStudents", allStudents);
	     request.setAttribute("teachers", teachers);
	     request.setAttribute("batches", batches);
		 
		
		RequestDispatcher rd = request.getRequestDispatcher("/AdminDashBoard.jsp");
		rd.forward(request, response);
	}

	
	private double attendenceParcentage(List<Attendence> l) {
		
		if (l == null || l.isEmpty()) {
	        return 0.0;
	    }

		 double count=0;
		 for(var e: l) {
			 if(e.getStatus().equals("PRESENT"))count++;
		 }
		 double res = (count/(double)l.size()) * 100;
		 return res;
	}

}
