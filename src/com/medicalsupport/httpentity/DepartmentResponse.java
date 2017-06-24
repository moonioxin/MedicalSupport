package com.medicalsupport.httpentity;

import java.util.List;

import com.medicalsupport.httpentity.AdminResponseRow;

public class DepartmentResponse {
	private int page;
	private int total;
	private List<DepartmentResponseRow> rows;
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
	public List<DepartmentResponseRow> getRows() {
		return rows;
	}
	public void setRows(List<DepartmentResponseRow> rows) {
		this.rows = rows;
	}
}
