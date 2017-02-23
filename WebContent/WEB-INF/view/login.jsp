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
        #loginArea{
            width: 100%;
            height: 100%;
            position: fixed;
        }
        
        #loginWrap{
            width: 500px;
            height: 500px;
            background: white;
            position: fixed;
            top: 50%;
            left: 50%;
            margin: -250px 0 0 -250px; 
            border: 1px solid #424242;
        }
        
        #loginHeader{
            width: 500px;
            height: 98px;
            border-bottom: 1px solid #424242;
            position: relative;
        }
        #loginHeader h1{
            width: 300px;
            height: 50px;
            font-size: 40px;
            font-weight: 800;
            text-align: center;
            background: white; 
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -25px;
            margin-left: -150px;
        }
        
        #loginInput{
            width: 500px;
            height: 200px;
            /*background: blue;*/
            margin: auto;
        }
        
        .login_info{
            width: 500px;
            height: 100px;
            /*background: green;*/
            position: relative;
        }
        .login_info input{
            width: 400px;
            height: 60px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -30px 0 0 -200px;
            font-size: 20px;
            font-weight: 800;
            background-color: #F5F5F5;
            border: 1px solid #424242;
            
        }
        .login_info input:focus{
            box-shadow: 1px 1px 15px 5px #90CAF9;
            background: #FAFAFA;
        }
        #loginBtnWrap{
            width: 500px;
            height: 70px;
            /*background: yellow;*/
        }
        #loginBtnWrap ul li{
            float: left;
            width: 250px;
            height: 70px;
           /* background: blue;*/
            position: relative;
        }
        #loginBtnWrap button{
            position: absolute;
            width: 120px;
            height: 40px;
            border: none;
            background: white;
            font-size: 20px;
            top: 50%;
            left: 50%;
            margin: -20px 0 0 -60px;
        }
        #loginBtnWrap button:hover{
            cursor: pointer;
        }
        #loginBtnWrap button a{
            text-decoration: none;
            color: black;
        }
        
        #loginNotice{
            width: 400px;
            height: 80px;
            background-image: url(image/%EB%A1%9C%EA%B7%B8%EC%9D%B8%20%EC%95%88%EB%82%B4%EA%B8%80.gif);
            background-repeat: no-repeat;
            position: absolute;
            right: 45px;
            bottom: 40px;
        }
        #find{
            position: absolute;
            bottom: 0;
            width: 500px;
            height: 50px;
        }
        #find span{
            display: block;
            width: 200px;
            height: 50px;
            font-size: 10px;
            font-weight: 600;
            line-height: 50px;
            margin-left: 45px;
            text-decoration: underline;    
        }
        #findBtn{
            position: absolute;
            right: 10px;
            bottom: 13px;
        }
        #findBtn button{
            width: 80px;
            height: 20px;
            font-size: 10px;
            border: none;
            background-color: darkgray;
        }
        #findBtn button:hover{
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="loginArea">
    <div id="loginWrap">
        <div id="loginHeader">
            <h1>S'shopMall</h1>
        </div><!--//loginHeader-->
        <form action="/session" method="post">
        <div id="loginContent">
            <div id="loginInput">
                <div class="login_info id">
                    <input type="text" name="id" placeholder="아이디">
                </div>
                
                <div class="login_info password">
                    <input type="password" name="password" placeholder="비밀번호">
                </div>
            </div>
            
            <div id="loginBtnWrap">
                <ul>
                    <li><button type="submit">로그인</button></li>
                    <li><button type="button"><a href="/main">취소</a></button></li>
                </ul>          
            </div>
           </form> 
            <div id="loginNotice">
            </div>
            <div id="find">
                <span>계정이 기억나지 않으십니까?</span>
               <div id="findBtn">
                <button>아이디 찾기</button>
                <button>비밀번호 찾기</button>
               </div>
            </div>
        </div><!--//loginContent-->
    </div><!--//loginHeader-->
    </div>
    
    
    <!-- 아이디,비밀번호가 틀렸을 경우 메세지 -->
    <c:if test="${login==null && loginMsg!=null}">
    <script type="text/javascript">
    	alert('${loginMsg}');
    
    </script>
    </c:if>
</body>
</html>