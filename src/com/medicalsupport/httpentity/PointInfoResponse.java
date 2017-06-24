package com.medicalsupport.httpentity;

import java.util.List;


public class PointInfoResponse {
	private int page;
	private int total;
	private List<PointInfoResponseRow> rows;
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
	public List<PointInfoResponseRow> getRows() {
		return rows;
	}
	public void setRows(List<PointInfoResponseRow> rows) {
		this.rows = rows;
	}
	
}
