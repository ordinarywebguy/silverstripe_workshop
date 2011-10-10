<?php
/**
 * Product module
 * 
 * @package product
 * 
 */


//Director::addRules( 10, array( 'goto/$Action' => 'ProductOutclickTracker' ) );
SortableDataObject::add_sortable_class( 'ProductToplistItem' );


SS_Report::register( 'ReportAdmin', 'ProductOutclickReport', 1 );