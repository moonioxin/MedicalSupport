package com.medicalsupport.httpentity;

import com.medicalsupport.entity.Department;
import com.medicalsupport.entity.PointInfo;

public class PointInfoResponseRow {
	private int id;
	private PointInfo cell;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public PointInfoResponseRow(int id,PointInfo pointInfo) {
		this.id = id;
		this.setCell(pointInfo);
	}
	public PointInfo getCell() {
		return cell;
	}
	public void setCell(PointInfo cell) {
		this.cell = cell;
	}
}
