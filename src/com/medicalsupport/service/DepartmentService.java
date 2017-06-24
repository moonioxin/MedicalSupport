package com.medicalsupport.service;

import java.util.List;
import java.util.Map;

import com.medicalsupport.entity.Department;
import com.medicalsupport.httpentity.DepartmentReqParam;

public interface DepartmentService {
	
    List<Department> listDepartment(DepartmentReqParam departmentReqParam);
    
    int totalPageCount(DepartmentReqParam departmentReqParam);
    
    boolean insertDepartment(Department department);

	boolean updateDepartment(Department department);
	
	Department getDepartmentByID(int id);
	
	void deleteDepartments(String[] allId);
	
	List<Map<String, Object>> getDepartmentList();
}
