/************
this javascript is made for play+processing forum wich is moot-based forum
- play+processing forum is located at http://shengpo.github.io/playp5
- original location is at http://moot.it/playp5

this javascript will use JQuery to do something needed

by shengpo (shengpo.github.io)
************/


//getEmbeddedPlayer() is modified from "http://labs.steveottenad.com/jquery-to-parse-youtube-vimeo-urls/"
//used to parse youtube/vimeo links to embedded player
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


