package com.medicalsupport.httpentity;

import com.medicalsupport.entity.Finance;
import com.medicalsupport.entity.Product;

public class FinanceResponseRow {
	private int id;
	private Finance cell;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Finance getCell() {
		return cell;
	}
	public void setCell(Finance cell) {
		this.cell = cell;
	}
	public FinanceResponseRow(int id,Finance finance) {
		this.id = id;
		this.cell = finance;
	}
}
