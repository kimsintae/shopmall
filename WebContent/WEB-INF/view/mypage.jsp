<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
<c:import url="template/link.jsp"></c:import>
    
    <style>
        .contents{
           width: 100%;
           /*background: blue;  */    
        }
    
        .mypage_Wrap{
            width: 1000px;
            min-height: 1000px;
            /*background: red;*/
            margin: auto;
            margin-bottom: 10px;
            position: relative;
            /*border: 1px solid #424242;*/
        }
        h1{
            width: 1000px;
            height: 100px;
            margin: auto;
            line-height: 100px;
            /*background: yellow;*/
            font-size: 50px;
            text-align: center;
            border-bottom: 1px solid #424242;
            
        }
		.mypage_top_menu{
            width: 100%;
            height: 40px;
            margin:auto;
            background: black;
            z-index:2;
        }
        .mypage_top_menu ul{
       		width: 1000px;
       		height:40px;
        	margin:auto;	
        }
        .mypage_top_menu ul li{
            float: left;
            width: 200px;
            height: 40px;
            line-height: 40px;
            font-size: 20px;
            text-align: center;
            font-weight: 700; 
        }
        .mypage_top_menu a{
            text-decoration: none;
            color: white;
        }
        .mypage_top_menu a:hover{
        	color:red;
        }
        
        .fixed.mypage_top_menu {
            position: fixed;
        }
        
        .cart_wrap,.wish_list,.delivery_search{
            width: 1000px;
            min-height: 300px;
            /*background: green;*/
            margin-top: 50px;
            padding: 10px;     
            border: 1px solid #424242;
        }
        
        h2{
            width: 300px;
            height: 30px;
            line-height: 30px;
            /*background-color: bisque;*/
            margin-top: 10px;
            padding-left: 10px;
            font-size: 25px;
            letter-spacing: 5px;
        }
        
        #all_selection{
            font-size: 12px;
            vertical-align: middle;
        }
        #all_selection input{
            vertical-align: middle;
            font-size: 20px;
        }
        .cart_box,.delivery_search_wrap,.wish_list_search_wrap{
            width: 1000px;
            /*background-color: forestgreen;*/
            margin-top: 20px;
        }
        .cart_wrap{position: relative;}
       
        #loadingWrap{
        	display:none;
        	position: absolute;
        	width: 1000px;
        	min-height: 300px;
        	background: rgba(255,255,255,.5);
        	left: 50%;
        	top: 50%;
        	margin-left: -500px;
        	margin-top: -150px;
        	text-align: center;
        }
	
		#loadingBox{
			width:60px;
			height:60px;
			position: absolute;
			top: 50%;
			left: 50%;
			margin-left: -25px;
			margin-top: -25px;
		}
        .cart_th_tr,.delivery_search_wrap thead tr,.wish_list_search_wrap thead tr{
            font-size: 15px;
            background-color: #BDBDBD;
            height: 30px;
            line-height: 30px;
            text-align: center;
            font-weight: 700;
            letter-spacing: 10px;
        }
        .cart_item_info{
            font-weight: 700;
        }
        
        /* 장바구니 */
        .cart_table_product_name{
            width: 450px;
            /*background: blue;*/
        }
        
        .cart_check_box{
            width: 15px;
            height: 15px;
        }
        
        .cart_box tbody tr,.wish_list_search_wrap tbody tr{
            /*background-color: darkred;*/
            text-align: center;
            height: 50px;

        }
        .cart_box tbody tr td,.wish_list_search_wrap tbody tr td {
            height: 40px;
            line-height: 20px;
            vertical-align: middle;
            padding-top: 12px;
            font-size: 15px;
        }
        .table_all_cost tr{
            height: 50px;
            font-weight: 900;
            font-size: 25px;
            line-height: 50px;
            text-align: center;
            border-top: 1px solid #424242;
            border-style: dashed;
        }
        #totalAmount{
            text-align: right;
        }
        .table_all_cost tr:nth-child(2){
            border-top: none;
            text-align: right;
            text-decoration: none;
            
        }
        .table_all_cost tr:nth-child(2) a{
            text-decoration: none;
            color: white;
            background-color: darkgrey;
            margin-right: 20px;
        }
        .table_all_cost tr:nth-child(2) a:hover{
            cursor: pointer;
        }
        #totalQuantity{
            width: 50px;
            border: none;
            height: 40px;
            vertical-align: middle;
            font-size: 30px;
            text-align: center;
            background: white;
            color: crimson;
            font-weight: 800;
            
        }
        /* 위시리스트  */
        
        .wish_list_search_wrap tfoot tr{
            /*background: red;*/
            text-align: right;
            height: 40px;
            line-height: 30px;
            border-top: 1px solid #424242;
	
        }
        .wish_list_search_wrap button{
            background: silver;
            border: none;
            margin-right: 20px;
            margin-top: 10px;
            height: 30px;
        }
        .wish_list_search_wrap button:hover{
            cursor: pointer;
        }
        /* 배송조회 박스 */
        .delivery_search_wrap{
            text-align: center;
        }
        .delivery_search_wrap tr{
            height: 50px;
            line-height: 50px;
            font-size: 15px;
        }
        .delivery_number_search{
            
            margin-top: 15px;
            height: 20px;
            width: 300px;
            
        }
        
        /* 수량 */
        
         .quantity_box{
            height: 40px;
            /*background: red;*/
        }
        .quantity{
            display:inline-block;
            width: 40px;
            height: 38px;
            margin-left: 10px;
            vertical-align: middle;
            text-align: right;
            border: none;
            font-size: 20px;    
        }
        .quantity_btn_box{
            display: inline-block;
            vertical-align: middle;
        }
        .quantity_btn_box button{
            height: 20px;
            display: block;
            text-align: center;
            line-height: 15px;
            background: white;
        }
        .quantity_btn_box button:hover{
            cursor: pointer;
        }
        
        #eachItemTotalPrice{
        	font-weight: 800;
        }
        
        #noWishMsg{
        	font-size: 30px;
        	font-weight: 800;
        	height: 300px;
        	line-height: 200px;
        }
        
        .order_image{
        	vertical-align: middle;
        	margin:10px 0;
        }
        #goPurchase{
        
        	background: silver;
        	height: 35px;
        }
        
        .all_order_search{
        	width: 150px;
        	height: 150px;
        }
        
        .total_order_search{
        	
        
        }
    </style>
