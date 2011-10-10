<?php
/**
 * Article page type
 * 
 * @package article
 * 
 */
class Article extends Page {
	
	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $db = array(
		'Intro' => 'HTMLText'
	);
	
	/**
	 * Page type has one relationship
	 * 
	 * @staticvar array
	 */
	public static $has_one = array(
		'Image' => 'Image'
	);
	
	/**
	 * Admin Page CMS fields
	 * 
	 * @see mysite/code/Page::getCMSFields()
	 */
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab( 'Root.Content.Main', new HtmlEditorField( 'Intro', 'Intro', 10 ), 'Content' );
		$fields->addFieldToTab( 'Root.Content.Image', new ImageField( 'Image', 'Image' ) );
		return $fields;
	}
	
}


/**
 * Article page type controller
 * 
 * @package article
 * 
 */
class Article_Controller extends Page_Controller {
	

	
	
}