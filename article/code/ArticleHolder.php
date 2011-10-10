<?php
/**
 * Article page type holder
 * 
 * @package article
 * 
 */
class ArticleHolder extends Page {
	
	/**
	 * Allowed page types as a child
	 * 
	 * @staticvar array
	 */
	public static $allowed_children = array(
		'Article'
	);
}


/**
 * Article page type holder controller
 * 
 * @package article
 * 
 */
class ArticleHolder_Controller extends Page_Controller {
	
	/**
	 * Initialize controller
	 * 
	 * @see mysite/code/Page_Controller::init()
	 */
	public function init() {
		RSSFeed::linkToFeed( $this->Link() . 'rss', 'Latest Articles' );
		parent::init();
	}
	
	/**
	 * Article rss feed
	 */
	public function rss() {
	    $rss = new RSSFeed( DataObject::get( 'Article', '', 'Created DESC', '', 20 ), $this->Link(), 'Latest Articles' );
	    $rss->outputToBrowser();
	}
}
