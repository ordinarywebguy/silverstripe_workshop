<?php
/**
 * Product review page type
 * 
 * @package product
 * 
 */
class ProductReview extends Page {
	
	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $db = array(
		'OutclickURL' => 'Varchar(255)'
	);
	
	/**
	 * Page has one relationship
	 * 
	 * @staticvar array
	 */	
	public static $has_one = array(
		'Product' => 'Product'
	);
	
	/**
	 * Admin page CMS fields
	 * 
	 * @see mysite/code/Page::getCMSFields()
	 */
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$products = DataObject::get( 'Product' )->map( 'ID', 'Name' );
		
		$productsDropDown = new DropDownField( 'ProductID', 'Product', $products );
		$productsDropDown->setEmptyString( 'Select a product' );
		
		$fields->addFieldToTab( 'Root.Content.Main', $productsDropDown, 'Content' );
		$fields->addFieldToTab( 'Root.Content.Main', new TextField( 'OutclickURL', 'Outclick URL'), 'Content' );
		
		return $fields;
	}
	
	/**
	 * Get all the product images 
	 */
	public function getProductImages() {
		$set = new DataObjectSet();
		if( $images = $this->Product()->Images() ) {
			foreach( $images as $image ) {
				$set->push( $image->Image() );
			}
		}
		return $set;
	}
	
	/**
	 * Outclick url 
	 */
	public function getOutclickMaskURL() {
		return '/' . $this->URLSegment . '/goto';
	}
	
	
}

/**
 * Product review page type controller
 * 
 * @package product
 * 
 */
class ProductReview_Controller extends Page_Controller {
	
	/**
	 * Tracks outclick
	 * 
	 * @param SS_HTTPRequest $request
	 */
	public function goto( SS_HTTPRequest $request ) {
		$productReview = $this->getProductReviewByURLSegment( $this->URLSegment );
		$this->trackClick( $productReview );
		
		header( 'Location: ' . $this->getProductReviewOutclickURL( $productReview ) );
		exit;
	}
	
	/**
	 * Saves the click
	 * 
	 * @param ProductReview $productReview
	 */
	protected function trackClick( ProductReview $productReview ) {
		if( !$productReview ) {
			return false;
		}
		$outclick = new ProductOutclick();
		$outclick->accumulateClick( $productReview->Product()->ID );
	}
	
	/**
	 * Get product review page by url segment
	 * 
	 * @param string $urlSegment
	 */
	protected function getProductReviewByURLSegment( $urlSegment ) {
		$urlSegment = Convert::raw2sql( $urlSegment );
		return DataObject::get_one( 'ProductReview', "URLSegment = '$urlSegment'" );
	}
	
	/**
	 * Get outclick url
	 * 
	 * @param ProductReview $productReview
	 */
	protected function getProductReviewOutclickURL( ProductReview $productReview ) {
		if( $productReview ) {
			return $productReview->OutclickURL;
		}
		return '';
	}

}



