<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품구매</title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/noto.sans.korea.css" />
    <link href='https://fonts.googleapis.com/css?family=Bad+Script' rel='stylesheet' type='text/css'>
    
    <style>
        #contents{
            width: 1000px;
            /*background: red;*/
            margin: auto;
            margin-top: 50px;
            margin-bottom: 20px;
            position: relative;
        }
        
        #orderProcessWrap{
            width: 700px;
            /*background: blue;*/
        }
        
        h1{
            width: 1000px;
            height: 100px;
            margin: auto;
            line-height: 100px;
           /* background: yellow;*/
            font-size: 50px;
            text-align: center;
            border-bottom: 1px solid #424242;
        }
        .order_item_table,.order_address_table,.payment_table{
            width: 700px;
            border: 1px solid #424242;
        }
        .order_item_table thead tr{
            font-size: 15px;
            background-color: #BDBDBD;
            height: 30px;
            line-height: 30px;
            text-align: center;
            font-weight: 700;
            letter-spacing: 10px;
        }
        .order_item_table tbody tr{
            /*background-color: darkred;*/
            text-align: center;
            height: 50px;
        }
        .order_item_table tbody tr td{
            height: 40px;
            line-height: 20px;
            vertical-align: middle;
            padding:10px;
            font-size: 15px;
        }
        .order_item_table tfoot tr{
            height: 100px;
            border-top: 1px solid #424242;
            border-style: dashed;
            line-height: 100px;
            font-weight: 800;
        }
        .total_info{
            font-size: 35px;
            text-align: center;
        }
        .total_amount{text-align: right;}
        .order_process_box_title{font-size: 30px;}
        
        /* 배송지 부분*/
        .delivery_address,.payment_box{
            margin-top: 100px;
        }
        .order_address_table tbody td{
            /*background-color: forestgreen;*/
            font-size: 15px;
            text-align: left;
            padding:10px;;
            font-weight: 800;
        }
        .order_address_table tbody tr:nth-child(1){background-color: darkseagreen;}
        .order_column1{width: 150px;}
        .update_address_btn{
            text-decoration: none;
            color: black;
            position: absolute;
            right: 15px;
            top:45px;
        }
        .update_address_btn:hover{cursor: pointer;}

        /* 결제 부분 */
        .payment_table td{
            font-size: 20px;
            padding: 10px;
        }
        .payment_table span{font-size: 15px;}
        .payment_selector{width: 200px;}
        .payment_column1{width: 120px;}
        
        /* 총금액 창 */
        .total_amount_info_box{
            width: 270px;
            height: 300px;
            position: absolute;
            top: 37px;
            right: 0;
            margin: 0 15px;
            border: 1px solid #424242;
            border-radius: 5px;
            /*background-color:aquamarine; */
        }
        .total_amount_info_box .total_amount_info{
            width: 270px;
            height: 110px;
            /*background: yellow;*/
            border-bottom: 1px solid #424242;
            border-style: dashed;
        }
        .total_amount_info ul{margin-top: 10px;}
        .total_amount_info li{
            font-size: 20px;
            padding: 20px 0 0 10px;
        }
        .total_amount_box{
            width: 270px;
            height: 110px;
            /*background-color: chartreuse;*/
        }
        .total_amount_box li:nth-child(1){
            font-size: 20px;
            text-align: right;
            padding: 10px 10px 0 0;
        }
        .total_amount_box li:nth-child(2){
            font-size: 40px;
            padding: 10px 10px 0 0;
            text-align: right;
            color: red;
        }
        .payment_btn_box{
            width: 270px;
            height: 50px;
           /* background: blue;*/
            margin-top: 20px;
            position: relative;
        }
        #paymentBtn{
            right: 0;
            background-color: darkorange;
            border:none;
        }
        #backMypageBtn{
            left: 0;
            background-color: darkseagreen;
        }
        #paymentBtn,#backMypageBtn{
            width: 135px;
            height: 50px;
            font-size: 25px;
            position: absolute;
            text-align: center;
            line-height: 50px;
            text-decoration: none;
            display: block;
            color: black;
        }
        
        #paymentBtn:hover{cursor: pointer;}
        .none{display: none;} 
        #searchAddress:hover{cursor: pointer;}
        #mainAddress,#detailAddress{width: 300px;}
        #addressUpdateBox{position: relative;}
        #deliveryMsg{font-size: 15px;}
    </style>
</head>
<body>
    <h1>ORDER</h1>
