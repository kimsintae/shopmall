<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${itemInfo.name}</title>
<c:import url="template/link.jsp"></c:import>
    <style>
        .overflow{
            overflow: hidden;
        }
        
       /*이미지 드래그 css*/     
        .dragme {
            position:relative;
            cursor: move;
        }
        #draggable {
            background-color: #ccc;
            border: 1px solid #000;
        }
        /* }} */
        
        
        .display_none{
            display: none;
        }
        .item_img_box{
            position: relative;
        }
        .exit_exit{
            position: absolute;    
            top: 50px;
            right: 0;      
            width: 100px;
            height: 30px;
            font-size: 15px;
            border: 1px solid #424242;
            text-align: center;
            line-height: 30px;
            font-weight: 700;
            background: rgba(255,125,0,.3);
        }
        .exit_exit:hover{
            cursor: pointer;
        }
        .item_img_box .img_part{
            width: 570px;
            height: 570px;
            /*background-color: blue;*/
        }
        #contents{
            min-height: 1000px;
            /*background-color: red;*/
        }

        #itemOptionWrap{
            width: 1000px;
            /*background: blue;*/
            min-height: 800px;
            margin: auto;
            margin-top: 10px;
        }
        .item_detail_option_wrap ul li{
            float: left;
        }
        .item_detail_option_wrap{
            min-height: 600px;
            /*background: yellow;*/
        }
        
        /* 왼쪽 옵션 박스 */
        .item_option_box{
            width: 180px;
        }
        .item_img_box{
            width: 570px;
            height: 570px;
            /*background: red;*/
            background: #F3F3F3;
            margin: 0 35px;
        }
        .img_part{
            overflow: hidden;*
        }
        .item_info_box{
            width: 160px;
            min-height: 199px;
            margin: 0 10px;
            border-bottom: 1px solid #424242;
            background: #F3F3F3;
            border-style: dotted;
        }
        .item_info_right_box{
            width: 160px;
            height: 169px;
            margin: 0 10px;
            border-bottom: 1px solid #424242;
            background: #F3F3F3;
            border-style: dotted;  
        }
        .item_name_price{
            /*background-color: chartreuse;*/
        }
        .item_img_option{
            /*background-color: darkslateblue;*/
        }
        .move_menu_box{
            /*background-color: firebrick;*/
            border-bottom: none;
        }
                
        .item_info_box h3,.item_info_right_box h3{
            font-size: 15px;
            height: 50px;
            font-weight: 600;
            /*background: red; */ 
            line-height: 50px;
            padding-left: 10px;
            text-align: justify;
        }
        
        .item_name,.item_price{
            padding-left: 10PX;
            font-size: 20px;

        }
        .item_price{
            font-size: 25px;
            margin-top: 50px;
            text-align: right;
            font-weight: 700;
        }
        .img_part_box{
            min-height: 200px;
            width: 160px;
            overflow: hidden;
        }
        .img_part_box li{
            width: 60px;
            height: 60px;
            margin:10px;
            float: left;
        }
        .img_part_box li:hover{
            border: 2px solid #424242;
            width: 56px;
            height: 56px;
            cursor: pointer;
        }
        .img_part_box li:hover img{
            width: 56px;
            height: 56px;
        } 
        .move_menu_box ul{
            height: 159px;
            padding-top: 39px;
            /*background: red;*/
        }
        .move_menu_box li{
            font-size: 15px;
            font-weight: 900px;
            margin-bottom: 10px;
            margin-left: 10px;
        }
        .move_menu_box li:hover{
            cursor: pointer;
            font-weight: 800;
        }
        
        /* 오른쪽 옵션 박스 */
        .item_quantity_option{
            /*background-color: deeppink;*/
            height: 100px;
            border-bottom: none;
        }
        .box_2{
            min-height: 200px;
            overflow: hidden;
        }
        .item_color_option{
        	
        }
        .item_color_option ul, .item_size_option ul{
            width: 160px;
            min-height: 160px;
/*             background:red; */
        }
        .item_color_option ul li, .item_size_option ul li{
            width: 43px;
            height: 43px; 
            margin-left: 8px;
            margin-top: 10px;
            float: left;
        }
        .item_color_option ul li:hover{
            cursor: pointer;
            background-color: white;
        }
        .item_size_option ul li:hover{
            cursor: pointer;
            background-color: black;
        }
        .item_color_option img{
            padding-left: 4px;
            padding-top: 4px;
        }
        .item_size_option label{
            width: 35px;
            height: 35px;
            display: block;
            color: black;
            background: white;
            font-size: 15px;
            text-align: center;
            line-height: 35px;
            font-weight: 600;
            margin-left: 4px;
            margin-top: 4px;
        }
        .item_size_option label:hover{
            cursor: pointer;
        }
        .size_on{
            background: red;
        }
        .color_on{
            background: red;
        }
        .quantity_box{
            height: 40px;
            /*background: red;*/
        }
        #quantity{
            display:inline-block;
            width: 80px;
            height: 20px;
            margin-left: 10px;
            vertical-align: middle;
            text-align: right;
            border: none;
            box-shadow: 1px 1px 2px #424242;
            
        }
        .quantity_btn_box{
            display: inline-block;
            margin-left: 20px;
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
        
        /* 사이드바 */
    
        .item_option_box .item_detail_sidebar{
            margin: 10px 10px;
            position: absolute;
        }
        .item_detail_sidebar ul{
            width: 160px;
            min-height: 100px;
            background: #E0E0E0;
            overflow: hidden;
        }
        .item_detail_sidebar li{
            width: 120px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            font-weight: 700;
            font-size: 15px;
            margin: 10px 20px; 
            border-bottom: 1px solid #424242;
        }
        .item_detail_sidebar li:last-child{
            border-bottom: none;
        }
        .item_detail_sidebar li:hover{
            cursor: pointer;
        }
        .fa-chevron-circle-up{
            font-size: 30px;
        }
        
        .recent_items_box{
           min-height: 200px;
           /*  background: red; */
        }
        .recent_items_box ul{
            width: 160px;
        }
        .recent_items_box li{
            border: none;
            height: 70px;
            margin: 5px 0;
        }
                
        #paginate{
/*            background: red;*/
            height: 40px;
        }
        
        #cartBtn,#wishListBtn{
        	border:none;
        	font-weight: 700;
            font-size: 15px;
        }
        #cartBtn:hover,#wishListBtn:hover{
        	cursor: pointer;
        }
        
        #buyBtn{
            margin-top: 10px;
        }
        #buyBtn a{
            text-decoration: none;
            color: white;
            display: block;
            height: 50px;
            font-size: 25px;
            text-align: center;
            line-height: 50px;
            background: #FF9800;
        }
        #buyBtn a:hover{
            cursor: pointer;
            color: black;
        }
        /* 아이템 상세 텍스트 정보 부분*/
        
        .item_detail_info_wrap{
            width: 570px;
            min-height: 600px;
            background-color: #ECEFF1;
            margin: auto;
            margin-top: 10px;
            
        }   
        .item_info_title{
            height: 50px;
            background-color: #607D8B;
            font-size: 20px;
            margin: 20px 0;
            line-height: 50px;
            font-weight: 900;
            position: relative;
        }
        #totalGrade{
            position: absolute;
            top: 0;
            right: 20px;
        }
        #totalGrade span{
            font-size: 30px;
            vertical-align: bottom;
            color: red;
        }
        .item_detail_box dl{
            padding: 15px;
        }
        .item_detail_box dl dt{
            font-weight: 700;
            margin-bottom: 5px;
        }
        .item_detail_box dl dd:last-child{
            font-weight: 800;
            font-style: italic;
        }
        
        .item_delivery_box{
            width: 536px;
            height: 457px;
            margin-left: 15px;
            background-image: url(/image/%EA%B2%B0%EC%A0%9C%20%EC%A0%95%EB%B3%B4.PNG);
        }
        .item_change_box{
            width: 536px;
            height: 1227px;
            background-image: url(/image/%EA%B5%90%ED%99%98%20%EC%A0%95%EB%B3%B4.png);
            margin-left: 15px;
        }
        .item_review_box{
            width: 570px;
            min-height: 100px;
           /* background: yellow;*/
        }
        
        .review_table,#writeReplyWrap{
            width: 550px;
            margin: 0 10px;
    /*        background: red;*/
            text-align: center;
        }
        
        .reply_content{
            padding: 0 5px;
        }
        #writeReplyWrap{
            min-height: 90px;
           /* background: red;*/
            margin-top: 20px;
            border-top: 1px solid #424242;
            padding-top: 10px;
        }
        
        #replyArea{
            margin-top: 5px;
            width: 550px;
            /*background: blue;*/
            height: 60px;
        }
        #replyArea textarea{
            width: 545px;
            height: 50px;
            border: 1px solid #424242;
            font-size: 15px;
        }
        .reply_btn{
            margin: 5px 0;
            transform: translateX(255px);
            background: white;
            border: none;
        }
        .reply_btn:hover{
            cursor: pointer;
        }
        .review_table thead td{
            font-size: 15px;
            height: 25px;
            line-height: 25px; 
            font-weight: 700;
            border-bottom: 1px solid #424242;
            border-style: dotted;
        }
        .review_table tbody tr{
            /*background: blue;*/
            height: 40px;
            line-height: 40px;
        }
        .review_no{
            width: 35px;
        }
        .review_like{
            width: 100px;
        }
        .satisfaction{
            height: 12px;
            position: relative;
            /*background: red;*/
        }
        .reply_grad_box{
            width: 100px;
            height: 12px;
            /*background: blue;*/
            position: relative;
        }
        .grade_box, .grade_btn_wrap{
            width: 100px;
            height: 12px;
            position: absolute;
/*            background: red;*/
            background-position: center;
            background-repeat: no-repeat;
        }
        .grade_off{
            background-image: url(/image/%EB%B3%84%EC%A0%90off.png);
        }
        .grade_on{
            overflow: hidden;
            background-image: url(/image/%EB%B3%84%EC%A0%90on.png);
            background-size: cover;
        }
        .grade_on_box{
            overflow: hidden;
            background-image: url(/image/%EB%B3%84%EC%A0%90on.png);
            background-size: cover;
        }
        .grade_btn{
            width: 10px;
            padding: 0;
            height: 12px;
            border: none;
            display: block;
            float: left;
            opacity: 0;
        }
        .grade_btn:hover{
            cursor: pointer;
        }
        
        #emptyReply{
            height: 100px;
            background: #ECEFF1;
            font-size: 20px;
            line-height: 100px;
        }
        
        .myReply_content{
        	color: red;
        	font-size: 15px;
        }
    </style>
