;(function($) {
	$(document).ready(function() {
		$('#Form_PageRatingForm').submit(function() {
			$.post($(this).attr('action'), $(this).serialize(), function(data) {
				alert(data);
				
				$('#Form_PageRatingForm').hide();
			});
			return false;
		});
	});
})(jQuery);