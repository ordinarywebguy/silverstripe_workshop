<?php
/**
 * PageRating Widget
 * 
 * @package pagerating
 * 
 */
class PageRatingWidget extends Widget {
		
	public static $title = 'Page Rating';
	public static $cmsTitle = 'Page Rating';
	public static $description = 'Rate page';
	
	/**
	 * Get the max rating value 
	 */
	public function maxRatingValue() {
		$maxPageRate = 5;
		$siteConfig = SiteConfig::current_site_config();
		if( isset( $siteConfig->MaxPageRate ) && !empty( $siteConfig->MaxPageRate ) ) {
			$maxPageRate = $siteConfig->MaxPageRate;
		}
		
		return $maxPageRate;
	}
}

/**
 * PageRating Widget Controller
 * 
 * @package pagerating
 * 
 */
class PageRatingWidget_Controller extends Widget_Controller  {

	/**
	 * The width (px) of the sprite image
	 * 
	 * @var const
	 * @see pagerating/images/rating-gold.png
	 */
	const SPRITE_STAR_IMAGE_WIDTH = 17;
	
	/**
	 * Action callable in template that should load the css file 
	 */
	public function PageRate() {
		Requirements::css( 'pagerating/css/PageRatingWidget.css' );
	}
	
	/**
	 * The page rate form 
	 */
	public function PageRatingForm() {
		Requirements::javascript( 'sapphire/thirdparty/jquery/jquery-packed.js' );
		Requirements::javascript( 'pagerating/javascript/PageRatingWidget.js' );
	
		$pageRateRange = range( 1, $this->maxRatingValue() );
		$pageRateRange = array_combine( $pageRateRange, $pageRateRange );
		
		return new Form( $this, 'PageRatingForm', 
			new FieldSet( 
				new OptionsetField( 'PageRate', 'Page Rate', $pageRateRange ),
				new HiddenField( 'URLSegment', 'URLSegment', Controller::curr()->URLSegment ) 
			),
			new FieldSet( new FormAction( 'rate', 'Rate it!' ) )
		);
	}
	
	/**
	 * Action invoked in the page rating form
	 * 
	 * @param array $data
	 * @todo Reload the page rating star on ajax
	 */
	public function rate( $data ) {
		$request = $this->getRequest();
		$page = $this->getCurrentPage( $data[ 'URLSegment' ] );
		$rate = new PageRating( array( 'Rate' => $data[ 'PageRate' ], 'IP' => $request->getIP(), 'PageID' => $page->ID ) );
		$rate->write();
		Cookie::set( 'PageRatingWidget_' . $page->ID,  md5( time() ) );
		
		if( $this->isAjax() ) {
			return 'Thank you!';
		}
		
		return Controller::curr()->redirectBack();
	}
	
	/**
	 * Determine if a page is already rated thru cookie page unique value
	 */
	public function IsPageRated() {
		if( Cookie::get( 'PageRatingWidget_' . $this->getCurrentPage()->ID ) ) {
			return true;
		}
		return false;
	}
	
	/**
	 * Get the width
	 */
	public function CalculateRatingCSSWidth() {
		$request = $this->getRequest();
		$page = $this->getCurrentPage();
		$pageRating = new PageRating();
		$avg = $pageRating->calculateAverage( $page->ID );
			
		if( $avg ) {
			return $avg * self::SPRITE_STAR_IMAGE_WIDTH;
		}
		return 0;
	}
	
	/**
	 * Get the current page by url segment. If empty get current controller's url segment 
	 */
	protected function getCurrentPage( $urlSegment = '' ) {
		if( empty( $urlSegment ) ) {
			$urlSegment = Controller::curr()->URLSegment;
		}
		return SiteTree::get_by_link( $urlSegment );
	}
	
	
}