</head>
<body>
    <c:import url="template/header.jsp"></c:import> 
    
    <div id="contents">
        
        <!-- 제품 상세 정보 보기 -->
        <div id="itemOptionWrap">
            <div class="item_detail_option_wrap">
                <ul>
                    <li>
                        <!-- 왼쪽 아이템 정보 박스-->
                        <div class="item_option_box">
                            <ul>
                                <li>
                                    <div class="item_info_box item_name_price">
                                        <h3>
                                            <span>${itemInfo.detailType}</span>/ <span>${itemInfo.detailType2}</span>
                                        </h3>                               
                                                                                
                                        <div class="item_name">
                                           <span>${itemInfo.name}</span>
                                        </div>
                                        <div class="item_price">
                                            <span><C:formatNumber value="${itemInfo.price}" groupingUsed="true"></C:formatNumber></span>원
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="item_info_box item_img_option">
                                        <h3>
                                            상품 이미지
                                        </h3>
                                        
                                        <div class="img_part_box">
                                            <ul>
                                            <c:forEach items="${images}" var="image">
                                                <li>
                                                    <img width="60" height="60" src="${image.image}" alt=""/>
                                                </li>
                                            </c:forEach>     
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="item_info_box move_menu_box">
                                        <ul>
                                            <li onclick="$('html, body').stop().animate( { scrollTop : '800' } ) " class="move_review"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> 고객상품평</li>
                                            <li onclick="$('html,body').stop().animate( { scrollTop : '1250' } )" class="move_item_info"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> 상품설명</li>
                                            <li onclick="$('html, body').stop().animate( { scrollTop : '1900'} )" class="move_delivery_info"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> 배송/결제 정보</li>
                                            <li onclick="$('html, body').stop().animate( { scrollTop : '2450'} )" class="move_change_info"><i class="fa fa-arrow-circle-down" aria-hidden="true"></i> 교환/반품 정보</li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div><!--//item_option_box1-->
                    </li>

                    <li>
                        <!-- 아이템 사진 박스-->
                        <div class="item_img_box ">
                            <div class="img_part ">
                            <img src="${itemInfo.image}" class=" " alt=""/>

                            </div>
                            
                            <div class="exit_exit display_none">
                                되돌아가기
                            </div><!--//exit_exit-->
                        </div><!--//item_img_box-->
                        <!-- 되돌리기에 사용되는 메인 사진-->
						<img id="hiddenMainImg" 
						src="${itemInfo.image}" hidden="hidden"/>
                    </li> 
                    
                    <li>
                        <!-- 오른쪽 아이템 정보 박스-->
                        <div class="item_option_box">
                           <ul class="box_2">
                                <li>
                                    <div class="item_info_right_box item_color_option">
                                        <h3>
                                            색상(color)
                                        </h3>
                                        
                                            <ul>
                                            <c:forEach items="${itemColors}" var="color">
                                                 <li><img class="item_image" width="35" height="35" src="${color.itemColor}" title="${color.colorName}" alt="${color.colorName}"/></li>
                                            </c:forEach>
                                            </ul>
                                    </div>
                                </li>
                                <li>
                                    <div class="item_info_right_box item_size_option">
                                        <h3>
                                            사이즈(size)
                                        </h3>
                                            <ul>
	                                            <c:forEach items="${itemSize}" var="size">
	                                                <li><label for="${size.itemSize}">${size.itemSize}</label><input type="radio" name="size" id="${size.itemSize}" value="${size.itemSize}" hidden="hidden" /></li>
	                               				</c:forEach>
                                            </ul>
                                        
                                    </div>
                                </li>
                                <li>
                                    <div class="item_info_right_box item_quantity_option">
                                        <h3>
                                            수량(quantity)
                                        </h3>
                                        <div class="quantity_box">
                                            <input type="text" name="quantity" id="quantity" maxlength="3" />
                                            <div class="quantity_btn_box">
                                            <button type="button" class="quantity_btn" id="quantityUp">
                                                <i class="fa fa-sort-asc" aria-hidden="true"></i>
                                                </button>
                                            <button type="button" class="quantity_btn" id="quantityDown">
                                                <i class="fa fa-sort-desc" aria-hidden="true"></i>
                                            </button>    
                                            </div><!--//quantity_btn_box-->                                
                                        </div><!--//quantity_box-->  
                                    </div><!--//item_info_right_box-->
                                </li>
                            </ul>
                            <div class="item_detail_sidebar fixed">
                               <ul>
                                    <li>
                                    <form id="mixform" action="/cart" method="post">
                                    <input type="hidden" name="userNo" value="${login.no}" />
                                    <input type="hidden" name="name" value="${itemInfo.name}" />
                                    <input type="hidden" name="price" value="${itemInfo.price}" />
                                    
                                    <!-- totalPrice로 계산될 상품 가격 -->
                                    <input type="hidden" name="total" value="${itemInfo.price}" />
                                    <input type="hidden" name="image" value="${itemInfo.image}" />
                                    <input type="hidden" name="itemColor" value="${color.colorName}" id="colorName"/>
                                    <input type="hidden" name="itemSize" value="${size.itemSize}" id="size"/>
                                    <input type="hidden" name="itemNo" value="${itemInfo.no}" />
                                    <input type="hidden" name="quantity" value="" id="quantityParam"/>
                                    <button id="cartBtn" type="submit">장바구니 담기</button> 
                                    </form>
                                    </li>
                                    
                                    <li>
                                    
                                    <form action="/wishList" method="post">
                                    <input type="hidden" name="userNo" value="${login.no}" />
                                    <input type="hidden" name="itemNo" value="${itemInfo.no}" />
                                    <input type="hidden" name="name" value="${itemInfo.name}" />
                                    <input type="hidden" name="price" value="${itemInfo.price}" />
                                    <input type="hidden" name="image" value="${itemInfo.image}" />
                                    <button id="wishListBtn" type="submit">관심상품 찜</button>
                                    </form>
                                    </li>
                                    <li class="recent_items">최근본 상품</li>
                                    <li class="recent_items_box display_none">
                                            <ul id="recentItemList">

                                            </ul>
                                    </li>
                                    <li><i onclick="$('html,body').stop().animate( { scrollTop : 0 } )" class="fa fa-chevron-circle-up" aria-hidden="true"></i></li>             
                               </ul>       
                                <div id="buyBtn">
                                <c:choose>
                                  <c:when test="${login!=null}">
                                   	<a onclick="purchase();">구매하기</a>  
                                   </c:when>
                                   
                                   <c:otherwise>
                                   	<a href="/login_mypage">구매하기</a>  
                                   </c:otherwise>
                                </c:choose>
     
                                </div>
                            </div><!--//item_detail_sidebar-->

                        </div><!--//item_option_box2-->
                    </li>
                </ul>

            </div><!--//item_option_wrap-->
            
            <!--아이템 상세 내용 텍스트 부분 -->
            
            <div class="item_detail_info_wrap">
                
                <!-- 아이템 후기 부분 -->
                <div class="item_info_title item_review_title">
                고객상품평
                    <div id="totalGrade">
                    <c:choose>
                    	<c:when test="${nullPoint!=null}">
                    	   만족도<span> 0</span>점
                    	</c:when>
                    
                    	<c:otherwise>
                    	   만족도<span>${avgGrade}</span>점 
                    	</c:otherwise>
                    </c:choose>  
                    </div>
                </div><!--//item_review_box-->
                
                <div class="item_detail_info_box item_review_box">

                        <table class="review_table">
                            <thead>
                                <th>
                                    <tr>
                                        <td class="review_no">번호</td>
                                        <td class="review_like">만족도</td>
                                        <td class="review_contents">내용</td>
                                        <td class="review_writer">작성자</td>
                                        <td class="review_write_date">작성일</td>
                                    </tr>
                                </th>
                            </thead>
                            
                            <tbody>
                            	<c:forEach items="${replies}" var="reply">
	                                <tr>
	                                    <td>${reply.replyNo}</td>
	                                    <td>
	                                        <div class="reply_grad_box">    
	                                            <div class="grade_box grade_off">
	                                            </div>   
	                                            <div style="width:${reply.grade*10}px; height:12px; position:absolute; overflow:hidden">
	                                                <div class="grade_box grade_on_box">
	                                                </div><!--//grade_box-->
	                                            </div>
	                                         </div><!--//reply_grad_box-->
	                                    </td>
	                                  <c:choose>
	                                    <c:when test="${login.nickName == reply.nickName}">
		                                    <td class="myReply_content">
		                                        ${reply.content}
		                                    </td>
	
		                                    <td class="myReply_content">${reply.nickName}</td>
	
		                                    <td class="myReply_content">${reply.realTime}</td>
	                                    </c:when>
	                                    <c:otherwise>
											<td class="reply_content">
		                                        ${reply.content}
		                                    </td>
	
		                                    <td>${reply.nickName}</td>
	
		                                    <td>${reply.realTime}</td>	                                    
	                                    
	                                    </c:otherwise>
									</c:choose>	                                 
	                                </tr>
                                </c:forEach>
	                            
	                            <!-- 등록된 댓글이 없을 때  -->
	                            <c:if test="${empty replies}">
		                            <tr>
		                                <td colspan="5">
		                                <div id="emptyReply">등록된 상품 댓글이 없습니다.</div>
		                                </td>
		                            </tr>
	                            </c:if>
                            </tbody>
                        </table>
                    <!-- 후기 작성란 -->
                        <div id="writeReplyWrap">
                        
                        		
                                <div class="satisfaction">    
                                            <div class="grade_box grade_off">
                                            </div>   
                                                
                                            <div class="grade_box grade_on" title="">
                                                <img src="/image/%EB%B3%84%EC%A0%90on.png" width="100" height="13" alt="평점" />
                                            </div>
                                            
                                    <form action="/insertReply/${itemInfo.no}" method="post">   
                                              <div class="grade_btn_wrap">
                                                <input class="grade_btn" value="1" title="1"/>
                                                <input class="grade_btn" value="2" title="2"/>
                                                <input class="grade_btn" value="3" title="3"/>
                                                <input class="grade_btn" value="4" title="4">
                                                <input class="grade_btn" value="5" title="5">
                                                <input class="grade_btn" value="6" title="6">
                                                <input class="grade_btn" value="7" title="7">
                                                <input class="grade_btn" value="8" title="8">
                                                <input class="grade_btn" value="9" title="9">
                                                <input class="grade_btn" value="10" title="10">
                                            </div>
                                                                     
                                 </div><!--//satisfaction-->
                            
                                <div id="replyArea">
                                    
	                                    <c:choose>
	                                    <c:when test="${login != null}">
	                                     <textarea name="content" id="writeReply" maxlength="200" placeholder="솔직한 후기를 남겨주세요 ^^"></textarea>
	                                     <button class="reply_btn" type="submit">등록</button> 
	                                    </c:when>
	                                    
	                                    <c:otherwise>
	                                         <textarea id="writeReply" maxlength="0" placeholder="로그인을 하셔야 작성 가능합니다."></textarea>
	                                    </c:otherwise>     
	                                    </c:choose>
      
                                    </form>
                                </div>
                        </div><!--//writeReplyWrap-->
                    
                </div><!--//item_review_box-->
                
                <!-- 상품 상세설명 부분 -->
                <div class="item_info_title">
                상품상세설명
                </div>
                
                <div class="item_detail_info_box item_detail_box">
                    <dl>
                        <dd>
    캐주얼한 스타일링을 연출하기에 제격인 보더 T셔츠입니다. 워싱 가공으로 보다 부드럽고 내추럴한 감촉을 느낄 수 있으며 바디와 소매 부분에 보더폭을 다르게 사용하여 디자인에 포인트를 주었습니다. 반소매 타입으로 더운 여름에 시원하게 즐기실 수 있습니다. 여성분들이 착용하실 때는, 소매를 롤업하여 연출하시면 한층 더 세련된 스타일링을 즐기실 수 있습니다. 
                        </dd>
                        <br />
                                <dd>
            ※ 해당 상품은, 온라인 스토어 및 일부 점포에서만 판매합니다.
                                </dd>
                                <dd>
            ※ 취급 점포에 따라 상품의 품절 및 판매일 변경이 될 수 있습니다.
                                </dd>
                                <dd>
            ※ 모니터사양에 따라 상품의 색상 및 무늬 등이 실제 상품과 다소 차이가 날 수 있습니다.
                                </dd>
                                <dd>
            ※ S'shopMall 온라인 스토어에서 구입한 상품은 점포에서 반품할 수 없습니다. 
                                    (온라인에서 구입한 상품은, 온라인에서만 반품을 받습니다.)
                                </dd>
                        <br />
                        <dt>
                            세탁 및 취급 주의사항세탁기
                         </dt>    
                                    <dd>
                                        · 상품에 부착된 케어라벨을 참조하여 세탁하여 주십시오.
                                    </dd>  
                                    <dd>
                                        · 짙은 색상은 이염의 우려가 있으니 단독 세탁하여 주십시오.
                                    </dd>
                                    <dd>
                                        · 형광증백제가 들어있지 않은 세제를 사용하여 주십시오.
                                    </dd>
                                    <dd>
                                        · 건조기 사용은 피해 주시고, 장시간 물에 담가두지 마십시오.
                                    </dd>
                                    <dd>
                                        · 화기에 접근하면 털에 불이 옮겨 붙을 수 있으니 주의하십시오.
                            </dd>
                        <br />
                        <dt>
                            품질보증기준
                        </dt>
                                    <dd>        
        · 본 제품은 철저한 품질관리와 공정관리를 거쳐 생산되었으며, 엄격한 검사에 합격한 제품입니다.
                                    </dd>
                                    <dd>
                                    · 제품에 표시되어 있는 섬유 혼용율, 치수, 세탁법을 착용 전에 반드시 확인해 주십시오.
                                    </dd>
                                    <dd>
                                    · 만약 품질에 이상이 있어 피해보상을 원하실 때는 S'shopMall 고객센터로 연락하여 주십시오.
                                    </dd>
                                    <dd>
                                        · 본 제품의 품질보증기간은 구입일로부터 1년입니다.
                                    </dd>
                        <br />
                        <dt>
                            업체명
                        </dt>
                                    <dd>
                                        S'shopMall
                                    </dd>
                        <br />
                        <dt>
                            고객센터 전화번호
                        </dt>
                                    <dd>
                                        010-6306-7511
                                    </dd>
                    </dl>
                </div><!--//item_detail_box-->
                
                <!-- 상품 배송/결제 부분 -->
                <div class="item_info_title item_delivery_title">
                배송/결제 부분
                </div>
                
                <div class="item_detail_info_box item_delivery_box">
                    
                </div><!--//item_delivery_box-->
                
                <!-- 상품 교환/반품 부분 -->
                <div class="item_info_title item_change_title">
                교환/반품 부분
                </div>
                
                <div class="item_detail_info_box item_change_box">
                    
                </div><!--//item_change_box-->
            </div><!--//item_detail_info_wrap-->
        </div><!--//itemOptionWrap-->
    </div><!--//contents-->
    
