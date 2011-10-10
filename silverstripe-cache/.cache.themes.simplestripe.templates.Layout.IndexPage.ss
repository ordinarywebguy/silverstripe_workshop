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
$val .=  $item->XML_val("Widgets",null,true) ;
 $val .= <<<SSVIEWER


		
	</section>
</div>

SSVIEWER;
