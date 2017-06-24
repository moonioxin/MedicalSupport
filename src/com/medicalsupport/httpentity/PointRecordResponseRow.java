package com.medicalsupport.httpentity;

import com.medicalsupport.entity.Department;
import com.medicalsupport.entity.PointInfo;
import com.medicalsupport.entity.PointRecord;

public class PointRecordResponseRow {
	private int id;
	private PointRecord cell;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public PointRecordResponseRow(int id,PointRecord pointRecord) {
		this.id = id;
		this.setCell(pointRecord);
	}
	public PointRecord getCell() {
		return cell;
	}
	public void setCell(PointRecord cell) {
		this.cell = cell;
	}

	
}
