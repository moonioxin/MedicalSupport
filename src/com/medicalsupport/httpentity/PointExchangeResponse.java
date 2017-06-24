package com.medicalsupport.httpentity;

import java.util.List;


public class PointExchangeResponse {
	private int page;
	private int total;
	private List<PointExchangeResponseRow> rows;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<PointExchangeResponseRow> getRows() {
		return rows;
	}
	public void setRows(List<PointExchangeResponseRow> rows) {
		this.rows = rows;
	}
	
}
