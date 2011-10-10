<?php
/**
 * Product toplist items widget
 * 
 * @package product
 * 
 */
class ProductToplistWidget extends Widget {
	
	public static $db = array(
		
	);
	
	public static $has_one = array(
		'Toplist' => 'ProductToplist'	
	);

	public static $title = 'Product Toplist';
	public static $cmsTitle = 'Product Toplist';
	public static $description = 'Product toplist.';
	
	/**
	 * Widget configuration CMS fields
	 * 
	 * @see sapphire/widgets/Widget::getCMSFields()
	 */
	public function getCMSFields() {
		$fields = new FieldSet();
		$toplists = DataObject::get( 'ProductToplist' )->map( 'ID', 'Name' );
		$toplistsDD = new DropDownField( 'ToplistID', '', $toplists );
		$toplistsDD->setEmptyString( 'Select a toplist' );
		$fields->push( $toplistsDD );
		
		return $fields;
	}



}