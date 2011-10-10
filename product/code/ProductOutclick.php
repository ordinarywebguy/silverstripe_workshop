<?php
/**
 * Product outclicks
 * 
 * @package product
 * 
 */
class ProductOutclick extends DataObject {

	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $db = array(
		'ClickCount' => 'Int'
	);
	
	/**
	 * Object has one relationship
	 * 
	 * @staticvar array
	 */	
	public static $has_one = array(
		'Product' => 'Product'
	);
	

	/**
	 * Updates ClickCount field per day
	 * 
	 * @param int $productID
	 */
	public function accumulateClick( $productID ) {
		$outclick = DataObject::get_one( 'ProductOutclick', 'DATE_FORMAT( Created, \'%Y%m%d\') = \'' . date( 'Ymd' ) . '\' AND ProductID = ' . $productID );
		if( !$outclick ) {
			$outclick = new ProductOutclick();
		}
		$clickCount = (int) $outclick->ClickCount;
		$outclick->ProductID = $productID;
		$outclick->ClickCount = ++$clickCount;
		$outclick->write();
	}
	
	
}