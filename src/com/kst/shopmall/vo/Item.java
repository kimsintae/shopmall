package com.kst.shopmall.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Item {

	private int no,grade;
	private String name, price, ClothType,ClothType2,image;
	@JsonIgnore private String detailType,detailType2,orderBy;
	@JsonIgnore private int start,end;
	
	public Item() {
		// TODO Auto-generated constructor stub
	}
	
	
	//마이바티스에서 처리하게 될 start와 end
	public Item(int pageNo, int numPage){
		this.end = pageNo*numPage;
		this.start = end - numPage+1;	
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
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

	public void setClothType2(String clothType2) {
		ClothType2 = clothType2;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	
	
	//상품 디테일 남자/여자


	public String getDetailType() {
		//System.out.println("vo 데이터 흐름 : "+ClothType2);
		
		if(ClothType2.equals("M")){
			
			detailType = "남자";
			
		}else if(ClothType2.equals("W")){
			detailType= "여자";
		}else{
			detailType= "아동";
		}
		
		return detailType;
	}

	public String getDetailType2() {
		if(ClothType.equals("MO") || ClothType.equals("WO") || ClothType.equals("KO") ){
			
			detailType2 = "OUTER";
			
		}else if(ClothType.equals("MB") || ClothType.equals("WB") || ClothType.equals("KB") ){
			detailType2= "BOTTOM";
		}else{
			detailType2= "TOP";
		}
		
		return detailType2;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
	
	
	
	
	
}
