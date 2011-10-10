<?php
/**
 * Article Widget
 * Displays the latest articles
 * 
 * @package article
 * 
 */
class LatestArticlesWidget extends Widget {
	
	/**
	 * DB fields 
	 *
	 * @staticvar array
	 */
	public static $db = array(
		'NumberToShow' => 'Int'
	);
	
	/**
	 * DB fields default values
	 * 
	 * @staticvar array
	 */
	public static $defaults = array(
		'NumberToShow' => 5
	);
	
	/**
	 * Widget front title
	 * 
	 * @staticvar string
	 */
	public static $title = 'Latest Articles';
	
	/**
	 * Widget CMS title
	 * 
	 * @staticvar string
	 */
	public static $cmsTitle = 'Latest Articles';
	
	/**
	 * Widget CMS description
	 * 
	 * @staticvar string
	 */
	public static $description = 'A list of the most updated articles.';
	
	/**
	 * Returns the latest articles  
	 */
	public function getLatestArticles() {
		return DataObject::get( 'Article', '', 'Created DESC', '', $this->NumberToShow );
	}
	
	/**
	 * Widget configuration fields
	 * 
	 * @see sapphire/widgets/Widget::getCMSFields()
	 */
	public function getCMSFields() {
		return new FieldSet(
			new NumericField( 'NumberToShow', 'Number to Show')		
		);
	}

}