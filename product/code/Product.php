<?php
/**
 * Product dataobject
 * 
 * @package product
 * 
 */
class Product extends DataObject {

	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $db = array(
		'Name' => 'Varchar(255)',
		'URL' => 'Varchar(255)'
	);
	
	/**
	 * Object has many relationship
	 * 
	 * @staticvar array
	 */
	public static $has_many = array(
		'Images' => 'ProductImage'
	);
	
	/**
	 * Summary fields used in ModelAdmin
	 * 
	 * @staticvar array
	 */
	public static $summary_fields  = array(
		'Name', 'URL'
	);
	
	public static $singular_name = 'Product';
	public static $plural_name = 'Products';
	public static $default_sort = 'Name ASC';
	
	/**
	 * Get review page 
	 */
	public function getReviewPage() {
		return DataObject::get_one( 'ProductReview', 'ProductID = ' . $this->ID );
	}

	/**
	 * Get the first image of product 
	 */
	public function getFirstImage() {
		return $this->getComponents( 'Images' )->First();
	}
	
	

	
	
	
	
	
}