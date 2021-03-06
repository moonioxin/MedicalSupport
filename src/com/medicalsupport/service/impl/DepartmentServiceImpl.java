package com.medicalsupport.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicalsupport.entity.Department;
import com.medicalsupport.httpentity.DepartmentReqParam;
import com.medicalsupport.service.DepartmentService;
import com.medicalsupport.service.DepartmentService;
import com.medicalsupport.mapper.DepartmentMapper;
import com.medicalsupport.httpentity.DepartmentReqParam;

import jxl.CellType;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
    private DepartmentMapper departmentMapper;
    
    public List<Department> listDepartment(DepartmentReqParam DepartmentReqParam)
    {
    	return departmentMapper.listDepartment(DepartmentReqParam);
    }
    
    public int totalPageCount(DepartmentReqParam DepartmentReqParam)
    {
    	return departmentMapper.totalPageCount(DepartmentReqParam);
    }
    
    public boolean insertDepartment(Department Department)
    {
        int count = departmentMapper.insertDepartment(Department);
		
		if(count == 1){
			return true;
		}else{
			return false;
		}
    }

	public boolean updateDepartment(Department Department)
	{
		int count = departmentMapper.updateDepartment(Department);
		if(count == 1)
		{
			return true;
		}
		else{
			return false;
		}
	}
    
	public Department getDepartmentByID(int id)
	{
		return departmentMapper.getDepartmentByID(id);
	}
	
	public void deleteDepartments(String[] allId)
	{
		departmentMapper.deleteDepartments(allId);
	}
	
	public List<Map<String, Object>> getDepartmentList() {
		// TODO Auto-generated method stub
		return departmentMapper.getDepartmentList();
	}
}
