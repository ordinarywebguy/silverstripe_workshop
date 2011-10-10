<div id="pageContent">
	<section class="grid_8">
		
		<h1>$Title</h1>
		

		
		
		$Content
	</section>
	
	
	<section class="grid_4">
		<p><a href="$OutclickMaskURL">Visit Site Now</a></p>
		<% control ProductImages %>
			<% if First %>$SetWidth(300)<% end_if %>
		
			$CMSThumbnail
		<% end_control %>
		
	</section>

	
</div>
