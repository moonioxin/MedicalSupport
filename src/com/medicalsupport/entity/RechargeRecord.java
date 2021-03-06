package com.medicalsupport.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class RechargeRecord {
	private int id;
	private String memberID;
	private String cardNo;
	private BigDecimal rechargeAmount;
	private Integer changePoints;
	private BigDecimal conversionRatio;
	private String note;
	private String creator;
	private Date createTime;
	private String createTimeString;
	private String deptID;
	private String companyID;

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public Integer getChangePoints() {
		return changePoints;
	}

	public void setChangePoints(Integer changePoints) {
		this.changePoints = changePoints;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public String getCompanyID() {
		return companyID;
	}

	public void setCompanyID(String companyID) {
		this.companyID = companyID;
	}

	public String getDeptID() {
		return deptID;
	}

	public void setDeptID(String deptID) {
		this.deptID = deptID;
	}

	public BigDecimal getConversionRatio() {
		return conversionRatio;
	}

	public void setConversionRatio(BigDecimal conversionRatio) {
		this.conversionRatio = conversionRatio;
	}

	public BigDecimal getRechargeAmount() {
		return rechargeAmount;
	}

	public void setRechargeAmount(BigDecimal rechargeAmount) {
		this.rechargeAmount = rechargeAmount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCreateTimeString() {
		return createTimeString;
	}

	public void setCreateTimeString(String createTimeString) {
		this.createTimeString = createTimeString;
	}

}
