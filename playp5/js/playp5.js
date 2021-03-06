/************
this javascript is made for play+processing forum wich is moot-based forum
- play+processing forum is located at http://shengpo.github.io/playp5
- original location is at http://moot.it/playp5

this javascript will use JQuery to do something needed

by shengpo (shengpo.github.io)
************/


/**** temporarily to use moot official image/video plugin, put following functions in comment.

//let window to convert video and image links periodly
window.setInterval(convertMediaLinks, 1000);	//1000 milliseconds == 1 second


//convert youtube/vimeo links to embedded player & convert image links to thumbnail and lightbox style
function convertMediaLinks(){
	//convert video links
	$("div.m-body a").each(function(){
		if($(this).attr('href') == $(this).text()){
			var url = $(this).text();
			var output = getEmbeddedPlayer(url, 315, 560);	//parameters: url, player_height, player_width
			if(output != ''){
				$(this).replaceWith(output);
			}
		}
	});


	//convert image links
	$("div.m-body a[class!=fancybox][class!=fancyDone]").each(function(){
		var url = $(this).attr('href'); 

		//if(url.match(/(http(s?):)|([\/|.|\w|\s])*\.(?:jpg|gif|png|JPG|GIF|PNG)/)){
		if(url.match(/\.(?:jpg|gif|png|JPG|GIF|PNG)$/)){
			$(this).replaceWith("<a class='fancybox' target='_new' href='"+url+"'><img width='300' src='"+url+"' /></a>");
		}
	});


	//add fancy box effect for every converted image
	$("div.m-body a.fancybox").each(function(){
		$(this).removeClass("fancybox");
		$(this).addClass("fancyDone");
		$(this).fancybox();
	});
}
****/


/*
getEmbeddedPlayer() is modified from "http://labs.steveottenad.com/jquery-to-parse-youtube-vimeo-urls/"
used to parse youtube/vimeo links to embedded player
*/
function getEmbeddedPlayer(url, height, width){
	var output = '';
	var youtubeUrl = url.match(/watch\?v=([a-zA-Z0-9\-_]+)/);
	var vimeoUrl = url.match(/^http:\/\/(www\.)?vimeo\.com\/(clip\:)?(\d+).*$/);
	if( youtubeUrl ){
		output = '<iframe width="'+width+'" height="'+height+'" src="http://www.youtube.com/embed/'+youtubeUrl[1]+'?rel=0" frameborder="0" allowfullscreen>';
	}else if(vimeoUrl){
		output =  '<iframe src="http://player.vimeo.com/video/'+vimeoUrl[3]+'" width="'+width+'" height="'+height+'" frameborder="0"></iframe>';
	}else{
		output = '';
	}
	return output;
}


