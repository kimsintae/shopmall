package com.kst.shopmall.vo;

public enum ClothType {

	//상품별 타입
	
	MT,
	MB,
	MO,
	WT,
	WB,
	WO,
	KT,
	KB,
	KO,
	M,
	W,
	K;

	private String ClothType,ClothType2;
	
	
	private ClothType() {
		// TODO Auto-generated constructor stub
	}

	public String getClothType() {
		return ClothType;
	}

	public void setClothType(String clothType) {
		ClothType = clothType;
	}

	public String getClothType2() {
		return ClothType2;
	}

	public void setClothType2(String CT2) {
		ClothType2 = CT2;
	}
	
	
	
	
	
	
}
