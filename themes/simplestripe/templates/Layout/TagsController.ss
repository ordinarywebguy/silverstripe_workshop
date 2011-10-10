<div id="pageContent">
	<section class="grid_8">
		<h1>$Title</h1>
		<% if TagPages %>
		<ul>
		<% control TagPages %>
			<li><a href="$URLSegment">$Title</a></li>
		<% end_control %>
		<% end_if %>
		</ul>		
	</section>
	<section class="grid_4">
	</section>
</div>