<c:import url="template/footer.jsp"></c:import>
   
    <script src="/js/jquery.js"></script>
    <script src="/js/template.js"></script>
    <script>
    
   // alert("로그인 유저 번호 : "+'${login.no}');

         var $img_part= $(".img_part img");
        //드래그 엔 드롭 스크립트
        
        //마우스 눌르면 실행되는 함수
     function startDrag(e) {
            // determine event object
            if (!e) {
                var e = window.event;
                
            }
                
            // IE uses srcElement, others use target
            var targ = e.target ? e.target : e.srcElement;

            if (targ.className != 'dragme') {return};
            // calculate event X, Y coordinates
                offsetX = e.clientX;
                offsetY = e.clientY;
         //alert("상하좌표값:"+ offsetY+" 좌우좌표값"+offsetX);
            // assign default values for top and left properties
            if(!targ.style.left) { targ.style.left='0px'};
            if (!targ.style.top) { targ.style.top='0px'};
            
            // calculate integer values for top and left 
            // properties
            coordX = parseInt(targ.style.left);
            coordY = parseInt(targ.style.top);
/*            console.log("left= "+coordX+" top= "+coordY);
            if(coordX > 0 || coordX < -431 || coordY >0 || coordY < -328){
                //alert("그만움직이시죠?");
            }*/
                drag = true;
            
            // move div element
                document.onmousemove=dragDiv;

        }
        function dragDiv(e) {
            if (!drag) {return};
            if (!e) { var e= window.event};
            var targ=e.target?e.target:e.srcElement;
            // move div element
            targ.style.left=coordX+e.clientX-offsetX+'px';
            targ.style.top=coordY+e.clientY-offsetY+'px';
            return false;
        }
        function stopDrag() {
            drag=false;
        }
        window.onload = function() {
            document.onmousedown = startDrag;
            document.onmouseup = stopDrag;
        }

        // 이미지 보기 선택 스크립트 
        var $exit_exit =  $(".exit_exit");
        $(".img_part_box li img").click(function(){
            
            //img 경로를 뽑음
            var src = $(this).attr("src");
            //alert(src);
            $(".dragme").removeClass("dragme");
            $img_part.attr("src",src);
            $img_part.addClass("dragme");
            //되돌아가기 버튼 나타남
            $exit_exit.css("display","block");
        })//click end
    

        //상세 이미지 되돌아가기 스크립트
        $exit_exit.click(function(){
                //보여질 메인 사진
           var $img = $(".img_part img"),
               //숨겨진 메인 사진 이미지 경로
               $hidden = $("#hiddenMainImg"),
               img570_src= $hidden.attr("src");
            $(".dragme").removeClass("dragme");
            $img.attr("src",img570_src);
            $exit_exit.css("display","none");
        })

        
        //색상 클릭시 효과 스크립트
        $(".item_color_option li").click(function(){
            $(".color_on").removeClass("color_on");
            $(this).addClass("color_on");
        })
        
        
        //수량 선택 스크립트
        var quantity = 0
        $("#quantityUp").click(function(){
            //alert("test");
            quantity +=1
            
            $("#quantity").val(quantity); 
        })
        
        $("#quantityDown").click(function(){
            //alert("test");
            quantity -=1
            if(quantity < 1){
                quantity -= quantity
                alert("최소 1개이상 선택 하셔야합니다.")
            }else{
                $("#quantity").val(quantity);
            }   
            
        })
        
        /* 평점 주기 */
        var $grade_btn = $(".grade_btn");
        
        $grade_btn.mouseover(function(){
        
            //인덱스를 1부터 시작
         grade_idx= $(this).index()+1
            //인덱스에 10을 곱해서 별점 div의 너비가 될 수를 구함
         grade_idx_now =  grade_idx*10;
         //alert(grade_idx_now);
        
        $(".grade_on").css("width",grade_idx_now);    
        })
        
        $(".recent_items").click(function(){
            //alert("test");
            $(".recent_items_box").slideToggle(500);
        })
        
        
        //사이드바 내려오기
        $(window).scroll(function(){
            
            var $item_detail_sidebar = $(".item_detail_sidebar");
            
             var location = $(this).scrollTop();
             //console.log(location);
            
            if(location >= 635){   
                //스크롤 내렸을때 
                $item_detail_sidebar.css("position","fixed")
                                    .css("top",0);
            }else{
                //스크롤 올렸을 때
                $item_detail_sidebar.css("position","absolute")
                                    .css("top",620);
            }
                
        })
        
        //평점 클릭시 파라미터 보내기
        var $input =  $(".grade_btn_wrap input");
        $input.click(function(){
        	//모든 input의 name속성을 지움
        	$input.removeAttr("name");
        	//클릭한 input에 name속성을 설정
        	$(this).attr("name","grade");
        	
        })
         
        
       //색상 클릭시 색상명 파라미터 담기
       $(".item_color_option img").click(function(){
    	   //색상명 뽑기
    	   var title = $(this).attr("title");
    	   //alert(title); 
    	   $("#colorName").attr("value",title);
    	   
    	   
       })
       
               
        //사이즈 클릭시 효과 및 파라미터 담기
        $(".item_size_option label").click(function(){
            $(".size_on").removeClass("size_on");
            $(this).parent('li').addClass("size_on");
            var size = $(this).next().attr("id");
            $("#size").attr("value",size);

            
        })
        
        var $quantityBtn = $(".quantity_btn");
        $quantityBtn.click(function(){
        	var quantity = $("#quantity").val();
        	$("#quantityParam").attr("value",quantity);
        	
        })

        
      //최근 본 상품 세션 스토리지