</head>
<body>
    <div class="contents">
        <div class="mypage_top_menu">
                <ul>
                    <li><a href="/main">HOME</a></li>
                    <li><a href="/join">회원정보 수정</a></li>
                    <li><a href="/item_list/M">MEN</a></li>
                    <li><a href="/item_list/W">WOMEN</a></li>
                    <li><a href="/item_list/K">KIDS</a></li>
                </ul>
            </div><!--//mypage_top_menu-->
        <div class="mypage_Wrap">
            <!--사이드바-->

            
            <h1>MY PAGE</h1>
            
            <div class="cart_wrap">
                <h2>Cart List</h2>

   			<form action="/purchase" method="post" class="cart_form">   		
                <table class="cart_box">
                <div id="loadingWrap">
                	<div id="loadingBox">
                	<img id="loading" height="60px" width="60px" alt="" src="/image/loading.gif">
                	</div>
                </div>
                    <thead>
                        <tr class="cart_th_tr">
                            <td id="all_selection"><input class="all_check" type="checkbox"/></td>
                            <td>상품</td>
                            <td class="cart_table_product_name">상품 이름</td>
                            <td>가격</td>
                            <td>수량</td>
                        </tr>
                    </thead>

                    <tbody id="cartBody">

                    </tbody>
                    
                    <tfoot class="table_all_cost">
                        <tr>
                            <td></td>
                            <td></td>
                            <td id="totalAmount">예상구매 합계 :</td>
                            <td><span id="totalPrice"></span> 원</td>
                            <td><input name="totalQuantity" id="totalQuantity" disabled value="">개</td>
                        </tr>
                        <tr>
                            <td class="do_buy" colspan="5">
                            	<button type="button" id="goPurchase" onclick="checkBoxOn();">삭제</button>
                            	<button type="button" id="goPurchase" onclick="checkBoxOn();">구매하러 가기</button>
                            </td>
                        </tr>
                    </tfoot>
                </table><!--//cart_box-->
            </form><!--//cart_form-->
            </div><!--//cart_wrap-->
            
            <div class="wish_list">
                <h2>Wish List</h2>

            <form class="wish_form">
                 <table class="wish_list_search_wrap">
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="wishAllSelection"/></td>
                            <td>상품</td>
                            <td>상풍명</td>
                            <td>가격</td>
                            <td>날짜</td>
                        </tr>
                    </thead>
                    <tbody id="wishBody">   

                    </tbody>
                     
                    <tfoot>
                        <tr>
                            <td colspan="5" ><button>장바구니 담기</button><button onclick="deleteWish();" id="deleteWishBtn">삭제</button></td> 
                        </tr>
                    </tfoot>
                </table><!--//wish_list_search_wrap-->
            </form><!--//wish_form-->
            </div><!--//wish_list-->
               
             <div class="delivery_search">
                <h2>Delivery Search</h2>
                <input class="delivery_number_search" type="text" name="delivery_number" placeholder="배송번호를 입력 해주세요" onkeyup="get_order_list();"/>
                <button type="button" class="delivery_number_search_btn">조회</button>
                    <table class="delivery_search_wrap">
                        <thead>
                            <tr>
                                <td>이미지</td>
                                <td>상품명</td>
                                <td>수량</td>
                                <td>가격(개당)</td>
                                <td>배송 상태</td>
                                <td>주문 날짜</td>
                            </tr>
                        </thead>
                        
                        <tbody id="orderBody">
                            
                    
                        </tbody>
                 
                    </table><!--//delivery_search_wrap-->
                 
            </div><!--//delivery_search-->
        </div><!--//mypage_Wrap-->
    </div><!--//contents-->




