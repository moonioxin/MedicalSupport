package com.medicalsupport.service;

import java.util.List;
import java.util.Map;

import com.medicalsupport.entity.Admin;
import com.medicalsupport.httpentity.AdminReqParam;

public interface AdminService {
    Admin getAdminByNameAndPwd(String username,String password);
    
    List<Admin> listAdmin(AdminReqParam adminReqParam);
    
    int totalPageCount(AdminReqParam adminReqParam);
    
    boolean insertAdmin(Admin admin);

	boolean updateAdmin(Admin admin);
	
	Admin getAdminByID(int id);
	
	void deleteAdmins(String[] allId);
}
