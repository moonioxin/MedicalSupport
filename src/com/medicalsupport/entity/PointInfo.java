package com.medicalsupport.entity;

import java.math.BigDecimal;
import java.util.Date;
/**
 * 积分信息实体类
 * @author zyn
 *
 */
public class PointInfo {
	
	private String memberId;
    private String cardNo;
    private String name;
    private String idNumber;
    private int leftPoints;
    private BigDecimal leftAmount;
    private BigDecimal extraCash;
    //用于传递充值金额
    private BigDecimal rechargeAmount;
    private String creator;
    private Date createTime;
    public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public int getLeftPoints() {
		return leftPoints;
	}
	public void setLeftPoints(int leftPoints) {
		this.leftPoints = leftPoints;
	}
	public BigDecimal getLeftAmount() {
		return leftAmount;
	}
	public void setLeftAmount(BigDecimal leftAmount) {
		this.leftAmount = leftAmount;
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
	public BigDecimal getRechargeAmount() {
		return rechargeAmount;
	}
	public void setRechargeAmount(BigDecimal rechargeAmount) {
		this.rechargeAmount = rechargeAmount;
	}
	public BigDecimal getExtraCash() {
		return extraCash;
	}
	public void setExtraCash(BigDecimal extraCash) {
		this.extraCash = extraCash;
	}

}