<c:import url="template/footer.jsp"></c:import>

<script src="/js/json2.js"></script>
<script type="text/template" id="cartTmp">
<@if(cartList.length>=1){@>
				<@_.each(cartList,function(cart){@>

							<tr>
	                            <td>
	                                <input class="cart_check_box" type="checkbox" name="checkedItem" value="<@=cart.no@>" />   
	                            </td>
	                            <td><a href="/item_detail/<@=cart.itemNo@>"><img width="100" height="100" src="<@=cart.image@>" alt="" title="해당 제품 페이지로"/></a></td>
	                            <td>
	                                name : <span class="cart_item_info"><@=cart.name@></span><br/>  
	                                size : <span class="cart_item_info"><@=cart.itemSize@></span><br/>  
	                                color : <span class="cart_item_info"><@=cart.itemColor@></span>  
	                            </td>
	                            <td>
	                            <span id="eachItemTotalPrice">
	                            <@=cart.totalPrice@>
	                            </span>(<@=cart.price@>)</td>
	                            <td>
	                                <div class="quantity_box">
	                                            <input type="text"
	                                                   class="quantity"
	                                                   maxlength="3" 
	                                                   value="<@=cart.quantity@>"/>
	                                                
	                                           <!-- 수량버튼 -->    
	                                            <div class="quantity_btn_box">
	                                         
	                                            <button type="button"
	                                                    class="quantity_up updateBtn"
	                                                    vlaue="up"
	                                                    data-value="<@=cart.no@>">
	                                                <i class="fa fa-sort-asc" 
	                                                   aria-hidden="true"></i>
	                                            </button>
	                                            <button type="button"
	                                                    class="quantity_down updateBtn"
	                                                    vlaue="down"
	                                                    data-value="<@=cart.no@>">
	                                                <i class="fa fa-sort-desc" 
	                                                   aria-hidden="true"></i>
	                                            </button>    
	                                            </div><!--//quantity_btn_box-->
	                                </div><!--//quantity_box-->
	                            </td>
	                        </tr>

				<@})@>
<@}else {@>
							<tr>
								<td colspan="5">장바구니가 비었습니다.</td>
							</tr>

<@}@>
</script>

