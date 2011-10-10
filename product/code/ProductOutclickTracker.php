<?php
/**
 * Product outclicks
 * 
 * @package product
 * 
 * @deprecated Moved in ProductReview_Controller#goto
 */
class ProductOutclickTracker extends Controller {
	
	protected $productReview = null;
	
	public function index( SS_HTTPRequest $request ) {		
	}
	
	
	public function init() {
		parent::init();
		$request = $this->getRequest();
		$urlSegment = explode( '/', $request->getURL() );

		if( !isset( $urlSegment[ 1 ] ) ) {
			Director::direct( '/' );
		}
		
		$productReview = $this->getProductReviewByURLSegment(  $urlSegment[ 1 ] );
		$this->trackClick( $productReview, $request->getIP() );
		
		header( 'Location: ' . $this->getProductReviewOutclickURL( $productReview ) );
		exit;
	}
	
	protected function trackClick( ProductReview $productReview, $ip ) {
		if( !$productReview ) {
			return false;
		}
		
		$outclick = new ProductOutclick();
		$outclick->ProductID = $productReview->Product()->ID;
		$outclick->IP = $ip;
		$outclick->write();
	}
	

	protected function getProductReviewByURLSegment( $urlSegment ) {
		$urlSegment = Convert::raw2sql( $urlSegment );
		return DataObject::get_one( 'ProductReview', "URLSegment = '$urlSegment'" );
	}
	
	
	protected function getProductReviewOutclickURL( ProductReview $productReview ) {
		if( $productReview ) {
			return $productReview->OutclickURL;
		}
		return '';
	}
	
	
}