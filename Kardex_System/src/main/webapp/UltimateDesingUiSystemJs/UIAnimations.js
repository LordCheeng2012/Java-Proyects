



function LoadModal() {
	let cuerpo=document.getElementById("Modal");
	cuerpo.classList.add("BackGroundModal");
	document.querySelectorAll("html").forEach(function (html) {
		html.style.overflow="hidden";
	});
	setTimeout(() => {
		cuerpo.classList.add("transback");
		document.querySelectorAll("html").forEach(function (html) {
			html.style.overflow="auto";
		});
	}, 2000);

	//quitar modal
	
	setTimeout(function () {
		cuerpo.classList.remove("BackGroundModal");
		cuerpo.style.display="none";
	},3000)

}

window.onload=function(){
	LoadModal();
}