var recent_items;
        
function recent_item(){
/* 	
 	//상품 번호, 이름, 사진을 객체로 저장
	recent_items = {"no":'${itemInfo.no}',"name":'${itemInfo.name}',"image":'${itemInfo.image}'}
	
	//객체로 저장된 상품을 세션에 저장
    sessionStorage.setItem("recent_item"+'${itemInfo.no}', JSON.stringify(recent_items));  */	
  
 	//세션에 데이터가 비어 있을경우 객체 넣기
 	var data = sessionStorage.getItem("recent_item");
 	
 	//세션에 데이터가 있을 경우 push
    if(data){
    	
    	//alert("들어있음")
    	//데이터가 있을 경우 json으로 파싱
    	data = JSON.parse(data);
    	//alert("사이즈 : "+data.length);
    	
    	var itemNo = '${itemInfo.no}';
    	
    	//중복될 번호들을 따로 뽑아
    	//배열에 넣고 값을 비교 한후
    	//중복이 되지 않으면 객체 삽입
    	var no = [];
    	for(var i = 0; i < data.length; i++){
    		no.push(data[i].no);
    	}
    	
    	var idxOf = no.indexOf(itemNo);
    	//alert("중복 결과 : "+idxOf);
    	
    	
    	if(idxOf<0){
    		//중복안되면
        	//새로운 객체를 맨앞에 넣음
        	//alert("중복안됨")
        	data.unshift({
       			"no":'${itemInfo.no}',
       			"name":'${itemInfo.name}',
       			"image":'${itemInfo.image}'
       			 });
    	}else{
    		//중복되면 아무일도 안함
    		//alert("중복됨");
    	};//if
    	//alert("성공");
    	
    }else{
    	
    //세션에 데이터가 없을 경우 
    //새로운 배열 생성후
    //객체를 넣어줌
    	alert("비어있음")
    	data=[{
   			"no":'${itemInfo.no}',
   			"name":'${itemInfo.name}',
   			"image":'${itemInfo.image}'
   			 }];
    }//if
    
    //준비된 data배열을 넣음
    sessionStorage.setItem("recent_item", JSON.stringify(data));
}     



