<div id="pageContent">
	<section class="grid_12">
		<h1>$Title</h1>
		<% if Tags %><% control Tags %><a href="/tags/show/$Tag">$Tag</a> <% end_control %><% end_if %>
		<% if Intro %><blockquote>$Intro</blockquote><% end_if %>
		<% control Image %>$CMSThumbnail<% end_control %>
		$Content
		$Form
		<% if PageComments %><section>$PageComments</section><% end_if %>
	</section>
	
	
<section class="grid_4">

		
		$PageRatingWidget
	</section>
	
</div>
