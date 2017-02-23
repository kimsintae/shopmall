package com.kst.shopmall.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kst.shopmall.vo.Cart;
import com.kst.shopmall.vo.Item;
import com.kst.shopmall.vo.ItemColor;
import com.kst.shopmall.vo.ItemImage;
import com.kst.shopmall.vo.ItemSize;
import com.kst.shopmall.vo.OrderClient;
import com.kst.shopmall.vo.OrderItem;
import com.kst.shopmall.vo.Reply;
import com.kst.shopmall.vo.User;
import com.kst.shopmall.vo.WishList;

public interface ShopDAO {

	//회원가입
	public int insertUser(User user);
	
	//ID중복체크
	public User selectOneId(String id);
	
	//로그인
	public User selectOne(User user);
	
	//메인 남성 배너 TOP 9
	public List<Item> selectTop9();
	
	//메인 여성 배너 TOP 9
	public List<Item> selectWTop9();
	
	//메인 아동 배너 TOP 9
	public List<Item> selectKTop9();
	
	//상품 디테일(이미지)
	public List<Item> selectAllImage(int no);
	
	//상품 디테일(이름,가격,메인이미지)
	public Item selectItem(int no);
	
	//상품 댓글 뿌리기
	public List<Reply> selectListReplies(int no);
	
	//상품 색상
	public List<ItemColor> selectColors(int no);
	
	//상품 사이즈
	public List<ItemSize> selectItemSize(int no);
	
	//상품 리스트(페이징)
	public List<Item> selectListType(Item item);
	
	//상품 총 갯수
	public int selectTotalItem(Item item);
	
	//상품 검색 리스트
	public List<Item> selectSearchItem(String name);
	
	//댓글 작성
	public int insertReply(Reply reply);
	
	//상품 평점
	public int selectAvgGrade(int no);
	
	//장바구니 담기
	public int insertCart(Cart cart);
	
	//장바구니 뿌리기
	public List<Cart> selectCart(int no);
	
	//장바구니 총합계/수량
	public Cart selectTotal(int userNo);
	
	//장바구니 수량 업데이트
	public int updateQuantity(Cart cart);
	
	//주문시 장바구니 삭제
	public int deleteCart(HashMap<String, List<Integer>> no);
	
	//위시리스트 담기
	public int insertWishList(WishList wishList);
	
	//위시리스트 뿌리기
	public List<WishList> selectListWish(int no);
	
	//위시리스트 중복
	public WishList selectOneWish(WishList wishList);
	
	//위시리스트 삭제
	public int deleteWish(HashMap<String, List<Integer>> checked);
	
	//주문할 상품 뿌리기
	public List<Cart> selectCheckedItem(HashMap<String, List<Integer>> checked);
	
	//주문 삽입
	public int insertOrderClient(OrderClient orderClient);
	
	//주문 삽입 (상품)
	public int insertOrderItem(HashMap<String, List> orderMap);
	
	//주문 조회
	public List<OrderItem> selectOrder(String orderCodeF);
	
}
