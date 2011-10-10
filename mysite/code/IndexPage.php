<?php
/**
 * Homepage page type
 * 
 * @package mysite
 * 
 */ 
class IndexPage extends Page {
	
	/**
	 * DB fields
	 * 
	 * @staticvar array
	 */
	public static $has_one = array(
		'Widgets' => 'WidgetArea'
	);
	

	/**
	 * Admin page CMS fields
	 * 
	 * @see mysite/code/Page::getCMSFields()
	 */
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->addFieldToTab("Root.Content.Widgets", new WidgetAreaEditor( 'Widgets' ) );
		return $fields;
	}
	
}


/**
 * Homepage page type controller
 * 
 * @package mysite
 * 
 */ 
class IndexPage_Controller extends Page_Controller {
	
	
}
