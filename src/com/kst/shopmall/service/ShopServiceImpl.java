package com.kst.shopmall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.w3c.dom.stylesheets.LinkStyle;

import com.kst.shopmall.dao.ShopDAO;
import com.kst.shopmall.util.PaginateUtil;
import com.kst.shopmall.vo.Cart;
import com.kst.shopmall.vo.Item;
import com.kst.shopmall.vo.ItemColor;
import com.kst.shopmall.vo.ItemSize;
import com.kst.shopmall.vo.OrderClient;
import com.kst.shopmall.vo.OrderItem;
import com.kst.shopmall.vo.Reply;
import com.kst.shopmall.vo.User;
import com.kst.shopmall.vo.WishList;


public class ShopServiceImpl implements ShopService {

	
	private PaginateUtil paginateUtil;
	private ShopDAO shopDAO;

	
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}

	public void setShopDAO(ShopDAO shopDAO) {
		this.shopDAO = shopDAO;
	}
	
	//회원가입
	@Override
	public int insertNewUser(User user){
		return shopDAO.insertUser(user);
	}
	
	//ID중복 체크
	@Override
	public User doIdCheck(String id){
		return shopDAO.selectOneId(id);
	}
	
	//로그인
	@Override
	public User login(User user){
		return shopDAO.selectOne(user);
	}
	
	//메인 남성 베너 TOP 9
	@Override
	public List<Item> getMainItemTop9(){
		return shopDAO.selectTop9();
	}
	
	//메인 여성 베너 TOP 9
	@Override
	public List<Item> getWomenItemTop9(){
		return shopDAO.selectWTop9();
	}
		
	//메인 아동 베너 TOP 9
	@Override
	public List<Item> getKidsItemTop9(){
		return shopDAO.selectKTop9();
	}
	
	//상품 디테일(이미지)
	@Override
	public List<Item> getItemImage(int no){
		return shopDAO.selectAllImage(no);
	}
	
	//상품 디테일(이름, 가격, 메인이미지)
	@Override
	public Item getItemInfo(int no){
		return shopDAO.selectItem(no);
	}
	
	//상품별 댓글 뿌리기
	@Override
	public List<Reply> getReplies(int no){
		return shopDAO.selectListReplies(no);
	}
	
	//상품 색상
	@Override
	public List<ItemColor> getColors(int no){
		return shopDAO.selectColors(no);
	}
	
	//상품 사이즈
	@Override
	public List<ItemSize> getSize(int no){
		return shopDAO.selectItemSize(no);
	}

	//상품 리스트(페이징)
	@Override
	public Map<String, Object> getItemListOneType(int pageNo,String clothType2,String orderBy){

		//한 페이지에 보여질 게시물 수
		//@requestParam으로 받아온 값 numPage
		int numPage = 6;
		
		// 보여질 블럭 갯수
		int numBlock = 5;
		
		System.out.println("페이지단 orderBy : " + orderBy);
		
		//item vo내에 pageNo와 numPage를 
		//@requestParam으로 받아온 값을
		//생성자 호출해서 초기화
		//쿼리값 M을 셋팅
		Item item = new Item(pageNo, numPage);
		item.setClothType2(clothType2);
		item.setOrderBy(orderBy);
		//총 게시물 수 얻어옴
		int total = shopDAO.selectTotalItem(item);
		
		//System.out.println("service내 pageNo : "+ pageNo);
		//System.out.println("service내 total : "+total);
		//System.out.println("service내 clothType : "+clothType2);
		//뷰페이지에서 넘어오는 데이터를 다시 컨트롤러로 통해서 서비스로 오게되고 
		//이곳에서 set으로 데이터를 넣어준다.
		
		
		//dao로 db접근
		List<Item> list = shopDAO.selectListType(item);
		
		//System.out.println("뿌려질 페이징 상품 갯수 : "+list.size());
	
		//페이지네이트 get메서드 호출
		
		
		String url = "/item_list/"+clothType2+"?pageNo=";
		
		
		//맵에 페이지네이트 담기
		Map<String, Object> dataMap = new ConcurrentHashMap<>();
		
		
		
		//여기서 오률..;;
		String paginate = paginateUtil.getOneTypePaginate(pageNo, total, numPage, numBlock, url,orderBy);
		dataMap.put("oneType", list);
		dataMap.put("paginate", paginate);

		//컨트롤러로 리턴시킴.
		return dataMap;

	}
	
	//상품 타입별 페이징
	@Override
	public Map<String, Object> getItemListTwoType(int pageNo,String clothType2,String clothType,String orderBy){

		//한 페이지에 보여질 게시물 수
		//@requestParam으로 받아온 값 numPage
		int numPage = 6;
		
		// 보여질 블럭 갯수
		int numBlock = 5;
		
		
		System.out.println("서비스단 : "+ orderBy);
		
		//item vo내에 pageNo와 numPage를 
		//@requestParam으로 받아온 값을
		//생성자 호출해서 초기화
		//쿼리값 M을 셋팅
		Item item = new Item(pageNo, numPage);
		item.setClothType(clothType);
		item.setClothType2(clothType2);
		item.setOrderBy(orderBy);
		
		//총 게시물 수 얻어옴
		int total = shopDAO.selectTotalItem(item);
		
		//System.out.println("service내 타입별 pageNo : "+ pageNo);
		//System.out.println("service내 타입별 total : "+total);
		//System.out.println("service내 타입별 clothType2 : "+clothType2);
		//System.out.println("service내 타입별 clothType : "+clothType);
		//뷰페이지에서 넘어오는 데이터를 다시 컨트롤러로 통해서 서비스로 오게되고 
		//이곳에서 set으로 데이터를 넣어준다.
		
		
		//dao로 db접근
		List<Item> list = shopDAO.selectListType(item);
		
		//System.out.println("뿌려질 타입별 페이징 상품 갯수 : "+list.size());
	
		//페이지네이트 get메서드 호출
		
		
		String url = "/item_list/"+clothType2+"/"+clothType+"?pageNo=";
		
		
		//맵에 페이지네이트 담기
		Map<String, Object> dataMap = new ConcurrentHashMap<>();
		
		
		String paginate = paginateUtil.getOneTypePaginate(pageNo, total, numPage, numBlock, url,orderBy);
		dataMap.put("twoType", list);
		dataMap.put("paginate2", paginate);

		//컨트롤러로 리턴시킴.
		return dataMap;

	}
	
	//상품 총 갯수
	@Override
	public int getTotalItems(Item item){
		return shopDAO.selectTotalItem(item);
	}
	//상품 검색 리스트
	@Override
	public List<Item> getSearchItemList(String name){
		return shopDAO.selectSearchItem(name);
	}
	
	//댓글 작성
	@Override
	public int insertReply(Reply reply){
		return shopDAO.insertReply(reply);
	}
	
	//상품 평점
	@Override
	public int getAvgGrade(int no){
		return shopDAO.selectAvgGrade(no);
	}
	
	//장바구니 담기
	@Override
	public int insertCart(Cart cart){
		return shopDAO.insertCart(cart);
	}
	
	//장바구니 뿌리기
	@Override
	public List<Cart> getCartList(int no){
		return shopDAO.selectCart(no);
	}
	
	//장바구니 총합계 / 수량
	@Override
	public Cart getCartTotal(int userNo){
		return shopDAO.selectTotal(userNo);
	}
	
	//장바구니 수량 업데이트
	@Override
	public int getUpdateQuantity(Cart cart){
		return shopDAO.updateQuantity(cart);
	}
	
	//주문시 장바구니 삭제
	@Override
	public int deleteCart(HashMap<String, List<Integer>> no){
		return shopDAO.deleteCart(no);
	}
	
	//위시리스트 담기
	@Override
	public int insertWishList(WishList wishList){
		return shopDAO.insertWishList(wishList);
	}
	
	//위시리스트 뿌리기
	@Override
	public List<WishList> getWishList(int no){
		return shopDAO.selectListWish(no);
	}
	
	//위시리스트 중복
	@Override
	public WishList checkDuplicationWish(WishList wishList){
		return shopDAO.selectOneWish(wishList);
	}
	
	//위시리스트 삭제
	@Override
	public int deleteWish(HashMap<String, List<Integer>> checked){
		return shopDAO.deleteWish(checked);
	}
	
	//주문할 상품 뿌리기
	@Override
	public List<Cart> getWillBuyItemList(HashMap<String, List<Integer>> checked){
		return shopDAO.selectCheckedItem(checked);
	}
	
	//주문 삽입
	@Override
	public int insertOrderClient(OrderClient orderClient){
		return shopDAO.insertOrderClient(orderClient);
	}
	
	//주문 삽입(상품)
	@Override
	public int insertOrderItem(HashMap<String, List> orderMap){
		return shopDAO.insertOrderItem(orderMap);
	}
	
	//주문 조회
	@Override
	public List<OrderItem> getOrderList(String orderCodeF){
		return shopDAO.selectOrder(orderCodeF);
	}

}
