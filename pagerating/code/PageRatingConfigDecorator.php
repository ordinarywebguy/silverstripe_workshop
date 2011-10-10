<?php
/**
 * PageRating SiteConfig decorator
 * 
 * @package pagerating
 * 
 */
class PageRatingConfigDecorator extends DataObjectDecorator {
	
	/**
	 * Extra static instance variables
	 * 
	 * @see sapphire/core/model/DataObjectDecorator::extraStatics()
	 */
	public function extraStatics() {
		return array(
			'db' => array(
				'MaxPageRate' => 'Int',
			),
			'defaults' => array(
				'MaxPageRate' => 5
			)
		);
	}
	
	/**
	 * Addition admin page CMS fields
	 * 
	 * @see sapphire/core/model/DataObjectDecorator::updateCMSFields()
	 */
	public function updateCMSFields( Fieldset $fieldset ) {
		$fieldset->addFieldToTab( 'Root.PageRating', new Textfield( 'MaxPageRate', 'Max Page Rate Value' ) );
		return $fieldset;
	}
	
	
}