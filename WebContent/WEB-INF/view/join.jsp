<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>당신의 날개를 달아주는 S'shopMall</title>
<c:import url="template/link.jsp"></c:import>
    <style>
        .blind {
            visibility: hidden;
            overflow: hidden;
            position: absolute;
            top: 0;
            left: 0;
            width: 1px;
            height: 1px;
            font-size: 0;
            line-height: 0;
        }
        
        #joinHeader{
            width: 888px;
            height: 90px;
            margin: auto;
            margin: 10px auto;
            position: relative;
        }
        
        #joinHeader h1{
            width: 300px;
            height: 80px;
            text-align: center;
            line-height: 80px;
            font-size: 50px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -40px;
            margin-left: -150px;
        }
        #joinHeader h1 a{
            text-decoration: none;
            color: black;
            font-family: 'Bad Script', cursive;
        }
        #joinContents{
            width: 888px;
            min-height: 650px;
            margin: auto;
        }
        .join_form,.join_wrap{
            width: 500px;
            min-height: 650px;
            margin: auto;
        }
    
        #joinFirstArea{
            width: 498px;
            min-height: 239px;
            border: 1px solid #424242;
            border-bottom: none;
            background-color: white;
        }
        
        #idCheck{
            background: white;
            width: 100px;
            height: 40px;
            color: black;
            text-decoration: none;
            font-size: 20px;
            text-align: center;
            line-height: 40px;
            font-weight: 800;
            border: 1px solid #424242;
        }
        #idCheck:hover{ cursor: pointer;}
        
        #joinSecondArea{
            width: 498px;
            min-height: 240px;
            background-color: red;
            margin-top: 20px;
            margin-bottom: 20px;
            border: 1px solid #424242;
            border-bottom: none;
        }
        #joinBtnBox{
            width: 498px;
            height: 78px;
            background-color: white;
            border: 1px solid #424242;
        }
        
        #joinBtnBox ul li{
            float: left;
            width: 248px;
            height: 78px;
            position: relative;
        }
        #joinBtnBox .join_btn{
            width: 140px;
            height: 50px;
            font-size: 25px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-top: -25px;
            margin-left: -70px;
            border: none;
            font-weight: 800;
            background-color: white;
        }
        #joinBtnBox .join_btn a{
            text-decoration: none;
            color: black;
            display: block;
            width: 140px;
            height: 50px;
            line-height: 50px;
        }
        #joinBtnBox .join_btn:hover{
            cursor: pointer;
            border: 1px solid #424242;
            background-color: bisque;
        }
        .join_first{
            width: 500px;
            min-height: 79px;
            position: relative;
            border-bottom: 1px solid #424242;
        }
        
        .join_first .fa-lock,.join_first .fa-check-circle-o,.join_second .fa-mobile,.join_second .fa-user{
            color: black;
            position: absolute;
            font-size: 35px;
            top: 25px;
        }
        .join_first .fa-lock{   
            right: 13px;
        }
        .join_first .fa-check-circle-o{
            right: 8px;
        }
        .join_second .fa-mobile{
            right: 14px;
            top: 14px;
        }
        .join_second .fa-user{
            right: 8px;
            top: 12px;
        }
        .join_first input,.join_second input{
            width: 350px;
            border: none;
            font-size: 20px;
            font-weight: 600; 
            margin-left: 10px;
        }
        .join_first input{
            height: 50px;
            margin-top: 15px;
        }
        
        .join_second{
            width: 498px;
            min-height: 60px;
            background-color: white;
            border-bottom: 1px solid #424242;
            position: relative;
        }
        .join_second input{
            height: 40px;
            margin-top: 10px;          
        }
        .join_address button{
            position: absolute;
            height: 60px;
            right: 0;
            background-color: cornflowerblue;
            border: none;
            font-weight: 600;
        }
        .join_address button:hover{
            cursor: pointer;
        }
        #mainAddress,#detailAddress{
            text-overflow: ellipsis;
            font-size: 20px;
        }
        #searchAddress{
            width: 100px;
        }
        
        .error_box{
            /*background-color: dodgerblue;*/
            width: 350px;
            height: 30px;
            line-height: 30px;
            margin-top: 10px;
            margin-left: 10px;
            display: none;
        }
        
        .error{display: block;}
        
        .error_box span{
            font-size: 15px;
            color: red;
            font-weight: 900;
        }

		.success{display: block;}
		#state{font-size:25px;}
    </style>
