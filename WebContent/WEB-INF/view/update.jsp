<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>당신의 날개를 달아주는 S'shopMall</title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link href='https://fonts.googleapis.com/css?family=Bad+Script' rel='stylesheet' type='text/css'>
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
        #joinBtnBox button{
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
        #joinBtnBox button a{
            text-decoration: none;
            color: black;
            display: block;
            width: 140px;
            height: 50px;
            line-height: 50px;
        }
        #joinBtnBox button:hover{
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
        .join_address input:focus{
            font-size: 15px;
        }
        .join_address button{
            position: absolute;
            height: 60px;
            right: 0;
            background-color: cornflowerblue;
            border: none;
            font-size: 15px;
            font-weight: 600;
        }
        .join_address button:hover{
            cursor: pointer;
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
        
        .error{
            display: block;
        }
        
        .error_box span{
            font-size: 15px;
            color: red;
            font-weight: 900;
        }
    </style>
</head>
<body>

<div id="joinHeader">
    <h1><a href="main.html">S'shopMall</a></h1>
    
</div><!--//joinHeader-->    
<!-- 내용 -->
<div id="joinContents">
    <div class="join_wrap">
     <form class="join_form" action="" method="post"> 
        <fieldset>
            <legend class="blind">회원가입</legend>
            <div id="joinFirstArea">
                <div class="join_first">
                    <input type="text" class="id" name="id" disabled placeholder="아이디">
                    <div class="error_box id_error ">
                    <span>다시 입력해 주세요!</span>
                    </div>
                </div>
                <div class="join_first">
                    <i class="fa fa-lock" aria-hidden="true"></i>
                    <input type="password" id="pwd" class="password" name="pwd" placeholder="비밀번호">
                    <div class="error_box pwd_error ">
                    <span>다시 입력해 주세요!</span>
                    </div>
                </div>
                <div class="join_first">
                    <i class="fa fa-check-circle-o" aria-hidden="true"></i>
                    <input type="password" class="password_check" name="pwdCheck" placeholder="비밀번호 확인">
                    <div class="error_box pwd_check_error ">
                    <span>다시 입력해 주세요!</span>
                    </div>
                </div>
            </div><!--//joinFirstArea-->
            <div id="joinSecondArea">
                <div class="join_second">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <input type="text" name="nickName" placeholder="닉네임">
                    <div class="error_box id_error ">
                    <span>다시 입력해 주세요!</span>
                    </div>
                </div>
                <div class="join_second">
                    <i class="fa fa-mobile" aria-hidden="true"></i>
                    <input type="text" name="phone" placeholder="연락처">
                    <div class="error_box id_error ">
                    <span>다시 입력해 주세요!</span>
                    </div>
                </div>
                <div class="join_second join_address">
                    <input type="text" name="address" placeholder="주소"><button type="button">주소검색</button>
                </div>
                <div class="join_second join_detail_address">
                    <input type="text" name="detail_address" placeholder="상세주소">
                </div>
            </div><!--//joinSecondArea-->
            
            <div id="joinBtnBox">
                <ul>
                    <form action="" method="post">
                    <li><button type="submit">수정</button></li>
                    <li><button type="button" title="클릭시 홈으로 돌아갑니다."><a href="main.html">취소</a></button></li>
                    </form>
                </ul>
                         
            </div><!--//joinBtnBox-->
        </fieldset>
    </form><!--//join_form-->  
    </div><!--//join_wrap-->    
</div><!--//contents-->
    
<c:import url="template/footer.jsp"></c:import>

</body>
</html>