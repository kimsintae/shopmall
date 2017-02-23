<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
        
        #contents{
            margin: 10px 0;
            min-height: 1000px;
        }

        .main_banner_show_box_wrap,.men_banner_show_box_wrap,.women_banner_show_box_wrap,.kids_banner_show_box_wrap{
            width: 1150px;
            margin: auto;
            position: relative;
            /*background-color: chartreuse;*/
            margin-bottom: 100px;
        }

        /*보여질 베너박스 */
        .main_banner_show_box,.men_banner_show_box,.women_banner_show_box,.kids_banner_show_box{
            width: 960px;
            height: 470px;
            /*background-color: aqua;*/
            background-color: white;
            margin: auto;
            overflow: hidden;
            position: relative;
        }
        
        /*움직이게 될 베너박스 */
        .main_banner_moving_box,.men_banner_moving_box,.women_banner_moving_box,.kids_banner_moving_box{
            width: 4800px;
            height: 470px;
            /*background-color: crimson;*/
            margin: auto;    
            position: absolute;
            transition: ease 1s;
        }
        
        .main_banner_moving_box ul li{
            float: left;
        }
        .men_banner_moving_box ul li,.women_banner_moving_box ul li,.kids_banner_moving_box ul li{
/*            background-color: forestgreen;*/
            display: inline-block;
            vertical-align: middle; 
        }
        .fa-chevron-left,.fa-chevron-right{
            font-size: 80px;
            color: black;
            position: absolute;
            cursor: pointer;
        }
        .fa-chevron-left:hover,.fa-chevron-right:hover{
            text-shadow: 1px 1px 80px #fff;
        }
        .fa-chevron-left{
            left: 0;
            top: 180px;
        }
        .fa-chevron-right{
            right: 0;
            top: 180px;
        }
        
        .hot_item_title{
            width: 960px;
            margin: 10px auto;
            font-size: 25px;
            font-weight: 700;       
        }
        
        .itme_img_box{
            width: 300px;
            height: 320px;
            background-color: firebrick;
            margin: 10px 10px 0 10px;
        }
        .itme_img_box img{
            width: 300px;
            height: 320px;
        }
        
        .item_short_info_box{
            width: 298px;
            height: 118px;
            margin: auto;
            margin-top: 10px;   
            border: 1px solid #424242;
        }
        .item_short_info_box a{
            font-size: 15px;
            color: black;
            font-weight: 600px;
            text-decoration: none;
            display: block;
            padding: 20px 0 0 10px;
        }
        .item_short_info_box span{
            font-size: 30px;
            font-weight: 800;
            display: block;
            text-align: right;
            margin-top: 30px;
            margin-right: 10px;        
        }
        
        #bannersWrap{
            transition: ease .1s;
        
        }
        #bannersWrap.move{
            margin-top: 180px;
        }
        
    </style>
    
