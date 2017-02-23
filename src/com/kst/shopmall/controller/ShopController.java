package com.kst.shopmall.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;
import javax.swing.plaf.synth.SynthSpinnerUI;
import javax.websocket.server.PathParam;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;
import com.kst.shopmall.service.ShopService;
import com.kst.shopmall.vo.Cart;
import com.kst.shopmall.vo.ClothType;
import com.kst.shopmall.vo.Item;
import com.kst.shopmall.vo.ItemColor;
import com.kst.shopmall.vo.ItemSize;
import com.kst.shopmall.vo.Order;
import com.kst.shopmall.vo.OrderClient;
import com.kst.shopmall.vo.OrderItem;
import com.kst.shopmall.vo.Reply;
import com.kst.shopmall.vo.User;
import com.kst.shopmall.vo.WishList;

@Controller
public class ShopController {

	
	//서비스 주입
	private ShopService shopService;
	
	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}	

	
	
	@RequestMapping("/main")
	public void main(Model model){
		//남성 아이템
		List<Item> items = shopService.getMainItemTop9();
		
		//여성 아이템
		List<Item> WomenItem = shopService.getWomenItemTop9();
		
		//아동 아이템
		List<Item> KidsItem = shopService.getKidsItemTop9();
		
		model.addAttribute("top9list", items);
		model.addAttribute("women", WomenItem);
		model.addAttribute("kids", KidsItem);
		//System.out.println("main()컨트롤러 작동 : 이곳은 main!!");
		System.out.println("============================");
	}
	
	
	//=======================join============================
	
	@RequestMapping("/join")
	public void join(){
		//System.out.println("join()컨트롤러 작동 : 이곳은 join!!");
		System.out.println("============================");
	}
	
	@RequestMapping(value="/dojoin",method = RequestMethod.POST)
	public String dojoin(User user,RedirectAttributes ra){
		
		int result = shopService.insertNewUser(user);
		
		//회원가입 실패시 빈 메세지로 보냄
		if(result == 0){
			ra.addFlashAttribute("joinMsg", "서버에 오류가 발생하였습니다.");
		}
		
		ra.addFlashAttribute("joinMsg", "회원가입이 완료되었습니다.");
		
		System.out.println("회원가입 완료");
		System.out.println("============================");

		return "redirect:main";
	}
	
	
	//아이디 중복 체크
	@RequestMapping("/idCheck")
	public @ResponseBody User idCheck(@RequestParam String id){
		
		System.out.println("ajax에서 넘어온 값 : "+id);
		
		User user  = shopService.doIdCheck(id);
		
		System.out.println("DB값 : "+user);
		
		return user;
	}
	
	//============================================상품 상세페이지===========//
	@RequestMapping(value="/item_detail/{no}")
	public String item_detail(Item item,
							  Model model,
							  RedirectAttributes ra, User user){
		//상품 번호 얻기
		int no = item.getNo();

		
		//===================상품 확대이미지 사진 가져오기===================
		//System.out.println("아이템 번호 : "+no);
		//select로 뽑아온 이미지들 리스트에 담기
		List<Item> images = shopService.getItemImage(no);
		
		//모델에 리스트 담아 넘기기
		model.addAttribute("images", images);
		//System.out.println("받아온 이미지 수 : "+images.size());
		//System.out.println("============================");
		
		//====================상품 이름,가격,메인 이미지 가져오기=============
		Item itemInfo = shopService.getItemInfo(no);
		
		//System.out.println("받아온 상품정보(이름,가격,메인사진) : "+itemInfo);
		//System.out.println(itemInfo.getClothType());
		//System.out.println(itemInfo.getClothType2());
		//이름 가격 메인이미지 모델로 넘기기
		model.addAttribute("itemInfo", itemInfo);
		//System.out.println("============================");
		
		//====================상품 이름,가격,메인 이미지 가져오기=============
		
		//받아온 댓글들 reply에 담기
		List<Reply> reply = shopService.getReplies(no);
		model.addAttribute("replies", reply);
		//System.out.println("댓글 수 : "+reply.size());
		
		//====================상품 색상 가져오기=============
		
		List<ItemColor> ic = shopService.getColors(no);
		//System.out.println("색상 수 : "+ic.size());
/*		for(int i=0 ; i <= ic.size() ; i++){
			System.out.println(ic.get(i));
		}*/
		model.addAttribute("itemColors", ic);
		
		//====================상품 사이즈 가져오기=============
		
		List<ItemSize> is = shopService.getSize(no);
		//System.out.println("사이즈 수 : "+is.size());
		
		model.addAttribute("itemSize", is);
		
		//====================상품 평점 가져오기=============
		
		try {
			//댓글이 0 일때 null이 떨어짐
			int grade = shopService.getAvgGrade(no);
			System.out.println("평점 "+grade);
			model.addAttribute("avgGrade", grade);
		} catch (Exception e) {
			System.out.println("nullpoint 잡기");
			//나누기 에러 보내기
			model.addAttribute("nullPoint", "nullPoint");	
		}
		
		
		/*		System.out.println("item_detail()컨트롤러 작동 : 이곳은 item_detail!!");*/
		return "item_detail";
	}
	
	//=========================상품 검색 리스트json=====================================

	@RequestMapping("/searchItemList")
	public @ResponseBody List<Item> searchItemList(@RequestParam String name){
		
		//AJAX로 넘어온 검색어
		System.out.println(name);
		
		List<Item> items = shopService.getSearchItemList(name);
		
		
		System.out.println("검색 리스트"+items.size());
		
		return items;
	}
	
	//=========================로그인=====================================
	
	@RequestMapping("/login")
	public void login(@RequestHeader String referer,HttpSession session){
		System.out.println("login()컨트롤러 작동 : 이곳은 login!!");
		System.out.println("============================");
	
		String prePage = referer;	
		
		//System.out.println("prePage : "+prePage);
		
		//로그인 시 되돌아갈 페이지의 주소를 저장
		session.setAttribute("prePage",prePage );
	}
	
	@RequestMapping(value="/session",method=RequestMethod.POST)
	public String loginUser(HttpSession session,
							User user,
							RedirectAttributes ra,
							@RequestHeader String referer){
		
		//System.out.println(user.getId());
		//System.out.println(user.getPassword());
		//System.out.println("이전 페이지 주소 : "+session.getAttribute("prePageUrl"));
		//DB에서 로그인 유저 정보 꺼내옴
		User loginUser = shopService.login(user);
		
		//이전 페이지의 url을 얻어옴
		String prePage = (String)session.getAttribute("prePage");
		
		//System.out.println("세션에서 받은 prePage URL : "+prePage);
		
		
		if(loginUser!=null){
			//아이디,비밀번호가 맞을 시
			//DB에서 받아온 유저 정보를 login이라는 세션에 담음
			session.setAttribute("login", loginUser);
			System.out.println("로그인 된 유저 : "+loginUser);
			System.out.println("로그인 성공!");
			return "redirect:"+prePage;
		}else{
			
			//아이디,비밀번호가 틀렸을 시 
			System.out.println("로그인 실패!");
			ra.addFlashAttribute("loginMsg","아이디 혹은 비밀번호를 확인해 주세요.");
			return "redirect:"+referer;
		}//end if

	}
	
	//===============================로그아웃=============================
	
	@RequestMapping(value="/logout",method=RequestMethod.POST)
	public String logout(HttpSession session,
						@RequestHeader String referer,
						String logoutSign){
		
		//login 세션에 담긴 유저정보를 지워버림
		System.out.println("로그아웃 sigh : "+logoutSign);
		
		//로그아웃 확인을 누를 시 
		if(logoutSign.equals("true")){
			
			System.out.println("로그아웃 전 "+session.getAttribute("login"));
			session.removeAttribute("login");
			System.out.println("로그아웃 후 "+session.getAttribute("login"));
			System.out.println("로그아웃 성공 !");
			
			return "redirect:"+referer;
		}else{
			
			//로그아웃 취소를 누를시
			System.out.println("취소누름");
			return "redirect:"+referer;
		}

	}
	
	//==========================마이페이지=============================
	@RequestMapping("/mypage")
	public void mypage(HttpSession session,Model model){
		
		
		//로그인 유저 번호 얻기
		try {
			User user =  (User)session.getAttribute("login");
			int no = user.getNo();
		
		
		//System.out.println("관심상품 수 : " + wishList.size());
		//관심상품들 담아서 넘기기
		

		} catch (Exception e) {
			System.out.println("mypage nullpointer처리 나중에 다시 없애자");
		}
	}
	
	//장바구니 상품 뿌리기 json
	@RequestMapping("/cartList")
	public @ResponseBody List<Cart> ajaxCartList(HttpSession session){
		User user = (User)session.getAttribute("login");
		int no = user.getNo();

		//카트리스트 뿌리기
		List<Cart> cart =  shopService.getCartList(no);

		//객체를 리스트에 담아 넘기기
		return cart;
	}
	
	//장바구니 총 합계,수량 json
	@RequestMapping("/totalPrice")
	public @ResponseBody Map<String, Object> totalPrice(HttpSession session,
										Cart cart){
		try {
			
		User user = (User)session.getAttribute("login");
		int userNo = user.getNo();
		
		//총 합계,수량
		Cart total =  shopService.getCartTotal(userNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("quantity", total.getQuantity());
		map.put("totalPrice", total.getTotalPrice());


		return map;
		} catch (Exception e) {
			System.out.println("장바구니비어있어여");
		
		return new HashMap<>();	
		}

	}
	
	//장바구니 수량 업데이트 json
	@RequestMapping("/updateCartQuantity")
	public @ResponseBody int updateCartQuantity(@RequestParam int quantity,
												 @RequestParam String upAndDown,
												 @RequestParam int no,
												 Cart cart){

		//ajax로부터 quantity와 upAndDown 파라미터를 받아서 각 수량값을 가공처리함.
		//System.out.println("up클릭했냐down클릭했냐 : "+upAndDown);
		if(upAndDown.equals("up")){
			//up버튼 클릭시
			quantity +=1 ;
		}else{
			//down버튼 클릭시
			quantity -=1 ;
		}
		//System.out.println("DAO로 전달될 수량 : "+quantity);
		//카트no를 받음
		//System.out.println("카트no : "+no);
		
		//만약 갯수가 0이면 
		//1을 더해서 0으로 못내려가게 막음
		if(quantity==0){
			quantity+=1;
		}
		//quantity를 셋팅
		cart.setQuantity(quantity);
		
		//no를 셋팅
		cart.setNo(no);
		
		int result = shopService.getUpdateQuantity(cart);
		if(result!=1){
			//업데이트 실패시
			System.out.println("수량 업뎃 실패");

		}				
			System.out.println("수량 업뎃 성공");
			return result;	
	}
	
	
	//위시리스트 뿌리기 json
	@RequestMapping("/getWishList")
	public @ResponseBody List<WishList> getWishList(HttpSession session){
		User user =  (User)session.getAttribute("login");
		
		int no = user.getNo();
		//위시리스트 뿌리기
		List<WishList> wishList = shopService.getWishList(no);
		
		return wishList;
	}
	
	//위시리스트 삭제 json
	@RequestMapping(value="/deleteWish",method=RequestMethod.GET)
	public @ResponseBody int deleteWish(@RequestParam List<Integer> checkedItem){

		HashMap<String, List<Integer>> checked = new HashMap<>();
		
		
		checked.put("checked", checkedItem);
		
		//System.out.println(checkedItem);
		
		//dao로 hashMap에 값을 담아 전달
		int result = shopService.deleteWish(checked);

		if(result == 1){
			System.out.println("삭제 되었습니다.");
			return result;
		}else{
			System.out.println("에러에요.");
			return result;
		}

		
	}
	
	//주문상품 조회
	@RequestMapping(value="/order_list",method=RequestMethod.GET)
	public @ResponseBody List<OrderItem> getOrderList(@RequestParam(defaultValue="a") String orderCodeF){
		
		
		System.out.println("넘어온 주문검색코드 : "+orderCodeF);
		
		List<OrderItem> list =  shopService.getOrderList(orderCodeF);
		
		return list;
	}
	//-------------------------구매 페이지--------------------------//

	
	//구매페이지
	@RequestMapping(value="/purchase",method=RequestMethod.POST)
	public void purchase(@RequestParam List<Integer> checkedItem,
						 Model model,Cart cart){
		//list객체로 체크 값들을 받아서 넣음
		
		
		//리스트에 체크된 값들 담겨짐
		//System.out.println("주문할 카트에 담긴 번호 : "+checkedItem);
		
		//mybatis에게 넘길 hashmap을 선언
		HashMap<String,List<Integer>> checked = new HashMap<>();
		
		//hashmap에 list객체를 넣음
		checked.put("checked", checkedItem);
	
		//맵 넘김
		List<Cart> itemList =  shopService.getWillBuyItemList(checked);
		
		//총 구매 가격 구하기 
		List<Integer> priceList = new ArrayList<>();
		//cart객체가 list로 넘어옴
		//list에서 각 객체의 가격을 뽑아서 priceList에 넣음	
		for (int i = 0; i < itemList.size(); i++) {
			
			//가격을 int형으로 형변환
			int realPrice = itemList.get(i).getTotalPrice();
			//list에 가격 대입
			priceList.add(realPrice);
		}
		
		int sum=0;
		for (int i = 0; i < priceList.size(); i++) {
			//System.out.println("int형 가격: "+priceList.get(i));

			//list안에 있는 가격을 모두 더함
			 sum = sum + priceList.get(i);
		}
		
		System.out.println("총 합계 : "+sum);
		
		if(sum>=50000){
			model.addAttribute("freeMsg", "무료");
		}
		
		model.addAttribute("finalPrice", sum);
		model.addAttribute("itemList",itemList);
	}
	
	@RequestMapping(value="/doUpdate",method=RequestMethod.POST)
	public void update(){
		
		System.out.println("update()컨트롤러 작동 : 이곳은 update!!");
		System.out.println("============================");
	}
	
	@RequestMapping(value="/purchase_end",method=RequestMethod.POST)
	public void end(HttpSession session,
					@RequestParam List<Integer> deleteNo,
					@RequestParam String recipient,
					@RequestParam String orderCode,
					@RequestParam String postCode,
					@RequestParam String mainAddress,
					@RequestParam String detailAddress,
					@RequestParam String phone,
					@RequestParam List<String> name,
					@RequestParam List<String> price,
					@RequestParam List<String> image,
					@RequestParam List<String> quantity,
					Model model){
		
		//넘어온 주문서에 넣어질 상품들 
	/*	System.out.println("이름 크기 : "+name.size());
		System.out.println("가격 크기 : "+price.size());
		System.out.println("사진 크기 : "+image.size());
		System.out.println("수량 크기 : "+quantity.size());
	*/	

		
		//유저 번호 얻어오기
		User user = (User)session.getAttribute("login");
		
		int userNo = user.getNo();
		String orderer = user.getNickName();
		
/*		System.out.println(userNo);
		System.out.println("recipient : "+ recipient);
		System.out.println("orderCode : "+orderCode);
		System.out.println("postCode : "+postCode);
		System.out.println("mainAddress : "+mainAddress);
		System.out.println("detailAddress : "+detailAddress);
		System.out.println("phone : "+phone);*/
		
		
		//==order_client삽입처리==//		
		//객체에 셋팅
		OrderClient orderClient = new OrderClient();
		
		orderClient.setOrderer(orderer);
		orderClient.setOrderCode(orderCode);
		orderClient.setRecipient(recipient);
		orderClient.setPhone(phone);
		orderClient.setPostCode(postCode);
		orderClient.setMainAddress(mainAddress);
		orderClient.setDetailAddress(detailAddress);
		orderClient.setUserNo(userNo);
		
		int OrderInsertResult = shopService.insertOrderClient(orderClient);
		
		if(OrderInsertResult!=1){
			System.out.println("실패");

		}else{
			
			//주문 고객 테이블에 성공적으로 insert됬을시
			//selectKey로 주문코드를 가져오고
			//order_item테이블에 다중insert실행

			System.out.println("성공");
			
			String real_code = orderClient.getOrderCode();
			
			//System.out.println("방금 삽입된 코드"+real_code);
			model.addAttribute("real_code", real_code);

			//==order_item삽입처리==//
			//객체담기

			OrderItem oi = null;
			List<OrderItem> list = new ArrayList<OrderItem>();
			for (int i = 0; i < name.size(); i++) {
				
				//oi라는 객체를 동적으로 생성
			 oi = new OrderItem();	
				
				//값 셋팅
				oi.setName(name.get(i));
				oi.setPrice(price.get(i));
				oi.setImage(image.get(i));
				oi.setQuantity(Integer.parseInt(quantity.get(i)));
				oi.setOrderCodeF(real_code);
				
				//객체를 리스트에 담기
				list.add(oi);
				
			}

			
			//hashmap에 담아서 보내기
			HashMap<String, List> orderMap = new HashMap<>();
			orderMap.put("list", list);
		
			//order_item insert
			int order_item_Result = shopService.insertOrderItem(orderMap);
		
			
			//==삭제처리==//
			//삭제 될 번호 처리
			HashMap<String, List<Integer>> no = new HashMap<>();
			
			//hashmap에 담아 넘기기
			no.put("no", deleteNo);
			int result = shopService.deleteCart(no);
			
			if(result != 0){
				//삭제 성공시
				System.out.println("삭제 성공");
				
			}else{
				//삭제 실패시
				System.out.println("실패");
			}		
		}//if~ else end

		System.out.println("============================");
	}
	
	//상품 타입별 리스트
	@RequestMapping(value="/item_list/{CT2}/{CT}",method=RequestMethod.GET)
	public String item_list(@PathVariable String CT,
							@PathVariable String CT2,
							@RequestParam(required=true,defaultValue="1") int pageNo,
							@RequestParam(required=true,defaultValue="recentItem") String orderBy,
							Item item,
							Model model){
		System.out.println("item_list컨트롤러 작동 : 이곳은 item_list!!");
		
		System.out.println("???"+orderBy);
		
/*		System.out.println("파라미터 상품별 타입 : "+CT);
		System.out.println("파라미터 상품별 타입2 : "+CT2);*/
		//ENUM에서 타입 빼옴
		ClothType ct = ClothType.valueOf(CT);
		ClothType ct2 = ClothType.valueOf(CT2);
/*		System.out.println("ENUM에서 받아온 ClothType : "+ct);
		System.out.println("ENUM에서 받아온 ClothType2 : "+ct2);*/
		
		//ENUM을 string으로 리턴
		String clothType = ct.toString();
		String clothType2 = ct2.toString();
		
		//페이징 서비스
		model.addAllAttributes(shopService.getItemListTwoType(pageNo, clothType2, clothType,orderBy));
		//동적처리하기 위해서 조건 던지기
		model.addAttribute("allItems","allItems");
		
		
		System.out.println("============================");
		
		return "item_list";
	}
	
	//상품 리스트
	@RequestMapping("/item_list/{CT2}")
	public String item_list_all(@PathVariable String CT2,
								@RequestParam(required=true,defaultValue="1") int pageNo,
								@RequestParam(required=true,defaultValue="recentItem") String orderBy,
								Item item,
								Model model){
		
		//order 셋팅
		item.setOrderBy(orderBy);
		
		//order 처리
		System.out.println("넘어온 order : "+orderBy);
		
		//System.out.println("item_list컨트롤러 작동 : 이곳은 타입별 전체 상품페이지!!");

		//ENUM에서 타입 빼옴
		ClothType ct2 = ClothType.valueOf(CT2);
		
		//System.out.println("ENUM에서 받아온 ClothType2 : "+ct2);
		
		//ENUM 값을 스트링형으로 리턴시킴
		String clothType2 = ct2.toString();
		
		//System.out.println(clothType2);
		
		//System.out.println("xml로 넘어갈 ct2 값 : "+item.getClothType2());
		
		//@requestParam의 dafulat값으로 넘겨준다.
		//서비스 호출해서 map으로 넘어옴(oneType,paginate)
		//다시 해당 페이지로 map을 담아 넘겨서 
		//배열은 
		//키값으로 꺼내와서 foreach로 돌리고
		//스트링이면
		//키값으로 작성한다
		model.addAllAttributes(shopService.getItemListOneType(pageNo,clothType2,orderBy));

		System.out.println("============================");
		
		return "item_list";
	}
	
	//댓글 작성
	@RequestMapping(value="/insertReply/{itemNo}",method=RequestMethod.POST)
	public String addReply(@RequestHeader String referer,
							Reply reply,
							HttpSession session,
							@PathVariable int itemNo,
							@RequestParam String content,
							@RequestParam(defaultValue="10") int grade){
	
	//로그인 유저 정보 얻어옴

	//form으로 넘어오는 파라미터는 @requestParam으로 
		
	User loginUser = (User)session.getAttribute("login");	
		
	System.out.println("번호 : "+loginUser.getNo() +" / "+"닉네임 : "+loginUser.getNickName()+" / "+"내용 : "+content+" / "+"상품번호 :"+itemNo+" / "+"grade : " + grade);
	
	int userNo= loginUser.getNo();
	String nickName = loginUser.getNickName();
	reply.setUserNo(userNo);
	reply.setNickName(nickName);
	reply.setContent(content);
	reply.setItemNo(itemNo);
	reply.setGrade(grade);

	int result = shopService.insertReply(reply);
		
	if(result ==1){
		System.out.println("등록 성공!");
		return "redirect:"+referer;
	}
	
		
		System.out.println("오류 발생!");
		return "redirect:error";
	}//addReply

	//장바구니 담기
		@RequestMapping(value="/cart",method=RequestMethod.POST)
		public String insertCart(@RequestHeader String referer,
								 @RequestParam int userNo,
								 @RequestParam String name,
								 @RequestParam String price,
								 @RequestParam String image,
								 @RequestParam String itemColor,
								 @RequestParam String itemSize,
								 @RequestParam int quantity,
								 @RequestParam int itemNo,
								 @RequestParam String total,
								 Cart cart,
								 RedirectAttributes ra){

	/*		System.out.println("장바구니 담기");
			System.out.println("카트 담기 유저번호 : "+userNo);
			System.out.println("카트 담기 상품번호 : "+itemNo);
			System.out.println("카트 담기 상품이름: "+name);
			System.out.println("카트 담기 상품가격: "+price);
			System.out.println("카트 담기 상품 총 가격: "+total);
			System.out.println("카트 담기 상품사진: "+image);
			System.out.println("카트 담기 상품색상: "+itemColor);
			System.out.println("카트 담기 상품사이즈: "+itemSize);
			System.out.println("카트 담기 상품수량: "+quantity);*/
			
			
			int totalPrice = Integer.parseInt(total)*quantity;
			
			//vo 값 셋팅
			cart.setName(name);
			cart.setPrice(price);
			cart.setItemColor(itemColor);
			cart.setItemSize(itemSize);
			cart.setQuantity(quantity);
			cart.setImage(image);
			cart.setUserNo(userNo);
			cart.setTotalPrice(totalPrice);
		
			int result = shopService.insertCart(cart);
			
			if(result==1){
				ra.addFlashAttribute("cartMsg", "카트에 담겨졌습니다.");
				//System.out.println("담겨졌습니다");
				return "redirect:"+referer;
			}else{
				
				return "redirect:error";
			}
		}//InsertCart
		
		//장바구니 담기
				@RequestMapping(value="/fastPurchase",method=RequestMethod.POST)
				public String fastPurchase(@RequestHeader String referer,
										 @RequestParam int userNo,
										 @RequestParam String name,
										 @RequestParam String price,
										 @RequestParam String image,
										 @RequestParam String itemColor,
										 @RequestParam String itemSize,
										 @RequestParam int quantity,
										 @RequestParam int itemNo,
										 @RequestParam String total,
										 Cart cart){

					
					int totalPrice = Integer.parseInt(total)*quantity;
					
					//vo 값 셋팅
					cart.setName(name);
					cart.setPrice(price);
					cart.setItemColor(itemColor);
					cart.setItemSize(itemSize);
					cart.setQuantity(quantity);
					cart.setImage(image);
					cart.setUserNo(userNo);
					cart.setTotalPrice(totalPrice);
				
					int result = shopService.insertCart(cart);
					
					return "/mypage";
				}//InsertCart

		
		//위시리스트 담기
		@RequestMapping(value="/wishList",method=RequestMethod.POST)
		public String insertWishList(@RequestParam int userNo,
								   @RequestParam String name,
								   @RequestParam String price,
								   @RequestParam String image,
								   @RequestParam int itemNo,
								   WishList wishList,
								   RedirectAttributes ra,
								   @RequestHeader String referer){
			
			
			System.out.println("넘어온 번호"+itemNo);

			
			wishList.setItemNo(itemNo);
			wishList.setName(name);
			wishList.setPrice(price);
			wishList.setImage(image);
			wishList.setUserNo(userNo);
			
			//담기전에 중복을 체크
			WishList checkDupli  = shopService.checkDuplicationWish(wishList);
			
			
			if(checkDupli!=null){
				
				//이미 상품이 있을 경우		
				ra.addFlashAttribute("duplicationMsg", "이미 등록되있는 상품입니다.");
				
				return "redirect:"+referer;
				
			}else{
				//상품이 없을 경우	
				int result = shopService.insertWishList(wishList);
				ra.addFlashAttribute("wishListMsg", "상품이 등록 되었습니다.");
				//check if end
				return "redirect:"+referer;
			}		
		}
		
		
		
}//ShopController
