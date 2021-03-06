package com.medicalsupport.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class PointExchange {
	private int ID;
	private String memberID;
	private String cardNo;
	private Integer productId;
	private String exchangeGift;
	private int exchangePoints;
	private BigDecimal exchangeAmount;
	private BigDecimal cash;
	private String note;
	private String creator;
	private Date createTime;
	private String createTimeString;
	private String deptID;
	private String companyID;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

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

	public String getExchangeGift() {
		return exchangeGift;
	}

	public void setExchangeGift(String exchangeGift) {
		this.exchangeGift = exchangeGift;
	}

	public int getExchangePoints() {
		return exchangePoints;
	}

	public void setExchangePoints(int exchangePoints) {
		this.exchangePoints = exchangePoints;
	}

	public BigDecimal getExchangeAmount() {
		return exchangeAmount;
	}

	public void setExchangeAmount(BigDecimal exchangeAmount) {
		this.exchangeAmount = exchangeAmount;
	}

	public BigDecimal getCash() {
		return cash;
	}

	public void setCash(BigDecimal cash) {
		this.cash = cash;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getCreateTimeString() {
		return createTimeString;
	}

	public void setCreateTimeString(String createTimeString) {
		this.createTimeString = createTimeString;
	}
}
