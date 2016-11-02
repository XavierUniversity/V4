// Function for SVG clipping
function clipSVG(id){
    var svg = document.getElementsByTagName("svg")[0];
		
	if (svg.getAttribute('id') === id){
		var bbox = svg.getBBox();
		var viewBox = [bbox.x, bbox.y, bbox.width, bbox.height].join(" ");
		svg.setAttribute("viewBox", viewBox);
	}
}

// on window resize; we'll need to refire this
if(window.addEventListener) {
	window.addEventListener('resize', function() {
		clipSVG('logo');
	}, true);
}

clipSVG('logo');