package com.kst.shopmall.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Reply {

	private int no,userNo,itemNo,grade;
	private String content,nickName;
	private Timestamp regdate;
	private String realTime;
	private int replyNo;
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getGrade() {	
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getRealTime() {
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		String realTime =  sd.format(regdate);
		
		//System.out.println("vo날짜 데이터 : "+realTime);
		
		
		return realTime;
	}

	public int getReplyNo() {
		return replyNo;
	}

}
