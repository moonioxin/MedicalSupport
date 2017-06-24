package com.medicalsupport.httpentity;

import java.util.List;


public class PointRecordResponse {
	private int page;
	private int total;
	private List<PointRecordResponseRow> rows;
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
	public List<PointRecordResponseRow> getRows() {
		return rows;
	}
	public void setRows(List<PointRecordResponseRow> rows) {
		this.rows = rows;
	}
	
	
}
