<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div id="header">
        <div id="logoAndSearchWrap">
            <h1 id="logo">
            <a href="/main">S'shopMall</a>
            </h1>
			
            <input id="searchbox" class="search_area" name="clothName" placeholder="당신의 옷을 검색해보세요!">
            <button id="searchBtn"><i class="fa fa-search" aria-hidden="true"></i></button>

            <c:choose>
	            <c:when test="${login!=null}">           
			            <span>
			            <a class="user_nickname" href="/mypage">${login.nickName}</a>
			            </span> 님 즐거운 쇼핑 되세요
	            </c:when>
					
				<c:otherwise>
		            <span>로그인을 해주세요.</span>
		        </c:otherwise>
            </c:choose>
            
            <!-- 검색 결과 박스 -->
            <div id="resultbox" class="search_area">
            	<ul id="resultList">
            	</ul>
            </div><!--//resultbox -->
        </div><!--//logoAndSearchWrap-->
            <div id="menuBarWrap">
                <ul id="menu">
                    <li class="move_main_banner" id="submenu_fixed_box"><a id="men" class="" href="/item_list/M">MEN</a>
                        <div id="menSubMenuWrap" class="sub_menu ">
                            <ul id="menSubMenu">
                                <li><a href="/item_list/M/MO">outer</a></li>  
                                <li><a href="/item_list/M/MT">top</a></li>
                                <li><a href="/item_list/M/MB">bottom</a></li>
                            </ul>     
                        </div><!--//menSubMenuWrap-->
                    </li>
                    <li class="move_main_banner" style="position:relative;"><a id="women" class="" href="/item_list/W">WOMEN</a>
                        <div id="womenSubMenuWrap" class="sub_menu ">
                            <ul id="womenSubMenu">
                                <li><a href="/item_list/W/WO">outer</a></li>  
                                <li><a href="/item_list/W/WT">top</a></li>
                                <li><a href="/item_list/W/WB">bottom</a></li>
                            </ul>     
                        </div><!--//womenSubMenuWrap-->
                    </li>
                    <li class="move_main_banner" style="position:relative;"><a id="community" class="" href="/item_list/K">KIDS</a>
                        <div id="kidsSubMenuWrap" class="sub_menu ">
                            <ul id="kidsSubMenu">
                                <li><a href="/item_list/K/KO">outer</a></li>  
                                <li><a href="/item_list/K/KT">top</a></li>
                                <li><a href="/item_list/K/KB">bottom</a></li>
                            </ul>     
                        </div><!--//womenSubMenuWrap-->
                    </li>
                    <li><a id="join" href="/join">JOIN US</a></li>
                    
                    
                    <li>
                    <c:choose>
                    	<c:when test="${login != null}">
                    	<form action="/logout" method="POST">
                  		<input type="hidden"  id="logoutSign" name="logoutSign" value=""/>
                  		<button id="logoutBtn" onclick="button_event();">LOGOUT</button>
                  		</form>
                    	</c:when>
                    	
                    	<c:otherwise>
						<a id="login" href="/login">LOGIN</a>
						</c:otherwise>
					</c:choose>	
                    </li>
                    
                </ul>    

            </div><!--//menuBarWrap-->
                
        </div><!--//header-->

<script type="text/template" id="serchTmp">


<@if(items.length>0){@>
	<@_.each(items,function(item){@>

	<li>
	<a href="/item_detail/<@=item.no@>" class="search_item_name"><@=item.name@></a>
	</li>

	<@})@>

<@}else{@>
	<li>
		상품이 존재하지 않습니다.
	</li>
<@}@>
</script> 
  
<script src="/js/underscore-min.js"></script>			
<script src="/js/jquery.js"></script>        
<script type="text/javascript">
_.templateSettings = {
		 interpolate: /\<\@\=(.+?)\@\>/gim,
		 evaluate: /\<\@(.+?)\@\>/gim,
		 escape: /\<\@\-(.+?)\@\>/gim
		};


//로그아웃
function button_event(){
	if (confirm("정말 로그아웃 하시겠습니까?") == true){    //확인
		$("#logoutSign").attr("value","true"); 
		document.form.submit();
	}else{   //취소
		$("#logoutSign").attr("value","false"); 
		document.form.submit();
	}
	
	}//button_event

	
	
	//검색
$("#searchbox").keyup(function(){
	//alert("teset");
	
	//검색어 받아옴
	var name = $(this).val();
	
	if(name.length>0){
		doSearch(name);
		
	}

	
})	

//검색 ajax
function doSearch(name){
		
	var $resultList =  $("#resultList"),
		$resultbox = $("#resultbox");
		
	 $.ajax("/searchItemList",{
		  type:"get",
		  dataType:"json",
		  data:{"name":name},
		  error:function(xhr,code,error){
			  alert("에러용");
		  },
		  success:function(json){
			  
			  $resultList.empty();
			  		//alert("성공용");
			  
			  
	  			//템플릿안에 있는 마크업 전부를 따옴
					var markup= $("#serchTmp").html();
					
	  				//alert(markup);
	  				
	 		     	var tmp = _.template(markup);
						
			     	//alert(tmp);
			     	
			     	//제이슨은 배열로 넘어온다.
					var code = tmp({"items":json});
					
					//alert(code);
					
					//<ul>안에 code를 붙여넣는다.
					$resultList.append(code);
					$resultbox.addClass("block");
		  }
	  });
	}//doSearch()

</script>        