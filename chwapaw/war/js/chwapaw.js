function showMenu(){
	if(document.getElementById("menu").style.display=="block")
		document.getElementById("menu").style.display="none";
	else
		document.getElementById("menu").style.display="block";
}

function showIcon(){
		if(document.getElementById("nav").style.display=="block")
			document.getElementById("nav").style.display="none";
		else		
		document.getElementById("nav").style.display="block";
}
function updateProfile(){
		if(document.getElementById("update").style.display=="block")
			document.getElementById("update").style.display="none";
		else		
		document.getElementById("update").style.display="block";
}
function editProfile(){
	location.replace("create.html");
}
function go(url){
	location.replace(url);
}
function rmv(url, qu){
	if(confirm(qu))
		go(url);
}
function imgThumbnail(file, container, width, heigth) {
		
			var reader = new FileReader();
			
			reader.onload = function() {
				container.html($('<img/>').attr('src', this.result).css({maxWidth : width, maxHeight : heigth}));
			};
			
			reader.readAsDataURL(file);
}
function createImage(input, container, width, heigth){
			
			var allowedTypes = ['png', 'jpg', 'jpeg', 'gif'];
			
			$(input).change(function(){
				
				var files    = this.files,
					filesLen = files.length,
					imgType;
				
				for(var i = 0 ; i < filesLen ; i++) {
					
					imgType = files[i].name.split('.');
					imgType = imgType[imgType.length - 1];
					imgType = imgType.toLowerCase();
					
					if(allowedTypes.indexOf(imgType) != -1){
						imgThumbnail(files[i], container, width, heigth);
					}
				}
			});
}
$(function(){
	createImage($('#profileImg input')[0], $('#profileImg p'), 150, 200);
});