</head>
<body>    
<div id="joinHeader">
    <h1><a href="main.html">S'shopMall</a></h1>
</div><!--//joinHeader-->    
<!-- 내용 -->
<div id="joinContents">
    <div class="join_wrap">
    <!-- 로그인시 수정페이지로 변경 -->
    
    <c:choose>
        <c:when test="${login!=null}">
		     <form class="join_form" action="/doUpdate" method="POST">
		     <fieldset>
		            <legend class="blind">회원정보 수정</legend>
	    </c:when>
	    <c:otherwise>
		     <form class="join_form" action="/dojoin" method="POST">
		     <fieldset>
		            <legend class="blind">회원가입</legend>    
	    </c:otherwise>        
	</c:choose>            
	            <div id="joinFirstArea">
	                <div class="join_first">
	                
	                <!-- 로그인 되있으면 아이디 변경 불가 -->
	                	<c:choose>
	                		<c:when test="${login!=null}">
	                			 <input type="text" id="id" name="id" value="${login.id}" disabled="disabled" maxlength="15">
	                		</c:when>
	                		<c:otherwise>
	                			<input type="text" id="id" name="id" placeholder="아이디:영문,숫자 8~15자리" maxlength="15">
	                		</c:otherwise>             
	                	</c:choose>
		                    <input type="button" disabled="disabled" id="idCheck" onclick="ajaxIdCheck();" value="중복확인">
	                    <div class="error_box id_error ">
	                    <span></span>
	                    </div>
	                </div>
	                <div class="join_first">
	                    <i class="fa fa-lock" aria-hidden="true"></i>
	                    <input type="password" id="pwd" class="password" name="password" placeholder="비밀번호:영문,숫자 5~18자리" maxlength="18">
	                    <div class="error_box pwd_error ">
	                    <span id="securityLevel"></span><span id="state"></span>
	                    </div>
	                </div>
	                <div class="join_first">
	                    <i class="fa fa-check-circle-o" aria-hidden="true"></i>
	                    <input type="password" class="password_check" name="pwdCheck" placeholder="비밀번호 확인" maxlength="18">
	                    <div class="error_box pwd_check_error ">
	                    <span></span>
	                    </div>
	                </div>
	            </div><!--//joinFirstArea-->
	            <div id="joinSecondArea">
	                <div class="join_second">
	                    <i class="fa fa-user" aria-hidden="true"></i>
	                    <input type="text" name="nickName" placeholder="이름">
	                    <div class="error_box name_error ">
	                    <span></span>
	                    </div>
	                </div>
	                <div class="join_second">
	                    <i class="fa fa-mobile" aria-hidden="true"></i>
	                    <input type="text" name="phone" maxlength="11" placeholder="연락처">
	                    <div class="error_box phone_error ">
	                    <span>다시 입력해 주세요!</span>
	                    </div>
	                </div>
	                <div class="join_second join_address">
	                    <input type="text" 
	                           id="postcode" 
	                           name="postCode"
	                           placeholder="우편번호">
	                    <input type="button" 
	                           id="searchAddress" 
	                           onclick="sample6_execDaumPostcode()" 
	                           value="주소 검색"><br>
	                    <input type="text" 
	                           id="mainAddress" 
	                           name="mainAddress" 
	                           placeholder="주소">
	                    <input type="text" 
	                           id="detailAddress" 
	                           name="detailAddress" 
	                           placeholder="상세주소">
	                </div>
	            </div><!--//joinSecondArea-->
	                
	            <div id="joinBtnBox">
	                <ul>
	                <c:choose>
		                <c:when test="${login!=null}">
		                    <li><button type="submit" class='join_btn'>수정</button></li>
		                    <li><button class="join_btn" title="클릭시 홈으로 돌아갑니다."><a href="/main">취소</a></button></li>
		                </c:when>
		                <c:otherwise>
		                	<li><button type="submit" class='join_btn'>가입</button></li>
		                    <li><button class="join_btn" title="클릭시 홈으로 돌아갑니다."><a href="/main">취소</a></button></li>
		                </c:otherwise>    
	                </c:choose>    
	                </ul>
	            </div><!--//joinBtnBox-->
	        </fieldset>
	    </form><!--//join_form-->

    </div><!--//join_wrap-->    
</div><!--//contents-->
      
