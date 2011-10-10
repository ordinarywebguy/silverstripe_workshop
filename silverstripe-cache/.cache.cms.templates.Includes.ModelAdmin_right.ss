<?php
$val .= <<<SSVIEWER

<div id="ModelAdminPanel">


SSVIEWER;
 if($item->hasValue("EditForm")) {  ;
 $val .= <<<SSVIEWER

	
SSVIEWER;
$val .=  $item->XML_val("EditForm",null,true) ;
 $val .= <<<SSVIEWER


SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

	<form id="Form_EditForm" action="admin?executeForm=EditForm" method="post" enctype="multipart/form-data">
		<h1>
SSVIEWER;
$val .=  $item->XML_val("ApplicationName",null,true) ;
 $val .= <<<SSVIEWER
</h1>

		<p>
SSVIEWER;
$val .=  sprintf(_t('ModelAdmin_right.ss.WELCOME1','Welcome to %s. Please choose on one of the entries in the left pane.'),$item->XML_val("ApplicationName",null,true)) ;
 $val .= <<<SSVIEWER
</p>
		
	</form>

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER


</div>

<p id="statusMessage" style="visibility:hidden"></p>

SSVIEWER;