<div id="contents">
    <div id="orderProcessWrap">
        <div class="order_item">
            <h2  class="order_process_box_title">1.주문하시는 상품</h2>
            <table class="order_item_table">
                <thead>
                    <tr>
                        <td>상품</td>
                        <td>상품상세</td>
                        <td>판매가</td>
                        <td>수량</td>
                        <td>소계</td>
                    </tr>
                </thead>

                <tbody>
                
	                <c:forEach items="${itemList}" var="checkedItem">
	                    <tr>
	                        <td>
	                            <a href="/item_detail/${checkedItem.itemNo}">
	                                <img width="100" height="100" src="${checkedItem.image}" alt=""/>
	                            </a>
	                        </td>
	                        <td>
	                                    name : <span class="cart_item_info">${checkedItem.name}</span><br/>  
	                                    size : <span class="cart_item_info">${checkedItem.itemSize}</span><br/>  
	                                    color : <span class="cart_item_info">${checkedItem.itemColor}</span>  
	                        </td>
	                        <td><fmt:formatNumber value="${checkedItem.price}" groupingUsed="true"></fmt:formatNumber> </td>
	                        <td>${checkedItem.quantity}개</td>
	                        <td>
	                        	<span class="partTotal"><fmt:formatNumber value="${checkedItem.eachItemTotalPrice}" groupingUsed="true"></fmt:formatNumber></span>
	                        </td>
	                    </tr> 
	                </c:forEach>               
                </tbody>
            </table><!--//order_item_table-->
            <span id="deliveryMsg">5만원 이상 주문시 택배무료 !!</span>
        </div><!--//orderItemBox-->

        <div class="delivery_address">
            <h2 class="order_process_box_title">2.주문고객/배송지 정보</h2>
            <table class="order_address_table">
                <tbody>
                    
                    <tr>
                        <td class="order_column1">주문하시는분</td>
                        <td>${login.nickName}(보내시는 분: ${login.nickName})</td>
                  	    <td>·${login.phone}</td>
                    </tr>
               
                <!-- 배송지 수정 -->
                <div id="addressUpdateBox">     
                    
                    <button class="update_address_btn" type="button">배송지 변경</button>
                    
                    <tr class="delivery_address_update none">
                        <td>받으시는분</td>
                        <td><input id="changeRecipient" class="change" style="width: 80px" type="text" /></td>
                    </tr>
                    
                    <tr class="delivery_address_update none">
                        <td class="order_column1">연락처</td>
                        <td><input id="changePrePhone" class="change"  type="text" style="width:40px;" maxlength="3"/> -
                        <input id="changeMidPhone" class="change" type="text" style="width:50px;" maxlength="4" /> -
                        <input id="changeLastPhone" class="change" type="text" style="width:50px;" maxlength="4" /></td>
                    </tr>
                    
                    <tr class="delivery_address_update none">
                       
                        <td class="order_column1">배송지 주소</td>
                       
                        <td >
                        
		                         <input type="text" 
		                           id="postcode"
		                           class="change" 
		                           placeholder="우편번호">    
		                            
		                        <input type="button" 
		                           id="searchAddress" 
		                           onclick="sample6_execDaumPostcode()" 
		                           value="주소 검색"><br/>
		                            
		                        <input type="text" 
		                           id="mainAddress" 
		                           class="change"
		                           name="main_address" 
		                           placeholder="주소"><br/>
		                            
		                        <input type="text" 
		                           id="detailAddress" 
		                           class="change"
		                           name="detail_address" 
		                           placeholder="상세주소">
		                           
                   		 </td>
                    </tr>

					<tr class="delivery_address_update none"> 
					<td></td>
					<td><button id="updateAddressBtn" onclick="updateAddress();">확인</button></td> 
					</tr>
               
				</div><!--//addressUpdateBox-->       
                    <!-- // 배송지 수정 -->
                    
              
                    <tr class="recipient">
                        <td class="order_column1">받으시는분</td>
                        <td><span id="recipientName">${login.nickName}</span></td>
                    </tr>

                    <tr>
                        <td class="order_column1">연락처</td>
                        <td>
                        <span id="prePhone">${login.prePhone}</span> - 
                        <span id="midPhone">${login.midPhone}</span> - 
                        <span id="lastPhone">${login.lastPhone}</span>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="order_column1">배송지 주소</td>
                        <td colspan="2">
                        	 (<span id="outputPostCode">${login.postCode}</span>)
                            <span id="outputMainAddress">${login.mainAddress}</span><br/>
                            <span id="outputDetailAddress">${login.detailAddress}</span>
                        </td>
                    </tr>
                </tbody>
            </table><!--//order_address_table-->
        </div><!--//delivery_address-->
        
        <div class="payment_box">
            <h2 class="order_process_box_title">3.신용 카드 결제</h2>
                <table class="payment_table">

                        <tr>
                            <td class="payment_column1">카드종류</td>
                            <td>
                                <select class="payment_selector">
                                    <option checked>카드선택</option>
                                    <option>롯데카드</option>
                                    <option>신한카드</option>
                                    <option>비씨카드</option>
                                    <option>국민카드</option>
                                    <option>삼성카드</option>
                                    <option>현대카드</option>
                                    <option>한화카드</option>
                                    <option>농협NH카드</option>
                                    <option>시티카드</option>
                                    <option>우리카드</option>
                                    <option>수협카드</option>
                                    <option>전북카드</option>
                                    <option>제주카드</option>
                                    <option>광주카드</option>
                                </select><br />
                                <span>* 카드에 BC마크가 있는 경우, 발급은행과 관계없이 BC카드를 선택</span><br />
                                <span>* 구LG카드는 신한카드를 선택</span>
                            </td>
                        </tr>

                        <tr>
                            <td class="payment_column1">할부선택</td>
                            <td><input type="radio" name="chekcard" id="paymentMethod1" checked="checked" />일시불 <input type="radio" name="chekcard" id="paymentMethod2" />일반할부 <input type="radio" name="chekcard" id="paymentMethod3" />무이자할부</td>
                        </tr>

                        <tr>
                            <td class="payment_column1">할부기간</td>
                            <td>
                                <select class="payment_selector">
                                    <option>개월수 선택</option>
                                    <option>일시불</option>
                                    <option>3개월</option>
                                    <option>6개월</option>
                                    <option>12개월</option>
                                </select>
                            </td>
                        </tr>
                </table><!--//payment_table-->
        </div>
    </div><!--//orderProcessWrap-->
        <div class="total_amount_info_box">
            <div class="total_amount_info">
                <ul>
                    <li>결제금액 : <span><fmt:formatNumber value="${finalPrice}" groupingUsed="true"></fmt:formatNumber></span></li>
                    <li>배송금액 : <span id="deliveryFee">2,500</span></li>
                </ul>
            </div>
            <div class="total_amount_box">
                <ul>
                    <li>총 결제 금액</li>
                    <li><span id="finalTotalPrice"></span>원</li>
                </ul>
            </div><!--//total_amount_box-->
            <div class="payment_btn_box">
                <a id="backMypageBtn" href="/mypage">장바구니</a>
                
                <!-- 삭제될 번호와 주문테이블에 삽입될 파라미터들 넘김 -->
               <button onclick="get_buy();" id="paymentBtn">결제하기</button>
                
               <form id="purchaseForm" action="/purchase_end" method="post">
                <c:forEach items="${itemList}" var="checkedItem">
                	<!-- 삭제될 번호 -->
                	<input type="hidden" name="deleteNo" value="${checkedItem.no}" />
                	
                	<!-- 주문테이블 삽입될 파라미터들 -->
                	<input type="hidden" name="itemNo" value="${checkedItem.itemNo}" />
                	<input type="hidden" name="name" value="${checkedItem.name}" />
                	<input type="hidden" name="price" value="${checkedItem.price}" />
                	<input type="hidden" name="image" value="${checkedItem.image}" />
                	<input type="hidden" name="quantity" value="${checkedItem.quantity}" />
                </c:forEach>
                    <input type="hidden" name="orderCode" value="" id="userId"/>
               		<input type="hidden" name="mainAddress" value="${login.mainAddress}" id="mainAddressParam"/>
               		<input type="hidden" name="detailAddress" value="${login.detailAddress}" id="detailAddressParam"/>
               		<input type="hidden" name="postCode" value="${login.postCode}" id="postCodeParam"/>
               		<input type="hidden" name="phone" value="${login.phone}" id="phone"/>
               		<input type="hidden" name="recipient" value="${login.nickName}" id="recipient"/>
               </form><!-- //purchaseForm -->         
            </div>
      </div><!--//total_amount_info_box-->

