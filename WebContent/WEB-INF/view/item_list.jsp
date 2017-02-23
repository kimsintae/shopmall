<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>당신의 날개를 달아주는 S'shopMall</title>
<c:import url="template/link.jsp"></c:import>
    
    <style>
    
        #contents{
            margin: auto;
            min-height: 1000px;
           /* background: red;*/
        }
        
        #productHeader{
            width: 100%;
            min-height: 110px;
            /*background-color: blue;*/
            margin: auto;
            line-height: 110px;
        }
        #productHeader h1{
            height: 110px;
            text-align: center;
            font-size: 50px;
            border-bottom: 1px solid #424242;
            color: black;
            letter-spacing: 5px;
            margin-top: 30px;
        }      
        .product_order_wrap{
            width: 1000px;
            height: 50px;
            /*background:aqua;*/
            margin: auto;
            margin-top: 20px;
        }
        .product_order_wrap #orderList{
            font-size: 20px;
            height: 50px;
            line-height: 50px;
        }
        
        .product_list_wrap{
            width: 1000px;
            min-height: 500px;
            /*background-color: firebrick;*/
            margin: auto;
        }
        .product_list_wrap ul{
            /*background: blue;*/
            width: 1000px;
            min-height: 500px;
            overflow: hidden;
        }
        .product_list_wrap ul li{
            float: left;
            width: 228px;
            height: 350px;
            margin: 30px 11px;
            /*background: green;*/
            box-shadow: 1px 1px 10px #424242;
            
        }
        
        .product_img_box{
            width: 228px;
            height: 228px;
           /* background-color: forestgreen;*/
            
        }
        .product_info_box{
            height: 120px;
            margin-top: 5px;
           /* background-color: deepskyblue;*/

        }
        .product_info_name{
            height: 55px;
            /*background-color: burlywood;*/
            line-height: 35px;
        }
        .product_info_name a{
            text-decoration: none;
            font-size: 15px;
            font-weight: 800;
            color: black;
            padding-left: 10px;
            
        }
        .product_info_likes_price{
            height: 65px;
            /*background-color: darkseagreen;*/
            position: relative;
        }
        .product_like_hit,.product_price{
            height: 65px;
            position: absolute;
            line-height: 65px;
        }
        .product_like_hit{
            width: 64px;
        }
        .product_price{
            width: 164px;
        }
        .product_like_hit{
            /*background-color: firebrick;*/
            font-size: 15px;
            color: black;
        }
        .product_like,.product_reply{
            position: absolute;
            left: 10px;
        }
        .product_like{
            top: 10px;
            padding-top: 6px;
        }
        .product_reply{ 
            bottom: 10px;
            padding-bottom: 6px;
        }
        .product_price{
            /*background-color: aqua;*/
            right: 0;
            font-size: 30px;
            text-align: center;
        }
 
 		#pagingBar{
 			background: white;
 			width: 500px;
 			height: 50px;
 			margin: auto;
 			line-height: 50px;
 			text-align: center;
 			letter-spacing: 30px;
 		}
 		
 		#pagingBar a{
         color:black;
        font-weight: 300;
         font-size: 40px;
         text-decoration: none;
        }
        #pagingBar span{
         color:silver;
        font-weight: 800;	
        font-size: 40px;
                    
        }
    </style>
</head>
<body>
	<c:import url="template/header.jsp"></c:import>
    
    <div id="contents">
        <div id="productHeader">
            <h1>KIDS</h1>
        </div><!--//productHeader-->
      
        <div class="product_order_wrap">
        	<form id="orderForm" action="" method="get">
	            <select id="orderList"  name="orderBy" onchange="select_Change();">
	                <option id="recentItem" selected="selected" value="recentItem">신상품 순</option>
	                <option id="lowPrice" value="lowPrice">가격 낮은 순</option>
	                <option id="higePrice" value="highPrice">가격 높은 순</option>
	            </select>
            </form>
        </div>
      
        <div class="product_list_wrap">
            <ul>
               <c:choose>
            	<c:when test="${allItems!=null}">
            	 <c:forEach items="${twoType}" var="item">
                	<li>
                    <div class="product_img_box">
                        <a href="/item_detail/${item.no}"><img width="228px" height="228px" src="${item.image}" alt=""/></a>
                    </div>
                    
                    <div class="product_info_box">
                        <div class="product_info_name">
                            <a href="/item_detail/${item.no}">${item.name}</a>
                        </div>
                        
                        <div class="product_info_likes_price">
                            <div class="product_price">
                                  <fmt:formatNumber value="${item.price}" type="currency" ></fmt:formatNumber> 
                            </div>
                        </div>
                    </div><!--//product_info_box-->
               		</li> 
                </c:forEach>      
                </c:when>
                
                <c:otherwise>
                <c:forEach items="${oneType}" var="item">
                	<li>
                    <div class="product_img_box">
                        <a href="/item_detail/${item.no}"><img width="228px" height="228px" src="${item.image}" alt=""/></a>
                    </div>
                    
                    <div class="product_info_box">
                        <div class="product_info_name">
                            <a href="/item_detail/${item.no}">${item.name}</a>
                        </div>
                        
                        <div class="product_info_likes_price">
                            <div class="product_price">
                                <fmt:formatNumber value="${item.price}" type="currency"></fmt:formatNumber> 
                            </div>
                        </div>
                    </div><!--//product_info_box-->
               		</li> 
                </c:forEach>  
                </c:otherwise>
            </c:choose>
            </ul>
        
        </div><!--//product_list_wrap-->
    
    
    <!-- type이 2개일경우와 하나일 경우의 페이지네이트 다형성 -->
        
      <c:choose>
	      <c:when test="${allItems!=null}">
			     <div id="pagingBar">
		 			 ${paginate2}
		  		 </div><!--//pagingBar-->
	     </c:when> 
	      	
	     <c:otherwise>
		         <div id="pagingBar">
		 			 ${paginate}
		  		 </div><!--//pagingBar-->
	     </c:otherwise>
    </c:choose> 
    </div><!--//contents-->
    
<c:import url="template/footer.jsp"></c:import>

<script src="/js/template.js"></script>
<script src="/js/jquery.js"></script>
<script type="text/javascript">
//현재 페이지 url
var url = location.href;

//alert(url+"    :    "+url.length);

//해당 글자가 있는 위치의 index를 얻어옴(=찾는 글자까지의 길이)
var startV =  url.indexOf("item")-1;
//모든 주소에서 해당 글자가 위치해있는 index에서 부터 글자를 자름
var action_path = url.substring(startV);
//alert("indexOf : "+startV);

//select요소
var $orderList =  $("#orderList");


//select요소 변경 될 때마다
function select_Change(){
	
	//폼 요소
	var $orderForm = $("#orderForm");
	
	//order파라미터 넘길 주소경로
	//alert("action_path : "+action_path);
	
	//파라미터를 넘길 맵핑 주소로 폼의 action을 설정
	$orderForm.attr("action",action_path);
	
	//form으로 파라미터 넘김
	$orderForm.submit();
}



//맨뒤에서부터 =를 검색해 가장 먼저 위치한 orderBy 값의 위치를 얻어옴
var sort_param = url.lastIndexOf("=")+1;
//alert("sort파라미터 : "+sort_param+"번째");

//orderBy의 값을 뽑음
var param = url.substring(sort_param);
//alert("param : " + param);


//초기값 select 옵션 선택
if(param=='highPrice' || param=='lowPrice' || param=='recentItem'){
		//값으로 select하기	
		$orderList.val(param);
	}else{
		$orderList.val('recentItem');
	}

</script>
</body>
</html>