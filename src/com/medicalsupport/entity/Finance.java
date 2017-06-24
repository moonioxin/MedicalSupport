package com.medicalsupport.entity;

import java.math.BigDecimal;
import java.util.Date;

/**

 *   
 */
public class Finance {
    private Integer id;
    private String productName;
    private int needPoint;
    private BigDecimal needCash;
    private Integer total;
    private Integer totalExchangePoints;
    private BigDecimal totalExchangeAmount;
    private BigDecimal totalCash;
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
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getTotalExchangePoints() {
		return totalExchangePoints;
	}
	public void setTotalExchangePoints(Integer totalExchangePoints) {
		this.totalExchangePoints = totalExchangePoints;
	}
	public BigDecimal getTotalExchangeAmount() {
		return totalExchangeAmount;
	}
	public void setTotalExchangeAmount(BigDecimal totalExchangeAmount) {
		this.totalExchangeAmount = totalExchangeAmount;
	}
	public BigDecimal getTotalCash() {
		return totalCash;
	}
	public void setTotalCash(BigDecimal totalCash) {
		this.totalCash = totalCash;
	}
}
