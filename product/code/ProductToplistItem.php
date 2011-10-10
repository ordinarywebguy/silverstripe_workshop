<?php
/**
 * Product toplist items
 * 
 * @package product
 * 
 */
class ProductToplistItem extends DataObject {
	
	public static $db = array( 
	);
	
	
		
	/**
	 * Object has one relationship
	 * 
	 * @staticvar array
	 */		
	public static $has_one = array(
		'Product' => 'Product',
		'Toplist' => 'ProductToplist'
	);


	/**
	 * ModelAdmin CMS fields
	 * 
	 * @see mysite/code/Page::getCMSFields()
	 */
	public function getCMSFields_forPopup() {
		$fields = new FieldSet();
		$products = DataObject::get( 'Product' )->map( 'ID', 'Name' );
		$productsDropDown = new DropDownField( 'ProductID', 'Product', $products );
		$productsDropDown->setEmptyString( 'Select a product' );
		$fields->push( $productsDropDown );
		
		return $fields;
	}
	

	
	
	
	
}