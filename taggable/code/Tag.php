<?php 
/**
 * Taggable object
 * 
 * @package taggable
 * 
 */
class Tag extends DataObject {
	
	public static $db = array(
		'Tag' => 'Varchar(255)'
	);	

	public static $indexes = array(
		'Tag' => true
	);
	
	public static $summary_fields = array( 'Tag' => 'Tag' );
	
	/**
	 * Get tag id by name
	 * 
	 * @param string $tag
	 */
	public function getIDByTagName( $tag ) {
		$tag = Convert::raw2sql( $tag );
		return DB::query( "SELECT ID FROM Tag WHERE Tag = '$tag'" )->value();
	}
	
	
	
}
