package com.medicalsupport.httpentity;

import com.medicalsupport.entity.PointExchange;

public class PointExchangeResponseRow {
	private int id;
	private PointExchange cell;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public PointExchange getCell() {
		return cell;
	}
	public void setCell(PointExchange cell) {
		this.cell = cell;
	}
	public PointExchangeResponseRow(int id,PointExchange pointExchange) {
		this.id = id;
		this.cell = pointExchange;
	}
}
