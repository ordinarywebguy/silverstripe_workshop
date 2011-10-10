<?php
/**
 * Featured products widget
 * 
 * @package product
 * 
 */
class FeaturedProductWidget extends Widget {
	
	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $db = array(
		'Text' => 'HTMLText'
	);
	
	/**
	 * Widget has one relationship
	 * 
	 * @staticvar array
	 */
	public static $has_one = array(
		'Product' => 'Product'	
	);

	public static $title = 'Featured Product';
	public static $cmsTitle = 'Featured Product';
	public static $description = 'Feature a product.';
	

	/**
	 * Product review page 
	 */
	public function getProductReview() {
		return DataObject::get_one( 'ProductReview', 'ProductID = ' . $this->Product()->ID );
	}
	
	/**
	 * Admin page CMS fields
	 * 
	 * @see sapphire/widgets/Widget::getCMSFields()
	 */
	public function getCMSFields() {
		$fields = new FieldSet();
		
		$products = DataObject::get( 'Product' )->map( 'ID', 'Name' );
		$productsDropDown = new DropDownField( 'ProductID', 'Product', $products );
		$productsDropDown->setEmptyString( 'Select a product' );

		$fields->push( $productsDropDown );
		$fields->push( new TextareaField( 'Text', 'Text', 10 ) );		
		
		return $fields;
	}


}