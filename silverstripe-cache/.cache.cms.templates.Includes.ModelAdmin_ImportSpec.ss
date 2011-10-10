<?php
$val .= <<<SSVIEWER
<div class="importSpec" id="SpecFor
SSVIEWER;
$val .=  $item->XML_val("ModelName",null,true) ;
 $val .= <<<SSVIEWER
">
	<a href="
SSVIEWER;
$val .=  SSViewer::$options['rewriteHashlinks'] ? Convert::raw2att( $_SERVER['REQUEST_URI'] ) : "" ;
 $val .= <<<SSVIEWER
#SpecDetailsFor
SSVIEWER;
$val .=  $item->XML_val("ModelName",null,true) ;
 $val .= <<<SSVIEWER
" class="detailsLink">
SSVIEWER;
$val .=  sprintf(_t('ModelAdmin_ImportSpec.ss.IMPORTSPECLINK', 'Show Specification for %s'),$item->XML_val("ModelName",null,true)) ;
 $val .= <<<SSVIEWER
</a>
	<div class="details" id="SpecDetailsFor
SSVIEWER;
$val .=  $item->XML_val("ModelName",null,true) ;
 $val .= <<<SSVIEWER
">
	<h4>
SSVIEWER;
$val .=  sprintf(_t('ModelAdmin_ImportSpec.ss.IMPORTSPECTITLE', 'Specification for %s'),$item->XML_val("ModelName",null,true)) ;
 $val .= <<<SSVIEWER
</h4>
		<h5>
SSVIEWER;
$val .=  _t('ModelAdmin_ImportSpec.ss.IMPORTSPECFIELDS', 'Database columns') ;
 $val .= <<<SSVIEWER
</h5>
		
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Fields")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

		<dl>
			<dt><em>
SSVIEWER;
$val .=  $item->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
</em></dt>
			<dd>
SSVIEWER;
$val .=  $item->XML_val("Description",null,true) ;
 $val .= <<<SSVIEWER
</dd>
		</dl>
		
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER


		<h5>
SSVIEWER;
$val .=  _t('ModelAdmin_ImportSpec.ss.IMPORTSPECRELATIONS', 'Relations') ;
 $val .= <<<SSVIEWER
</h5>
		
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Relations")) foreach($loop as $key => $item) { ;
 $val .= <<<SSVIEWER

		<dl>
			<dt><em>
SSVIEWER;
$val .=  $item->XML_val("Name",null,true) ;
 $val .= <<<SSVIEWER
</em></dt>
			<dd>
SSVIEWER;
$val .=  $item->XML_val("Description",null,true) ;
 $val .= <<<SSVIEWER
</dd>
		</dl>
		
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

	</div>
</div>
SSVIEWER;
