<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문완료</title>
    <link rel="stylesheet" href="css/reset.css" />
    <style>
         .contents{
            width: 1000px;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 20px;
            position: relative;
            border-bottom: 1px solid #424242;
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
        .purchase_msg{
            height: 100px;
            text-align: center;
            line-height: 100px;
            margin-top: 50px;
        }
        .purchase_msg span{
            font-size: 30px;
        }
       a{
            text-decoration: none;
            color: red;
            display: block;
            width: 1000px;
            height: 50px;
            color: crimson;
/*          background: green;*/
            font-size: 30px;
            text-align: center;
            margin-top: 50px;
        }
        
        #orderCode{
        	text-align: left;
        	width: 500px;
        	height: 50px;
        	font-size:20px;
        	line-height:50px;
        	font-weight:800;
        	border: 1px solid #424242;
        	margin: auto;
        	
        }
        
        em{
        	color:#FF5722; 
        	font-weight: 700;
        	font-size:30px;
        }
        
        #notice{
        	text-align: center;
        	font-size: 25px;
        	margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="contents">
        <h1>Complate Purchase</h1>
    
    <div class="purchase_msg">
        <span>구매가 완료되셨습니다. 감사합니다.</span>
    </div><!--//purchase_msg-->
    	<div id="orderCode">주문번호 : <em>${real_code}</em> </div>
    	<div id="notice">주문번호를 반드시 기억해주세요. 주문 조회시에 이용됩니다.</div>
    <a href="/main">쇼핑 계속하기</a>
</div><!--//contents-->   

</body>
</html>