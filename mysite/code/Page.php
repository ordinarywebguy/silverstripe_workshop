<?php
/**
 * Generic page type
 * 
 * @package mysite
 * 
 */
class Page extends SiteTree {

	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $db = array(
	);

	/**
	 * Page type has one relationship
	 * 
	 * @staticvar array
	 */
	public static $has_one = array(
		'PageRatingWidget' => 'WidgetArea'
	);

	/**
	 * Admin page CMS fields
	 * 
	 * @see sapphire/core/model/SiteTree::getCMSFields()
	 */	
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab("Root.Content.PageRatingWidget", new WidgetAreaEditor( 'PageRatingWidget' ) );
		
		return $fields;
	}
	
}


/**
 * Generic page type controller
 * 
 * @package mysite
 * 
 */
class Page_Controller extends ContentController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	public static $allowed_actions = array (
	);

	public function init() {
		parent::init();

		// Note: you should use SS template require tags inside your templates 
		// instead of putting Requirements calls here.  However these are 
		// included so that our older themes still work
		Requirements::themedCSS( 'layout' ); 
		Requirements::themedCSS( 'typography' ); 
		Requirements::themedCSS( 'form' ); 
		
		
		Requirements::javascript( 'sapphire/thirdparty/jquery/jquery-packed.js' );
		Requirements::javascript( 'product/javascript/outclick.js' );
		
	}
}