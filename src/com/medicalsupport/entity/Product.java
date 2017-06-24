package com.medicalsupport.entity;

import java.math.BigDecimal;
import java.util.Date;

/**

 *   
 */
public class Product {
    private Integer id;
    private String productName;
    private String department;
    private String departmentName;
    private int needPoint;
    private BigDecimal needCash;
    private String creator;  
    private Date createTime;
    private String createTimeString;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getNeedPoint() {
		return needPoint;
	}
	public void setNeedPoint(int needPoint) {
		this.needPoint = needPoint;
	}
	public BigDecimal getNeedCash() {
		return needCash;
	}
	public void setNeedCash(BigDecimal needCash) {
		this.needCash = needCash;
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
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getCreateTimeString() {
		return createTimeString;
	}
	public void setCreateTimeString(String createTimeString) {
		this.createTimeString = createTimeString;
	}
}
