package com.kst.shopmall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.ast.WhileStatement;

import com.kst.shopmall.vo.Cart;
import com.kst.shopmall.vo.Item;
import com.kst.shopmall.vo.ItemColor;
import com.kst.shopmall.vo.ItemSize;
import com.kst.shopmall.vo.OrderClient;
import com.kst.shopmall.vo.OrderItem;
import com.kst.shopmall.vo.Reply;
import com.kst.shopmall.vo.User;
import com.kst.shopmall.vo.WishList;

public interface ShopService {

	//회원가입
	public int insertNewUser(User user);
	
	//ID중복체크
	public User doIdCheck(String id);
	
	//로그인
	public User login(User user);
	
	//메인 남성 베너 TOP 9
	public List<Item> getMainItemTop9();
	
	//메인 여성 베너 TOP 9
	public List<Item> getWomenItemTop9();
		
	//메인 아동 베너 TOP 9
	public List<Item> getKidsItemTop9();
	
	//상품 디테일(이미지)
	public List<Item> getItemImage(int no);
	
	//상품 디테일(이름, 가격, 메인이미지)
	public Item getItemInfo(int no);
	
	//상품별 댓글 뿌리기
	public List<Reply> getReplies(int no);
	
	//상품 색상
	public List<ItemColor> getColors(int no);
	
	//상품 사이즈
	public List<ItemSize> getSize(int no);

	//상품 리스트(남/여/아동 별 페이징)
	public Map<String, Object> getItemListOneType(int pageNo,String clothType2,String orderBy);
	
	//상품 리스트(타입별 페이징)
	public Map<String, Object> getItemListTwoType(int pageNo,String clothType2,String clothType,String orderBy);
	
	//상품 총 갯수
	public int getTotalItems(Item item);
	
	//상품 검색 리스트
	public List<Item> getSearchItemList(String name);
	
	//댓글 작성
	public int insertReply(Reply reply);
	
	//상품 평점
	public int getAvgGrade(int no);
	
	//장바구니 담기
	public int insertCart(Cart cart);
	
	//장바구니 뿌리기
	public List<Cart> getCartList(int no);
	
	//장바구니 총합계 / 수량
	public Cart getCartTotal(int userNo);
	
	//장바구니 수량 업데이트
	public int getUpdateQuantity(Cart cart);
	
	//주문시 장바구니 삭제
	public int deleteCart(HashMap<String, List<Integer>> no);
	
	//위시리스트 담기
	public int insertWishList(WishList wishList);
	
	//위시리스트 뿌리기
	public List<WishList> getWishList(int no);
	
	//위시리스트 중복
	public WishList checkDuplicationWish(WishList wishList);
	
	//위시리스트 삭제
	public int deleteWish(HashMap<String, List<Integer>> checked);
	
	//주문할 상품 뿌리기
	public List<Cart> getWillBuyItemList(HashMap<String, List<Integer>> checked);
	
	//주문 삽입
	public int insertOrderClient(OrderClient orderClient);
	
	//주문 삽입(상품)
	public int insertOrderItem(HashMap<String, List> orderMap);
	
	//주문 조회
	public List<OrderItem> getOrderList(String orderCodeF);
}
