<?php
/**
 * PageRating dataobject definition
 * 
 * @package pagerating
 * 
 */
class PageRating extends DataObject {
	
	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $db = array(
		'Rate' => 'Int',
		'IP' => 'Varchar(255)'
	);
	
	/**
	 * Object has one relationship
	 * 
	 * @staticvar array
	 */
	public static $has_one = array(
		'Page' => 'Page'
	);
	
	/**
	 * Calculate the average value of rates 
	 * 
	 * @param int|null $pageID
	 */
	public function calculateAverage( $pageID = null ) {
		$pageID = ( !is_null( $pageID ) && is_numeric( $pageID ) ) ? $pageID : $this->PageID;
		return DB::query( "SELECT SUM(Rate) / COUNT(ID) FROM PageRating WHERE PageID = $pageID" )->value();
	}
	
}