package com.medicalsupport.httpentity;

import com.medicalsupport.entity.Member;

public class MemberResponseRow {
	private int id;
	private Member cell;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Member getCell() {
		return cell;
	}
	public void setCell(Member cell) {
		this.cell = cell;
	}
	public MemberResponseRow(int id,Member member) {
		this.id = id;
		this.cell = member;
	}
}
