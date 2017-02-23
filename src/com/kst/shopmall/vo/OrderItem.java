package com.kst.shopmall.vo;

public class OrderItem {

	private int no,quantity;
	private String name,price,image,orderCodeF,orderState;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getOrderCodeF() {
		return orderCodeF;
	}
	public void setOrderCodeF(String orderCodeF) {
		this.orderCodeF = orderCodeF;
	}
	public String getOrderState() {
		
		if(orderState.equals('F')){
			orderState = "배송 준비중";
		}else if(orderState.equals('D')){
			orderState="배송중";
		}else if(orderState.equals('C')){
			orderState="주문 취소";
		}else{
			orderState="배송 준비중";
		}
		
		
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	
	
	
	
}
