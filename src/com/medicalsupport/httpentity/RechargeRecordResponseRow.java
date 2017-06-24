package com.medicalsupport.httpentity;

import com.medicalsupport.entity.PointExchange;
import com.medicalsupport.entity.RechargeRecord;

public class RechargeRecordResponseRow {
	private int id;
	private RechargeRecord cell;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public RechargeRecord getCell() {
		return cell;
	}
	public void setCell(RechargeRecord cell) {
		this.cell = cell;
	}
	public RechargeRecordResponseRow(int id,RechargeRecord rechargeRecord) {
		this.id = id;
		this.cell = rechargeRecord;
	}
}
