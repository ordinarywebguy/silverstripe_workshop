<% if IsPageRated %>
	$PageRate
	<div class="starRatingContainer">
		<span class="star"></span>
		<span class="rate"<% if CalculateRatingCSSWidth %> style="width: {$CalculateRatingCSSWidth}px"<% end_if %>></span>
	</div>
<% else %>
	$PageRatingForm
<% end_if %>
 
