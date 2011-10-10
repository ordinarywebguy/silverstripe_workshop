;(function($){
	$(document).ready(function() {
		//Enable outclick links to open into a new window
		//This could be changed to css selector to improve js performance
		$('a').click(function() {
			if( $(this).attr('href').match(/.+\/goto\/*/) ) {
				$(this).attr('target', '_blank');
			}
		});
	});
	
})(jQuery);