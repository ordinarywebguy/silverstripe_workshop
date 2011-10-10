<?php
/**
 * Product toplist dataobject
 * 
 * @package product
 * 
 */
class ProductToplist extends DataObject {
	
	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $db = array( 
		'Name' => 'Varchar(255)',
		'IsManualSort' => 'Boolean'
	);
	
	
	/**
	 * Object has many relationship
	 * 
	 * @staticvar array
	 */		
	public static $has_many = array(
		'Items' => 'ProductToplistItem'
	);
	
	
	/**
	 * Admin page CMS fields
	 * 
	 * @see mysite/code/Page::getCMSFields()
	 */
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab( 'Root.Main', new CheckboxField( 'IsManualSort', 'Allow sorting manually (drag and drop sort), otherwise sorted by most clicked. Used in product toplist widget.' ) );
		$fields->addFieldToTab( 'Root.Items', new DataObjectManager( $this, 'Items', 'ProductToplistItem',
			array( 'Product.Name' => 'Product Name' ), 'getCMSFields_forPopup'
		) );
		return $fields;
	}
	
	/**
	 * Get all product toplist items sorted by most clicked or manually
	 */
	public function getToplistItems() {
		if( $this->IsManualSort ) {
			$items = $this->getComponents( 'Items', '', 'ProductToplistItem.SortOrder ASC' );
		} else {
			$query = new SQLQuery( array( 'Product.Name', 'ProductToplistItem.*', 'SUM(ProductOutclick.ClickCount) AS SumClickCount' ) );
			$query->from( 'ProductToplistItem' );
			$query->innerJoin( 'ProductToplist', 'ProductToplistItem.ToplistID = ProductToplist.ID' );
			$query->innerJoin( 'Product', 'ProductToplistItem.ProductID = Product.ID' );
			$query->innerJoin( 'ProductOutclick', 'ProductOutclick.ProductID = Product.ID' );
			$query->where( 'ProductToplistItem.ToplistID = ' . $this->ID );
			$query->groupby( 'ProductOutclick.ProductID' );
			$query->orderby( 'SumClickCount DESC' );
			$records = $query->execute();
			
			$items = $this->buildDataObjectSet( $records );
		}
		return $items;
	}	
	
}