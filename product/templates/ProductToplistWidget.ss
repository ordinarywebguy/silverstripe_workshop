<% if Toplist.ToplistItems %>
<table>
<% control Toplist.ToplistItems %>
	<tr>
		<td title="$Product.Name">
		<% control Product.FirstImage %>
			$Image.SetWidth(30)
		<% end_control %>
		</td>
		<td><a href="$Product.ReviewPage.OutclickMaskURL">Visit Site</a></td>
		<td><a href="$Product.ReviewPage.URLSegment">$Product.ReviewPage.Title</a></td>
	</tr>
<% end_control %>
</table>
<% end_if %>