$(function(){   
	var eleWidth = $(".vis_frame ul li").innerWidth();     
	var state = false;   
	var playOn = false;   
	var direction = "left"; 
	var time = 2000;
	var bannerAuto;    
	function play(){
		if(!playOn){
			playOn = true;
			bannerAuto = setInterval(function(){     
				if(direction == "left"){
					$(".left").click();
				}else{
					$(".right").click();
				}     
			},time);     
		}
	}   
	function stop(){
		if(playOn){
			playOn = false;
			clearInterval(bannerAuto);   
		}
	} 
	function left(){  
		stop();
		direction = "left";     
		$(".vis_frame > ul").animate({left:eleWidth*-1},300,"swing",function(){    
			$(this).children("li:first").insertAfter($(this).children("li:last"));
			$(this).css({left:0});
			state = false;
			play();    
		});   
	}   
	function right(){  
		stop();
		direction = "right";          
		$(".vis_frame > ul > li:last").insertBefore($(".vis_frame > ul > li:first"));
		$(".vis_frame > ul").css({left:eleWidth*-1});
		$(".vis_frame > ul").animate({left:0},300,"swing",function(){    
			state = false;
			play();    
		});     
	}   
	$(".left").click(function(){
		if(!state){     
			state = true;
			left();
		}   
	});   
	$(".right").click(function(){
		if(!state){     
			state = true;
			right();
		}    
	});   
});