<c:import url="template/footer.jsp"></c:import>          
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>    
<script src="js/jquery.js"></script>
<script>

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
        
        
        //아이디 중복 체크
    function ajaxIdCheck(){
    	var $id = $('#id'),
    	    id = $id.val();
		var flag = true;

       if(id==''){
				alert("아이디를 입력해주세요");
       }else{
        	$.ajax("/idCheck",{
       		type:"get",
       		dataType:"json",
       		data:{"id":id},
       		error:function(xhr,error,code){
       			
       			// 아이디 사용 가능
       			alert("사용가능한 아이디입니다.");
       			$id.css("background","#64B5F6");
       			
       			idChecker(flag);
       		},
       		success:function(json){
       			// 아이디 불가능
       			alert("이미 사용중인 아이디 입니다.");
       			$id.val('');
       			$id.focus();
       			$id.css("background","#EF9A9A");
       		}
       	})//ajax
    	   
       }//if end	
         
    }//ajaxIdCheck() end    
    
    
    //{시작글자수,종료글자수}
    var re_id = /^[a-z0-9_-]{5,15}$/; // 아이디 검사식
	var re_pw = /^[a-z0-9_-]{5,18}$/; // 비밀번호 검사식
	var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
	
	
	var $id = $("#id"),
		$pwd = $("#pwd"),
        $id_error = $(".id_error"),
        $pwd_error = $(".pwd_error"),
        $idCheck = $("#idCheck");
	
	//아이디 정규식
	$id.keyup(function(){
		//입력되고 있는 아이디를 계속해서 검사한다.
		var typiedId = $(this).val();
		if(re_id.test(typiedId)==true){//입력되고 있는 아이디를 계속해서 검사함
			$id_error.removeClass("error");
			//유효성 통과 시 중복체크 가능
			$idCheck.removeAttr("disabled");
			//alert("성공");
		}else{
			//유효성 위반 시  중복체크 불가
			$idCheck.attr("disabled","disabled");
			$id_error.removeClass("success");
			$id_error.addClass("error");
			$(".error span").text("영문 소문자,숫자 5자리 이상 입력해주세요.").css("color","red");
			//alert("다시입력");
			
			//id란이 비었을 경우 error메세지 삭제
			if(typiedId.length==0){
				$id_error.removeClass("error");
			}

		}
	})//$id_keyup();
	
	//비밀번호 정규식
	$pwd.keyup(function(){
		//입력되고 있는 아이디를 계속해서 검사한다.
		var typiedPwd = $(this).val();
		
		//7글자이하 안전도 하
		if(re_pw.test(typiedPwd)==true && typiedPwd.length>=5 && typiedPwd.length<8 ){
			$pwd_error.removeClass("error");
			$pwd_error.addClass("success");
			$("#securityLevel").text('안전도 : ').css("color","black");
			$(".success #state").text("하").css("color","red");
			//alert("성공");
			
			//8~10글자 안전도 중
		}else if(re_pw.test(typiedPwd)==true && typiedPwd.length>=8 && typiedPwd.length<11 ){
			$(".success #state").text("중").css("color","#827717");
			
			
			//11~13글자 안전도 상
		}else if(re_pw.test(typiedPwd)==true && typiedPwd.length>=11 && typiedPwd.length<14){
			$(".success #state").text("상").css("color","blue");
			
			
		}else if(re_pw.test(typiedPwd)==true && typiedPwd.length>=14){
			$(".success #state").text("최상").css("color","green");
		}else{
			//정규식 오류시
			$pwd_error.removeClass("success");
			$pwd_error.addClass("error");
			$(".error #state").text('');
			$(".error #securityLevel").text("5자리 이상 입력해 주세요.").css("color","red");
			//alert("다시입력");
			
		}	

			//pwd란이 비었을 경우 error메세지 삭제
 			if(typiedPwd.length==0){
				$pwd_error.removeClass("error");
			} 

	})//$pwd_keyup();
	
	//아이디 중복 체크 유무에 따른 가입가능 함수
	function idChecker(flag){
		
		var $join_btn = $(".join_btn");
		
		//중복확인 클릭시 리턴된 true값
		
		
		if(flag){
			//alert("true 넘어왔다~");
			//아아디 중복이 안될 경우 가입됨
			$join_btn.attr("type","submit");

		}else{
			//alert("false 넘어왔다~");
			//아이디 중복 될 경우 가입안됨
			$join_btn.attr("type","button");
		}

	}//idChecker();
	

 
</script>    
</body>
</html>