</head>
<body>
    
    <!-- 사이드바-->

    <div id="wrap">
       <c:import url="template/header.jsp"></c:import> 
        
        
        <div id="contents">
            <div id="bannersWrap" class="">
            <!-- 메인 베너 -->
            <div class="main_banner_show_box_wrap">
                    <i class="fa fa-chevron-left main_banner_left" aria-hidden="true"></i>
                    <i class="fa fa-chevron-right main_banner_right" aria-hidden="true"></i>
                <div class="main_banner_show_box">
                   
                    <div class="main_banner_moving_box">
                        <ul>
                            <li><img src="/image/메인 페이지 배너.jpg"/></li>
                            <li><img src="/image/%EB%A9%94%EC%9D%B8%20%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%B0%B0%EB%84%88%202.jpg" /></li>
                            <li><img src="/image/%EB%A9%94%EC%9D%B8%20%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%B0%B0%EB%84%88%203.jpg" /></li>
                            <li><img src="/image/%EB%A9%94%EC%9D%B8%20%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%B0%B0%EB%84%88%204.jpg" /></li>
                            <li><img src="/image/%EB%A9%94%EC%9D%B8%20%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%B0%B0%EB%84%88%205.jpg" /></li>          
                        </ul>
                    </div><!--//main_banner_moving_box-->           
                </div><!--//main_banner_show_box-->
            </div><!--//main_banner_show_box_wrap-->
            
    
            <!-- 남자 메인 베너 -->
            <h2 class="hot_item_title">HOT Items for MEN</h2>
            <div class="men_banner_show_box_wrap">
                    <i class="fa fa-chevron-left men_banner_left" aria-hidden="true"></i>
                    <i class="fa fa-chevron-right men_banner_right" aria-hidden="true"></i>
                <div class="men_banner_show_box">
                   
                    <div class="men_banner_moving_box">
                        <ul>
						<c:forEach items="${top9list}" var="item">
                              <li>
                                    <div class="itme_img_box">
                                    <a href="/item_detail/${item.no}">
                                        <img src="${item.image}" alt="" /> 
                                    </a> 
                                    </div><!--//itme_img_box-->
                                    <div class="item_short_info_box">
                                    <a href="/item_detail/${item.no}">
                                        ${item.name}  
                                    </a>   
                                    <span>${item.price}</span>    
                                    </div><!--//item_short_info_box-->

                              </li>
 						</c:forEach>
                        </ul>
                    </div><!--//men_banner_moving_box-->           
                </div><!--//men_banner_show_box-->
            </div><!--//men_banner_show_box_wrap-->
            
            
            <!-- 여자 메인 베너 -->
            <h2 class="hot_item_title">HOT Items for WOMEN</h2>
            <div class="women_banner_show_box_wrap">
                    <i class="fa fa-chevron-left women_banner_left" aria-hidden="true"></i>
                    <i class="fa fa-chevron-right women_banner_right" aria-hidden="true"></i>
                <div class="women_banner_show_box">
                   
                    <div class="women_banner_moving_box">
                        <ul>
                        <c:forEach items="${women}" var="womenItem">
                              <li>
                                    <div class="itme_img_box">
                                    <a href="/item_detail/${womenItem.no}">
                                        <img src="${womenItem.image}" alt="" /> 
                                    </a> 
                                    </div><!--//itme_img_box-->
                                    <div class="item_short_info_box">
                                    <a href="/item_detail/${womenItem.no}">
                                        ${womenItem.name}  
                                        
                                    </a>   
                                    
                                    <span>${womenItem.price}</span>    
                                    </div><!--//item_short_info_box-->

                              </li> 
						</c:forEach>
                        </ul>
                    </div><!--//women_banner_moving_box-->           
                </div><!--//women_banner_show_box-->
            </div><!--//women_banner_show_box_wrap-->
                
            <!-- 어린이 메인 베너 -->
            <h2 class="hot_item_title">HOT Items for KIDS</h2>
            <div class="kids_banner_show_box_wrap">
                    <i class="fa fa-chevron-left kids_banner_left" aria-hidden="true"></i>
                    <i class="fa fa-chevron-right kids_banner_right" aria-hidden="true"></i>
                <div class="kids_banner_show_box">
                   
                    <div class="kids_banner_moving_box">
                        <ul>
                        <c:forEach items="${kids}" var="kidsItem">
                              <li>
                                    <div class="itme_img_box">
                                    <a href="/item_detail/${kidsItem.no}">
                                        <img src="${kidsItem.image}" alt="" /> 
                                    </a> 
                                    </div><!--//itme_img_box-->
                                    <div class="item_short_info_box">
                                    <a href="/item_detail/${kidsItem.no}">
                                        ${kidsItem.name}  
                                        
                                    </a>   
                                    
                                    <span>${kidsItem.price}</span>    
                                    </div><!--//item_short_info_box-->

                              </li>
						</c:forEach>
                        </ul>
                    </div><!--//kids_banner_moving_box-->           
                </div><!--//kids_banner_show_box-->
            </div><!--//kids_banner_show_box_wrap-->    
        </div><!--//bannersWrap-->    
        </div><!--//contents-->
        
     <c:import url="template/footer.jsp"></c:import>
    </div><!-- //wrap-->

    <script src="/js/jquery.js"></script>
    <script src="/js/template.js"></script>
    <script>
       var $main_banner_moving_box = $(".main_banner_moving_box"),
           $men_banner_moving_box = $(".men_banner_moving_box"), 
           $women_banner_moving_box = $(".women_banner_moving_box"),
           $kids_banner_moving_box = $(".kids_banner_moving_box"),
           $bannersWrap = $("#bannersWrap");
       //메인 베너
       var left = 0;
        $(".main_banner_left").click(function(){   
          
          if(left==0){
               /*alert("끝!");*/
               left=left-3840;          
           }else{
               left = left+960;
               /*alert(left);*/              
           }
           $main_banner_moving_box.css("left",left);
       })
       
       $(".main_banner_right").click(function(){    
           if(left == -3840){
               //alert("오른쪽 끝!");
               left += 3840;          
           }else{
              // alert(right);
               left -= 960;
               
           } 
           //alert("입력되는 값"+left);
           $main_banner_moving_box.css("left",left);
 
       })
       
              //남자 베너
       var men_left = 0;
        $(".men_banner_left").click(function(){   
           if(men_left==0){
               /*alert("끝!");*/
               men_left=men_left-1920;          
           }else{
               men_left = men_left+960;
               /*alert(left);*/              
           }
           $men_banner_moving_box.css("left",men_left);
       })
       
    
        
         $(".men_banner_right").click(function(){    
           
            if(men_left == -1920){
               //alert("오른쪽 끝!");
               men_left += 1920;          
           }else{
              // alert(right);
               men_left -= 960;
               
           } 
           //alert("입력되는 값"+left);
           $men_banner_moving_box.css("left",men_left);
 
       })
      
               //여자 베너
       var women_left = 0;
        $(".women_banner_left").click(function(){   
           if(women_left==0){
               /*alert("끝!");*/
               women_left -=1920;          
           }else{
               women_left +=960;
               /*alert(left);*/              
           }
           $women_banner_moving_box.css("left",women_left);
       })
        
         $(".women_banner_right").click(function(){    
           
            if(women_left == -1920){
               //alert("오른쪽 끝!");
               women_left += 1920;          
           }else{
              // alert(right);
               women_left -= 960;      
           } 
           //alert("입력되는 값"+left);
           $women_banner_moving_box.css("left",women_left);
 
       })
         
                   //어린이 베너
       var kids_left = 0;
        $(".kids_banner_left").click(function(){   
           if(kids_left==0){
               /*alert("끝!");*/
               kids_left -=1920;          
           }else{
               kids_left +=960;
               /*alert(left);*/              
           }
           $kids_banner_moving_box.css("left",kids_left);
       })
        
         $(".kids_banner_right").click(function(){    
           
            if(kids_left == -1920){
               //alert("오른쪽 끝!");
               kids_left += 1920;          
           }else{
              // alert(right);
               kids_left -= 960;      
           } 
           //alert("입력되는 값"+left);
           $kids_banner_moving_box.css("left",kids_left);
 
       })
    //자동 베너
     var autoBanner = 0;     
      setInterval(function (){
          moveNext();
      },5000);
      
      function moveNext() {
           //alert("오른쪽에서 왼쪽");
            if(left== -3840){
               /*alert("끝!");*/
               left +=3840;          
           }else{
               left -=960;
               /*alert(left);*/              
           }
          
           $main_banner_moving_box.css("left",left);    
      } 
    </script>
    
    <!-- 회원가입 성공시 메세지 -->
    <c:if test="${joinMsg !=null}">
    <script type="text/javascript">
    	alert('${joinMsg}');  
    </script>
    </c:if>

	<c:if test="${loginMsg!=null}">
	<script type="text/javascript">
		alert('${loginMsg}');
	</script>
	</c:if>
</body>
</html>