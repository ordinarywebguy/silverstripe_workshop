<?php
$val .= <<<SSVIEWER

SSVIEWER;
 Requirements::javascript("sapphire/thirdparty/tabstrip/tabstrip.js"); ;
 $val .= <<<SSVIEWER


SSVIEWER;
 Requirements::css("sapphire/thirdparty/tabstrip/tabstrip.css"); ;
 $val .= <<<SSVIEWER


<div id="LeftPane">
	<div id="SearchForm_holder" class="leftbottom">		
		
SSVIEWER;
 if($item->XML_val("SearchClassSelector",null,true) == "tabs") {  ;
 $val .= <<<SSVIEWER

			<ul class="tabstrip">
				
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("ModelForms")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

					<li class="
SSVIEWER;
$val .=  $item->XML_val("FirstLast",null,true) ;
 $val .= <<<SSVIEWER
"><a id="tab-ModelAdmin_
SSVIEWER;
$val .=  $item->obj("Title",null,true)->XML_val("HTMLATT",null,true) ;
 $val .= <<<SSVIEWER
" href="
SSVIEWER;
$val .=  SSViewer::$options['rewriteHashlinks'] ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "" ;
 $val .= <<<SSVIEWER
#
SSVIEWER;
$val .=  $item->obj("Form",null,true)->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
_
SSVIEWER;
$val .=  $item->XML_val("ClassName",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
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
 if($item->XML_val("SearchClassSelector",null,true) == "dropdown") {  ;
 $val .= <<<SSVIEWER

			<p id="ModelClassSelector">
				
SSVIEWER;
$val .=  _t('ModelAdmin.SEARCHFOR','Search for:') ;
 $val .= <<<SSVIEWER

				<select>
					
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("ModelForms")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

						<option value="
SSVIEWER;
$val .=  $item->obj("Form",null,true)->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
_
SSVIEWER;
$val .=  $item->XML_val("ClassName",null,true) ;
 $val .= <<<SSVIEWER
">
SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</option>
					
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

				</select>
			</p>
		
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

		
		
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("ModelForms")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

			<div class="tab" id="
SSVIEWER;
$val .=  $item->obj("Form",null,true)->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
_
SSVIEWER;
$val .=  $item->XML_val("ClassName",null,true) ;
 $val .= <<<SSVIEWER
">
				
SSVIEWER;
$val .=  $item->XML_val("Content",null,true) ;
 $val .= <<<SSVIEWER

			</div>
		
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

	</div>
</div>

SSVIEWER;
