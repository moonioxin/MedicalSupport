package com.medicalsupport.entity;
/**

 *   
 */
public class Admin {
    private Integer AdminID;
    private String AdminName;
    private String Password;
    private int Purview;
    private int adminType;
    private String adminTypeName;  //adimnType����˵�� 1.��������Ա 2.Ա������Ա
    private int departmentId;
    private String departmentName;

	public String getAdminName() {
		return AdminName;
	}

	public void setAdminName(String adminName) {
		AdminName = adminName;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public int getPurview() {
		return Purview;
	}

	public void setPurview(int purview) {
		Purview = purview;
	}

	public Integer getAdminID() {
		return AdminID;
	}

	public void setAdminID(Integer adminID) {
		AdminID = adminID;
	}

	public int getAdminType() {
		return adminType;
	}

	public void setAdminType(int adminType) {
		this.adminType = adminType;
	}

	public String getAdminTypeName() {
		return adminTypeName;
	}

	public void setAdminTypeName(String adminTypeName) {
		this.adminTypeName = adminTypeName;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

}
