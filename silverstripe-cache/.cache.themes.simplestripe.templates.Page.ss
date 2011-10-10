<?php
$val .= <<<SSVIEWER
<!DOCTYPE html>
<html lang="
SSVIEWER;
$val .=  $item->XML_val("ContentLocale",null,true) ;
 $val .= <<<SSVIEWER
">
<head>
	<meta charset="utf-8" />
	
SSVIEWER;
$val .=  SSViewer::get_base_tag($val); ;
 $val .= <<<SSVIEWER

	
SSVIEWER;
 if($item->hasValue("MetaDescription")) {  ;
 $val .= <<<SSVIEWER
<meta name="description" http-equiv="description" content="
SSVIEWER;
$val .=  $item->XML_val("MetaDescription",null,true) ;
 $val .= <<<SSVIEWER
" />
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

	<meta name="generator" content="SilverStripe - http://www.silverstripe.org" />
	<title>
SSVIEWER;
 if($item->hasValue("MetaTitle")) {  ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("MetaTitle",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 } else { ;
 $val .= <<<SSVIEWER

SSVIEWER;
$val .=  $item->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER

SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER
 &raquo; 
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
</title>
	<link rel="shortcut icon" href="/favicon.ico" />
	<link rel="stylesheet" href="themes/simplestripe/css/layout.css" type="text/css" media="screen" />
	
	<!--[if IE 6]>
		<link rel="stylesheet" href="themes/simplestripe/css/ie/ie6.css" type="text/css" media="screen" charset="utf-8" />
	<![endif]-->
	
	<!--[if IE 7]>
		<link rel="stylesheet" href="themes/simplestripe/css/ie/ie7.css" type="text/css" media="screen" charset="utf-8" />
	<![endif]-->
	
	<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
			
</head>
	<body>
	<div id="container" class="container_12">
		<header>
	<hgroup>
		<h1><a href="" title="
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("Title",null,true) ;
 $val .= <<<SSVIEWER
"><img src="/
SSVIEWER;
$val .=  $item->XML_val("ThemeDir",null,true) ;
 $val .= <<<SSVIEWER
/images/logo-small.gif"> SHOP</a></h1>
		
SSVIEWER;
 if($item->obj("SiteConfig",null,true)->hasValue("Tagline")) {  ;
 $val .= <<<SSVIEWER

			<h2>
SSVIEWER;
$val .=  $item->obj("SiteConfig",null,true)->XML_val("Tagline",null,true) ;
 $val .= <<<SSVIEWER
</h2>
		
SSVIEWER;
 }  ;
 $val .= <<<SSVIEWER

	</hgroup>
	
	<nav id="navMain" title="Main Navigation">
	<ul>
	 	
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Menu", array("1"))) foreach($loop as $key => $item) { ;
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
"><span>
SSVIEWER;
$val .=  $item->obj("MenuTitle",null,true)->XML_val("XML",null,true) ;
 $val .= <<<SSVIEWER
</span></a></li>
	   	
SSVIEWER;
 } $item = array_pop($itemStack); ;
 $val .= <<<SSVIEWER

	 </ul>
</nav>

</header>
		<div id="content" class="pageWrapper typography">
			<div class="container_12">
				
SSVIEWER;
$val .=  $item->XML_val("Layout",null,true) ;
 $val .= <<<SSVIEWER

			</div>
		</div>
		<footer>
	<nav id="navFooter" class="grid_8">
		<ul>
		 	
SSVIEWER;
 array_push($itemStack, $item); if($loop = $item->obj("Menu", array("1"))) foreach($loop as $key => $item) { ;
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
	</nav>
	<div class="grid_4">
		<p>Powered by <a href="http://www.silverstripe.org">SilverStripe Open Source CMS</a></p>
	</div>
</footer>
	</div>
	</body>
</html>

SSVIEWER;
