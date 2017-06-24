package com.medicalsupport.httpentity;

import com.medicalsupport.entity.Department;

public class DepartmentResponseRow {
	private int id;
	private Department cell;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Department getCell() {
		return cell;
	}
	public void setCell(Department cell) {
		this.cell = cell;
	}
	public DepartmentResponseRow(int id,Department department) {
		this.id = id;
		this.cell = department;
	}
}
