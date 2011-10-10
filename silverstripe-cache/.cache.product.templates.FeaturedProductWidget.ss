<?php
$val .= <<<SSVIEWER
<blockquote>

SSVIEWER;
$val .=  $item->XML_val("Text",null,true) ;
 $val .= <<<SSVIEWER

<p>&nbsp;</p>

SSVIEWER;
 if($item->hasValue("ProductReview")) {  ;
 $val .= <<<SSVIEWER

	<p class=""><a href="
SSVIEWER;
$val .=  $item->obj("ProductReview",null,true)->XML_val("URLSegment",null,true) ;
 $val .= <<<SSVIEWER
">View 
SSVIEWER;
$val .=  $item->obj("Product",null,true)->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
 Review Page</a> | <a href="
SSVIEWER;
$val .=  $item->obj("ProductReview",null,true)->XML_val("OutclickMaskURL",null,true) ;
 $val .= <<<SSVIEWER
">View 
SSVIEWER;
$val .=  $item->obj("Product",null,true)->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
 Site</a></p>

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

</blockquote>
SSVIEWER;
