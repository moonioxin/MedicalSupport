package com.medicalsupport.mapper;

import java.util.List;
import java.util.Map;

import com.medicalsupport.entity.Department;
import com.medicalsupport.httpentity.DepartmentReqParam;


public interface DepartmentMapper {
    public Department getDepartmentInfo(Department department);
    
    public List<Department> listDepartment(DepartmentReqParam departmentReqParam);
    
    public int totalPageCount(DepartmentReqParam departmentReqParam);
    
    public int insertDepartment(Department department);
    
    public int updateDepartment(Department department);
    
    public Department getDepartmentByID(int id);
    
    public void deleteDepartments(String[] ids);
    
    public List<Map<String, Object>> getDepartmentList();
}