</div><!--//contents-->
<c:import url="template/footer.jsp"></c:import>
    
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>     
<script src="js/jquery.js"></script>    
<script>
        //사이드바 내려오기
        $(window).scroll(function(){
            
            var $total_amount_info_box = $(".total_amount_info_box");
            
             var location = $(this).scrollTop();
             console.log(location);
            
            if(location >= 186){   
                //스크롤 내렸을때 
                //alert("css를 fixed로 변경합니다.")
                $total_amount_info_box.css("position","fixed")
                                      .css("right",175).css("top",0);
            }else{
                //스크롤 올렸을 때
                $total_amount_info_box.css("position","absolute")
                                      .css("right",0).css("top",37);
            }
                
        })
   
        var $delivery_address_update = $(".delivery_address_update");
    
        $(".update_address_btn").click(function(){
            //alert("test");
            $delivery_address_update.toggleClass("none");
            
        })
        
          function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 
                //실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 
                //이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' +
                                      data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 
                    //양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').
                value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mainAddress').
                value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('detailAddress').
                focus();
            }
        }).open();
    }
       
    
    var $updateBtn = $("#updateAddressBtn"),
    	$changeRecipient = $("#changeRecipient"),
    	$postCode = $("#postcode"),
    	$mainAddress = $("#mainAddress"),
    	$detailAddress = $("#detailAddress"),
		$changePrePhone = $("#changePrePhone"),
		$changeMidPhone = $("#changeMidPhone"),
		$changeLastPhone = $("#changeLastPhone");
  
    //배송지 변경
	function updateAddress(){

    	if(confirm("배송지 변경을 하시겠습니까?")){
        	var postCode = $postCode.val(),
        	    mainAddress = $mainAddress.val(),
        	    detailAddress = $detailAddress.val(),
        	    changePrePhone = $changePrePhone.val(),
        	    changeMidPhone = $changeMidPhone.val(),
        	    changeLastPhone = $changeLastPhone.val(),
        	    changeRecipient = $changeRecipient.val(); 
				
        	document.getElementById('recipientName').innerHTML = changeRecipient;
        	document.getElementById('outputPostCode').innerHTML = postCode;
        	document.getElementById('outputMainAddress').innerHTML = mainAddress;
        	document.getElementById('outputDetailAddress').innerHTML = detailAddress;
        	document.getElementById('prePhone').innerHTML = changePrePhone;
        	document.getElementById('midPhone').innerHTML = changeMidPhone;
        	document.getElementById('lastPhone').innerHTML = changeLastPhone;
        	$(".change").val('');
        	
        	
        	
        	 //==========================================배소지 수정이 될때 보낼 받는사람 파라미터도 바뀜===============================
        	 
        	   //값 붙여넣을 input
        	   var $postCodeParam = $("#postCodeParam");
        	   var $mainAddressParam = $("#mainAddressParam");
        	   var $detailAddressParam = $("#detailAddressParam");
        	   var $recipient = $("#recipient");
        	   var $phone = $("#phone");
        	   
        	   //폰번호 가공
        	   var phone = changePrePhone+changeMidPhone+changeLastPhone;
        	   
        	   alert("입력될"+phone);
        	   //vaule값으로 넣기
        	   $postCodeParam.attr("value",postCode);
        	   $mainAddressParam.attr("value",mainAddress);
        	   $detailAddressParam.attr("value",detailAddress);
        	   $recipient.attr("value",changeRecipient);
        	   $phone.attr("value",phone);
        	   
        	   
        	   
    	}else{
    		return false;
    	}
    	
    	alert($detailAddressParam.attr("value"));
    }
    
   var $purchaseForm = $("#purchaseForm");

  
   function get_buy(){
	   //alert("다른폼을 보내버림");
	   $purchaseForm.submit();
   }
   
   
   
   //================================주문코드 생성============================
	   
   var $id  = '${login.id}';
   var id;
   var $userId = $("#userId");
   var orderCode;
   var code;
   var ranNum;
   var nums = [];

   for(var i = 1; i<9 ; i++){
	   //8자리 난수 발생
	   ranNum = Math.floor(Math.random() * 9) + 1;
	  
	   //6개의 난수를 nums배열에 넣음
	   nums.push(ranNum)
   }
   
   	//배열의 6개의 값을 가공처리함 ex)123456
    code = nums.toString().replace(/,/gi,"");
    
    //아이디 앞 3자리 표시
    id = $id;
    
   	//주문코드 완성
    orderCode = id+code;

   	//주문코드 파라미터로 넘어갈  value 값에 넣어줌
    $userId.attr("value",orderCode);
    
   //	alert(itemChecked.length);
   	
   // alert("value값 : "+$userId.attr("value"));
   
   
   
  
</script>

	<!-- 배송 무료 여부  -->
	<c:if test="${freeMsg==null}">
			<script type="text/javascript">
				
				var $finalTotalPrice = $("#finalTotalPrice");
			
				$finalTotalPrice.text('${finalPrice}');
				
				//text값을 int로 바꿈
				var price = parseInt($finalTotalPrice.text());
				
				price = price+2500;
				
				//2500배송비 더해져서 span안에 값 대입;
				$finalTotalPrice.text(price);
			
			</script>
	</c:if>
		<c:if test="${freeMsg!=null}">
			<script type="text/javascript">
				
				var $finalTotalPrice = $("#finalTotalPrice");
			
				
				$finalTotalPrice.text('${finalPrice}');
				
				//배송무료시 무료
				$("#deliveryFee").text('${freeMsg}').css("color","red");
				
			
			</script>
	</c:if>
	
	
</body>
</html>