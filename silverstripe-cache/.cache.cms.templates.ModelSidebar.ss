<?php
$val .= <<<SSVIEWER

SSVIEWER;
 if($item->hasValue("CreateForm")) {  ;
 $val .= <<<SSVIEWER

	<h3>
SSVIEWER;
$val .=  _t('ModelSidebar.ss.ADDLISTING','Add') ;
 $val .= <<<SSVIEWER
</h3>
	
SSVIEWER;
$val .=  $item->XML_val("CreateForm",null,true) ;
 $val .= <<<SSVIEWER


SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


<h3>
SSVIEWER;
$val .=  _t('ModelSidebar.ss.SEARCHLISTINGS','Search') ;
 $val .= <<<SSVIEWER
</h3>

SSVIEWER;
$val .=  $item->XML_val("SearchForm",null,true) ;
 $val .= <<<SSVIEWER



SSVIEWER;
 if($item->hasValue("ImportForm")) {  ;
 $val .= <<<SSVIEWER

	<h3>
SSVIEWER;
$val .=  _t('ModelSidebar.ss.IMPORT_TAB_HEADER', 'Import') ;
 $val .= <<<SSVIEWER
</h3>
	
SSVIEWER;
$val .=  $item->XML_val("ImportForm",null,true) ;
 $val .= <<<SSVIEWER


SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

SSVIEWER;
