$(document).ready(function(){
	$('.nav>ul>li').mouseover(function(){
		$(this).siblings('li').children('ul').stop(true,true).slideUp();
		$(this).children('ul').slideDown();
		$('#dixia').slideDown(300);
	})
	$('.nav').mouseleave(function(){
		$('.nav>ul>li>ul').slideUp();
		$('#dixia').slideUp(500);
		
	})
	$('.nav>ul ul').mouseleave(function(){
		$(this).slideUp();
		$('#dixia').slideUp(500);
	})

})