<script type="text/template" id="wishListTmp">
	<@if(wishList.length>=1){@>
				<@_.each(wishList,function(wish){@>
				        <tr>
                            <td>
                            	<input type="checkbox" name="checkedItem" value="<@=wish.no@>" class="wish_selection"/>
                            </td>
                            <td>
                            	<a href="/item_detail/<@=wish.itemNo@>">
                                <img width="100" height="100" src="<@=wish.image@>" alt=""/>
                                </a>
                            </td>
                            <td><@=wish.name@></td>
                            <td><@=wish.price@>원</td>
                            <td><@=moment(wish.regdate).format("YYYY년M월D일")@></td>
                        </tr>
				<@})@>
<@}else {@>
						<tr>
							<td id="noWishMsg" colspan="5">찜하신 상품이 없습니다.</td>
						</tr>
<@}@>
</script>

<!-- 주문 조회 tmp -->

<script type="text/template" id="orderTmp">


<@if(orderList.length>0){@>
<@_.each(orderList,function(order){@>
	<tr>
        <td><img class="order_image" width="70px" height="70px" src="<@=order.image@>"></td>
        <td><span><@=order.name@></span></td>
		<td><@=order.quantity@></td>
		<td><@=order.price@> 원</td>
        <td><@=order.orderState@></td>
        <td><@=moment(order.regdate).format("YYYY년 M월 D일")@></td>
    </tr>
<@})@>
<@}else{@>
	<tr>
		<td colspan="6">
			주문내역이 없습니다. 주문코드를 확인해 주세요.
		</td>
	</tr>

<@}@>
</script>

	<script src="js/underscore-min.js"></script>
	<script src="js/moment-with-locales.js"></script>
    <script src="js/jquery.js"></script>
    <script>
    
	_.templateSettings = {
			 interpolate: /\<\@\=(.+?)\@\>/gim,
			 evaluate: /\<\@(.+?)\@\>/gim,
			 escape: /\<\@\-(.+?)\@\>/gim
			};

    
    $(".cart_box tbody tr:odd").css("background-color","#F5F5F5");
    $(".delivery_search_wrap tbody tr:odd").css("background-color","#F5F5F5");
    
    //상품 선택 여부 
   	function checkBoxOn(){
   		
   		//다중 체크 여부 확인
   		//alert($(":checkbox[name='checkedItem']:checked").length);
   		var check = $(":checkbox[name='checkedItem']:checked").length;
   		
   		if(check==0){
   			//선택 안하면
   			alert("구매하실 상품을 선택해 주세요");
   		}else{
   			
   			//선택 하면
   			$(".cart_form").submit();
   		}
   		
   	}//checkBoxOn();
    
    
    
	//ajax 실행 함수 호출
	  getCart();
	  getTotal();
	  getWishList();
	   var $cartBody  = $("#cartBody"),
	   	   $wishBody = $("#wishBody");
	  
	  
  var $all_selection = $("#all_selection input");

  //장바구니 체크박스 전체 선택
	  $all_selection.change(function(){
	              if ($(this).is(':checked')) {
	         			//alert("test"); 
	         			$(".cart_check_box").prop("checked",true);
	              }else{
	            	   //alert("test"); 
	            	  $(".cart_check_box").prop("checked",false);  
	              }
	  }); 
	  

     //수량 선택 스크립트
	  $("#cartBody").on("click",".quantity_up",function(){
		  //alert("클릭?");
		  var n = $('.quantity_up').index(this);
		    var num = $(".quantity:eq("+n+")").val();
			//카트 번호 가져오기
		    var no = $(this).attr("data-value");
		    	//버튼 타입 가져오기
		    var upAndDown = $(this).attr("vlaue");
		    //alert("카트번호 : "+no);	
		    ajaxUpdateQuantityUp(num,upAndDown,no);
		    
		 num = $(".quantity:eq("+n+")").val(num*1+1); 
		  
	  });   

	 $("#cartBody").on("click",".quantity_down",function(){
		    var n = $('.quantity_down').index(this);  
		    var num = $(".quantity:eq("+n+")").val();
		    	//카트 번호 가져오기
		    var no = $(this).attr("data-value");
		    	//버튼 타입 가져오기
		    var upAndDown = $(this).attr("vlaue");
	
		   // alert("카트번호 : "+no);
		    ajaxUpdateQuantityUp(num,upAndDown,no);
		    
		    if(num<2){
		        alert("1개 이하로는 선택 하실수 없습니다.");
		    }else{    
		    num = $(".quantity:eq("+n+")").val(num*1-1); 
		    }
		  
	  });   
     
	  //탑 메뉴 스크립트
	  $(window).scroll(function(){     
	      var $top_menu = $(".mypage_top_menu");   
	      
	       var location = $(this).scrollTop();
	       //console.log(location);
	      
	      if(location > 0){   
	          //스크롤 내렸을때 
	          //console.log(location);
	          $top_menu.addClass("fixed");
	      }else{
	          $top_menu.removeClass("fixed");
	      }   
	  })
  
	  $(".do_buy").on("click","#goPurchase",function(){
		  //alert("test");
		  form.submit();
	  });
	  
	  
	  $cartLoading = $("#loadingWrap");//로딩 마크
	  

	  $cartLoading.show();	  
	  

	  //수량 업데이트 ajax
  	function ajaxUpdateQuantityUp(quantity,upAndDown,no){
	
	  //수량의 값을 받아서 넘기고
	 // alert("인자로 받은 quantity : "+quantity);
	  //UP인지  DOWN인지에 따라 값이 달라져야함으로
	  //각 각의 value를 보낸다.
	 // alert("인자로 받은 upAndDown : "+upAndDown);
	  //data속성을 이용해 카트no를 받아서 보냄
	 // alert("인자로 받은 no : "+no);
	  
	    $.ajax("/updateCartQuantity",{
		  type:"get",
		  dataType:"json",
		  data:{"quantity":quantity,"upAndDown":upAndDown,"no":no},
		  error:function(xhr,code,error){
			  //alert("에러요");
		  },
		  success:function(json){
			  $cartLoading.show();	
			  
			  // alert("성공요");
			 
			 //업데이트가 성공하면
			 //카트리스트,총합계,수량 불러들이는 ajax를 호출해서 
			 //리스트를 리로딩 함.
			  getCart();
			  getTotal();
		  }
	  });  
  }
  
  
  
  //카트 상품 뿌리기
  function getCart(){
  	 
	  //새로 뿌려질 때 body를 초기화 시키기 위해

	  
	  $.ajax("/cartList",{
  		  type:"get",
  		  dataType:"json",
  		  error:function(xhr,error,code){
  			  alert("실패");
  		  },
  		  success:function(json){
  		
  			  $cartBody.empty();
  			  //alert("성공");
  			  
  			//템플릿안에 있는 마크업 전부를 따옴
				var markup= $("#cartTmp").html();
				
  				//alert(markup);
  				
 		     	var tmp = _.template(markup);
					
		     	//alert(tmp);
		     	
		     	//제이슨은 배열로 넘어온다.
				var code = tmp({"cartList":json});
				
				//alert(code);
				
				//<tbody>안에 code를 붙여넣는다.
				$cartBody.append(code);
				$cartLoading.hide();
  			  
  		  }
  	  });
	  
  }//getCart();

  
  //카트 총합계,수량 ajax
  function getTotal(){
	  $.ajax("/totalPrice",{
		  type:"get",
		  dataType:"json",
		  error:function(xhr,code,error){
				alert("에러요");
		  },
		  success:function(json){
			 	//alert("성공요");
			 	var quantity = json.quantity
			 	var totalPrice = json.totalPrice;
			 	//html값 넣을 함수 호출
			 	cartTotal(quantity,totalPrice);
		  }
	  })	  
  }//getTotal();
  
  //getTotal ajax로 넘어온 map에서 값을 꺼내 각 태그에 값을 대입 
  function cartTotal(quantity,totalPrice){
	  //alert("인자로 받은 quantity : "+quantity);
	  //alert("인자로 받은 totalPrice : "+totalPrice);
	  
	  
	  $("#totalQuantity").attr("value",quantity);
	  $("#totalPrice").text(totalPrice);
  }
  
  //위시리스트 뿌리기 ajax
  function getWishList(){

	  $.ajax("/getWishList",{
		  type:"get",
		  dataType:"json",
		  error:function(){
			  alert("에러용");
		  },
		  success:function(json){
			  $wishBody.empty();
			  		//alert("성공용");
			  
			  
	  			//템플릿안에 있는 마크업 전부를 따옴
					var markup= $("#wishListTmp").html();
					
	  				//alert(markup);
	  				
	 		     	var tmp = _.template(markup);
						
			     	//alert(tmp);
			     	
			     	//제이슨은 배열로 넘어온다.
					var code = tmp({"wishList":json});
					
					//alert(code);
					
					//<tbody>안에 code를 붙여넣는다.
					$wishBody.append(code);
			  
		  }
	  });
  }//getWishList();
  
  			
  var $wish_form = $(".wish_form");
 
  
  //위시리스트 삭제 ajax
   $wish_form.submit(function(e) {
	  e.preventDefault();
	  
	  //삭제시 action 설정
	  $wish_form.attr("action","/deleteWish");
	  
	  var no = $(this).serialize(),
	  	 url = $wish_form.attr("action");
	  
	  $.ajax(url,{
			type:"GET",
			dataType:"text",
		data:no,
			error:function(xhr,error,code){
				alert("상품을 선택해주세요");
			},
			success:function(text){
				//alert("성공");
				if(text==1){
					//alert("삭제 성공");
					getWishList();
				}else{
					//alert("삭제 실패");
					getWishList();
				}
				
			}
	  });
});//submit;


var $delivery_number_search = $(".delivery_number_search");
var $orderBody = $("#orderBody");
//주문검색 단어 얻어오기
function get_order_list(){
	alert("test");
	//엔터를 쳤을 때
	if(event.keyCode == 13){
		//주문코드 받아옴
		var orderCode = $delivery_number_search.val();
		
		//alert(orderCode);
		
		$.ajax("/order_list",{
			type:"GET",
			dataType:"json",
			data:{"orderCodeF":orderCode},
			error:function(xhr,error,code){
				//alert("실패");
			},
			success:function(json){
				
				$orderBody.empty();
				//alert("성공");
					
					//템플릿안에 있는 마크업 전부를 따옴
	 		     	var tmp = _.template($("#orderTmp").html());
						
			     	//alert(tmp);
			     	
			     	//제이슨은 배열로 넘어온다.
					var code = tmp({"orderList":json});
					
					//alert(code);
					
					//<tbody>안에 code를 붙여넣는다.
					$orderBody.append(code);
			}//success
	  });
	
	}
	
	
}//get_order_list();
    </script>

	<c:if test="${doCheckMsg!=null}">
	<script type="text/javascript">
		alert('${doCheckMsg}');
	</script>
	</c:if>
    
</body>
</html>