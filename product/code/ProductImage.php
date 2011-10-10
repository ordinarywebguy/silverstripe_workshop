<?php
/**
 * Product image
 * 
 * @package product
 * 
 */
class ProductImage extends DataObject {

	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $db = array(
		'Name' => 'Varchar(255)'
	);
	
	/**
	 * Object has one relationship
	 * 
	 * @staticvar array
	 */
	public static $has_one = array(
		'Product' => 'Product',
		'Image'	=> 'Image'
	);
	
	
}
