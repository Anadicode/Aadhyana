package Service;

import java.util.List;

import DAO.BatchDAO;
import Model.Batch;
import Model.Student;

public class BatchService {
	 private BatchDAO batchDAO = new BatchDAO();
	 
	 public List<Batch> getAllBatch(){
		   return batchDAO.getAllBatch();
	   }
	 
	 public List<Student> getAllStudentInaBatch(int id){
		   return batchDAO.getAllStudentInaBatch(id);
	   }
	 
	 public void deleteBatch(int id) {
		 batchDAO.deleteBatchById(id);
	 }
	 
	 public void changeStatus(int id) {
		 batchDAO.changeStatus(id);
	 }
	 
	 public void addABatch(Batch batch) {
		 batchDAO.addBatch(batch);
	 }
}
