<?php
$val .= <<<SSVIEWER
<div id="pageContent">
	<section class="grid_8">
		<h1>
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</h1>
		
SSVIEWER;
$val .=  $item->XML_val("Content",null,true) ;
 $val .= <<<SSVIEWER

		
SSVIEWER;
$val .=  $item->XML_val("Form",null,true) ;
 $val .= <<<SSVIEWER

		
SSVIEWER;
 if($item->hasValue("PageComments")) {  ;
 $val .= <<<SSVIEWER
<section>
SSVIEWER;
$val .=  $item->XML_val("PageComments",null,true) ;
 $val .= <<<SSVIEWER
</section>
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

	</section>
	<section class="grid_4">
		<!-- Turn this on when you enable basic search -->
<!-- <div id="searchBox">
	
SSVIEWER;
$val .=  $item->XML_val("SearchForm",null,true) ;
 $val .= <<<SSVIEWER

</div> -->
<!-- End Turn this on when you enable basic search -->


SSVIEWER;
 if($item->hasValue("Menu",array("2"))) {  ;
 $val .= <<<SSVIEWER
	
<nav id="nav_SideBar">
	<h3>
		
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Level", array("1"))) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

			<a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  $item->obj("Title",null,true)->XML_val("XML",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</a>
		
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

	</h3>
	<ul>
		
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Menu", array("2"))) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

			<li><a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  $item->obj("Title",null,true)->XML_val("XML",null,true) ;
 $val .= <<<SSVIEWER
" class="
SSVIEWER;
$val .=  $item->XML_val("LinkingMode",null,true) ;
 $val .= <<<SSVIEWER
 
SSVIEWER;
 if($item->XML_val("LinkOrSection",null,true) == "section") {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
 if($item->hasValue("Children")) {  ;
 $val .= <<<SSVIEWER
hasChildren
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  $item->obj("MenuTitle",null,true)->XML_val("XML",null,true) ;
 $val .= <<<SSVIEWER
</a>
	  			
SSVIEWER;
 if($item->XML_val("LinkOrSection",null,true) == "section") {  ;
 $val .= <<<SSVIEWER

	  				
SSVIEWER;
 if($item->hasValue("Children")) {  ;
 $val .= <<<SSVIEWER

						<ul>
							
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Children")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

								<li><a href="
SSVIEWER;
$val .=  $item->XML_val("Link",null,true) ;
 $val .= <<<SSVIEWER
" title="
SSVIEWER;
$val .=  $item->obj("Title",null,true)->XML_val("XML",null,true) ;
 $val .= <<<SSVIEWER
" class="
SSVIEWER;
$val .=  $item->XML_val("LinkingMode",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  $item->obj("MenuTitle",null,true)->XML_val("XML",null,true) ;
 $val .= <<<SSVIEWER
</a></li>
							
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

						</ul>
			 		 
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

				
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
 
			</li> 
 		
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

 	</ul>
</nav>

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
 


SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("TwitterAccount")) {  ;
 $val .= <<<SSVIEWER

<nav class="widget">
	<ul>
		<!--<li class="rss"><a href="blog/rss">Subscribe to RSS Feed</a></li>-->
		<li class="twitter"><a href="http://twitter.com/silverstriper">Follow me on Twitter</a></li>
	</ul>
</nav>

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER




		
SSVIEWER;
$val .=  $item->XML_val("Widgets",null,true) ;
 $val .= <<<SSVIEWER

		
		
SSVIEWER;
$val .=  $item->XML_val("PageRatingWidget",null,true) ;
 $val .= <<<SSVIEWER

	</section>
</div>
SSVIEWER;
