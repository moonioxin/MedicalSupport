package com.medicalsupport.httpentity;

import java.util.List;

import com.medicalsupport.httpentity.AdminResponseRow;

public class AdminResponse {
	private int page;
	private int total;
	private List<AdminResponseRow> rows;
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
	public List<AdminResponseRow> getRows() {
		return rows;
	}
	public void setRows(List<AdminResponseRow> rows) {
		this.rows = rows;
	}
}