function get_recent_item(){

	
	var $recentItemList = $("#recentItemList");
	
/* 	alert("받아온 길이 : "+sessionStorage.length);
	var items = sessionStorage.getItem("recent_item");
	var realitem = JSON.parse(items);
	alert(realitem[0].name); */
	
	
	var items = sessionStorage.getItem("recent_item");
	//alert(key)
	
	var realitem = JSON.parse(items);
	
	//파싱된 객체의 길이로 for문 돌리기
 	for (var i = 0; i < realitem.length; i++) {
		var no = realitem[i].no;
		var name = realitem[i].name;
		var image = realitem[i].image;

		var li = "<li><a href='/item_detail/"+no+"'><img width='70' height='70' src='"+image+"' alt='' title='"+name+"' /></a></li>";

		//ul에 붙이기
		$recentItemList.append(li);
		
	}
	
}

recent_item();
get_recent_item();

//바로 구매하기

function purchase(){
	
	//alert("test");
	
	$mixform =  $("#mixform");
	
	$mixform.attr("action","/fastPurchase");

	$mixform.submit();

}

</script>
    
    <!-- 로그인 안되있을 시 댓글 처리 -->
    <c:if test="${login==null}">
    	<script type="text/javascript">
    	 var $writeReply = $("#writeReply");
    	 
    	 $writeReply.click(function(){
    		
    		 if(confirm("로그인 하시겠습니까?")==true){
        		location.href="/login";
        	}else{
        		return false;
        	};
        })   
        </script>
        
    </c:if>
    
    
    
    <!-- 장바구니 담기 성공시 메세지-->
    <c:if test="${cartMsg!=null}">
    <script type="text/javascript">
    	alert('${cartMsg}');
    </script>
    </c:if>
    
    <!-- 관심상품 등록 성공시 메세지-->
    <c:if test="${wishListMsg!=null}">
    <script type="text/javascript">
    	alert('${wishListMsg}');
    </script>
    </c:if>
    
    <!-- 관심상품 중복 메세지-->
    <c:if test="${duplicationMsg!=null}">
    <script type="text/javascript">
    	alert('${duplicationMsg}');
    </script>
    </c:if>
</body>
</html>