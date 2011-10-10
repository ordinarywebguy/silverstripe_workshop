<?php
$val .= <<<SSVIEWER

SSVIEWER;
 if($item->obj("Toplist",null,true)->hasValue("ToplistItems")) {  ;
 $val .= <<<SSVIEWER

<table>

SSVIEWER;
 array_push($itemStack, $item); if(($loop = $item->obj("Toplist")) && ($loop = $loop->obj("ToplistItems"))) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

	<tr>
		<td title="
SSVIEWER;
$val .=  $item->obj("Product",null,true)->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
">
		
SSVIEWER;
 array_push($itemStack, $item); if(($loop = $item->obj("Product")) && ($loop = $loop->obj("FirstImage"))) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

			
SSVIEWER;
$val .=  $item->obj("Image")->XML_val("SetWidth",array("30"),true) ;
 $val .= <<<SSVIEWER

		
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

		</td>
		<td><a href="
SSVIEWER;
$val .=  $item->obj("Product",null,true)->obj("ReviewPage",null,true)->XML_val("OutclickMaskURL",null,true) ;
 $val .= <<<SSVIEWER
">Visit Site</a></td>
		<td><a href="
SSVIEWER;
$val .=  $item->obj("Product",null,true)->obj("ReviewPage",null,true)->XML_val("URLSegment",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  $item->obj("Product",null,true)->obj("ReviewPage",null,true)->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</a></td>
	</tr>

SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

</table>

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

SSVIEWER;
