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

import com.medicalsupport.entity.Admin;
import com.medicalsupport.httpentity.AdminReqParam;
import com.medicalsupport.service.AdminService;
import com.medicalsupport.mapper.AdminMapper;
import com.medicalsupport.httpentity.AdminReqParam;

import jxl.CellType;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
    private AdminMapper adminMapper;
	
    public Admin getAdminByNameAndPwd(String username,String password)
    {
    	Admin admin = new Admin();
    	admin.setAdminName(username);
    	admin.setPassword(password);
    	admin=(Admin)adminMapper.getAdminInfo(admin);
    	return admin;
    }
    
    public List<Admin> listAdmin(AdminReqParam adminReqParam)
    {
    	return adminMapper.listAdmin(adminReqParam);
    }
    
    public int totalPageCount(AdminReqParam adminReqParam)
    {
    	return adminMapper.totalPageCount(adminReqParam);
    }
    
    public boolean insertAdmin(Admin admin)
    {
        int count = adminMapper.insertAdmin(admin);
		
		if(count == 1){
			return true;
		}else{
			return false;
		}
    }

	public boolean updateAdmin(Admin admin)
	{
		int count = adminMapper.updateAdmin(admin);
		if(count == 1)
		{
			return true;
		}
		else{
			return false;
		}
	}
    
	public Admin getAdminByID(int id)
	{
		return adminMapper.getAdminByID(id);
	}
	
	public void deleteAdmins(String[] allId)
	{
		adminMapper.deleteAdmins(allId);
	}
}
