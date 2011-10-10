<?php
/**
 * Taggable ModelAdmin
 * 
 * @package taggable
 * 
 */
class TagsAdmin extends ModelAdmin {

	public static $managed_models = array(
		'Tag'
	);
	public static $url_segment = 'tags';
	

}