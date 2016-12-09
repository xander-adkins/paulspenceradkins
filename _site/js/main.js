

// JQuery Smooth Scroll

// $(function() {
//   $('a[href*="#"]:not([href="#"])').click(function() {
//     if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
//       var target = $(this.hash);
//       target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
//       if (target.length) {
//         $('html, body').animate({
//           scrollTop: target.offset().top - 20
//         }, 500);
//         return false;
//       }
//     }
//   });
// });

// Show Hide Content


function showHide(obj) {
	if (document.getElementById(obj)) {
		if (document.getElementById(obj+'-show').style.display != 'none') {
			document.getElementById(obj+'-show').style.display = 'none';
			document.getElementById(obj).style.display = 'block';
      document.getElementById(obj+'-teaser').style.display = 'none';
		}
		else {
			document.getElementById(obj+'-show').style.display = 'inline';
			document.getElementById(obj).style.display = 'none';
      document.getElementById(obj+'-teaser').style.display = 'block';
		}
	}
}
