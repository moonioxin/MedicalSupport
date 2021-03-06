package com.medicalsupport.entity;

import java.util.Date;

/**

 *   
 */
public class Department {
    private Integer id;
    private String departmentName;
    private String departmentCategory;
    private String note;
    private int deployment;
    private String creator;
    private Date createTime;
    private String createTimeString;
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getDepartmentCategory() {
		return departmentCategory;
	}
	public void setDepartmentCategory(String departmentCategory) {
		this.departmentCategory = departmentCategory;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getDeployment() {
		return deployment;
	}
	public void setDeployment(int deployment) {
		this.deployment = deployment;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getCreateTimeString() {
		return createTimeString;
	}
	public void setCreateTimeString(String createTimeString) {
		this.createTimeString = createTimeString;
	}
    
    
}
