  $("#menu .move_main_banner").mouseover(function(){
           $(".color").removeClass("color");
           $(this).children('a').addClass("color");
           $(".on").removeClass("on");
           $(this).children('div').addClass("on"); 
           $bannersWrap.addClass("move"); 
       })
       
       $("#menu .move_main_banner").mouseleave(function(){
           $(this).children('a').removeClass("color");
           $(".on").removeClass("on");
           $bannersWrap.removeClass("move");          
       })
       
       
       
       /* 사이드바  */
    var $window = $(window),
        $sideBarWrap = $("#sideBarWrap");
    
        $window.scroll(function(){
        var location = $window.scrollTop();     
        if(location>176){    
            $sideBarWrap.css("display","block");
                        
        }else{
            $sideBarWrap.css("display","none");
                    
        }

    })

    
    
