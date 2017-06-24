package com.medicalsupport.httpentity;

import com.medicalsupport.entity.Admin;

public class AdminResponseRow {
	private int id;
	private Admin cell;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Admin getCell() {
		return cell;
	}
	public void setCell(Admin cell) {
		this.cell = cell;
	}
	public AdminResponseRow(int id,Admin admin) {
		this.id = id;
		this.cell = admin;
	}
}
