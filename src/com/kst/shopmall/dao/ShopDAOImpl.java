package com.kst.shopmall.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

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

public class ShopDAOImpl implements ShopDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//회원가입
	@Override
	public int insertUser(User user){
							//namespace.id      , 매개변수
		return session.insert("users.insertUser",user);
	}
	
	//ID중복 체크
	@Override
	public User selectOneId(String id){
		return session.selectOne("users.selectOneId",id);
	}
	
	//로그인
	@Override
	public User selectOne(User user){
		return session.selectOne("users.selectOne",user);
	}
	
	//메인 남성 배너 TOP 9
	@Override
	public List<Item> selectTop9(){
		return session.selectList("items.selectTop9");
	}
	
	//메인 여성 배너 TOP 9
	@Override
	public List<Item> selectWTop9(){
		return session.selectList("items.selectWTop9");
	}
	
	//메인 아동 배너 TOP 9
	@Override
	public List<Item> selectKTop9(){
		return session.selectList("items.selectKTop9");
	}
	
	//상품 디테일(이미지)
	@Override
	public List<Item> selectAllImage(int no){
		return session.selectList("items.selectAllImage",no);
	}
	
	//상품 디테일(이름, 가격, 메인이미지)
	@Override
	public Item selectItem(int no){
		return session.selectOne("items.selectItem",no);
	}
	
	//상품별 댓글 리스트
	@Override
	public List<Reply> selectListReplies(int no){
		return session.selectList("replies.selectListReplies",no);
	}
	
	//상품 색상
	@Override
	public List<ItemColor> selectColors(int no){
		return session.selectList("itemColors.selectColors",no);
	}
	
	//상품 사이즈
	@Override
	public List<ItemSize> selectItemSize(int no){
		return session.selectList("itemSize.selectItemSize",no);
	}
	
	//상품 리스트(페이징)
	@Override
	public List<Item> selectListType(Item item){
		return session.selectList("items.selectListType",item);
	}
	
	//상품 총 갯수
	@Override
	public int selectTotalItem(Item item){
		return session.selectOne("items.selectTotalItem",item);
	}
	
	//상품 검색 리스트
	@Override
	public List<Item> selectSearchItem(String name){
		return session.selectList("items.selectSearchItem",name);
	}
	
	//댓글 작성
	@Override
	public int insertReply(Reply reply){
		return session.insert("replies.insertReply",reply);
	}
	
	//상품 평점
	@Override
	public int selectAvgGrade(int no){
		return session.selectOne("replies.selectAvgGrade",no);
	}
	
	//장바구니 담기
	@Override
	public int insertCart(Cart cart){
		return session.insert("cart.insertCart",cart);
	}
	
	//장바구니 뿌리기
	@Override
	public List<Cart> selectCart(int no){
		return session.selectList("cart.selectCart",no);
	}
	
	//장바구니 총합계 / 수량
	@Override
	public Cart selectTotal(int userNo){
		return session.selectOne("cart.selectTotal",userNo);
	}
	
	//장바구니 수량 업데이트
	@Override
	public int updateQuantity(Cart cart){
		return session.update("cart.updateQuantity",cart);
	}
	
	//주문시 장바구니 삭제
	@Override
	public int deleteCart(HashMap<String, List<Integer>> no){
		return session.delete("cart.deleteCart",no);
	}
	
	//위시리스트 담기
	@Override
	public int insertWishList(WishList wishList){
		return session.insert("wishlists.insertWishList",wishList);
	}
	
	//위시리스트 뿌리기
	@Override
	public List<WishList> selectListWish(int no){
		return session.selectList("wishlists.selectListWish",no);
	}
	
	//위시리스트 중복
	@Override
	public WishList selectOneWish(WishList wishList){
		return session.selectOne("wishlists.selectOneWish",wishList);
	}
	
	//위시리스트 삭제
	@Override
	public int deleteWish(HashMap<String, List<Integer>> checked){
		return session.delete("wishlists.deleteWish",checked);
	}
	
	//주문할 상품 뿌리기
	@Override
	public List<Cart> selectCheckedItem(HashMap<String, List<Integer>> checked){
		return session.selectList("cart.selectCheckedItem",checked);
	}
	
	//주문 삽입
	@Override
	public int insertOrderClient(OrderClient orderClient){
		return session.insert("orderClients.insertOrderClient",orderClient);
		
	}
	
	//주문 삽입(상품)
	@Override
	public int insertOrderItem(HashMap<String, List> orderMap){
		
		System.out.println(orderMap.get("list").size());
		return session.insert("orderItems.insertOrderItem",orderMap);
	}
	
	//주문 조회
	@Override
	public List<OrderItem> selectOrder(String orderCodeF){
		return session.selectList("orderItems.selectOrder",orderCodeF);
	}
}


