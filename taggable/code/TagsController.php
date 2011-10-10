<?php
/**
 * Controller that will dislay all pages that have related tags
 * 
 * @package taggable
 * 
 */
class TagsController extends Controller {

	/**
	 * Show tag related pages
	 * 
	 * @param SS_HTTRequest $request
	 */
	public function show( SS_HTTRequest $request ) {
		$tag = $request->param( 'Tag' );
		$tmpPage = new Page();
		$tmpPage->Title = 'Pages with ' . $tag . ' tag';
		$tmpPage->URLSegment = 'tags/show/' . $tag;
		$tmpPage->ID = -1;
		
		$controller = new Page_Controller( $tmpPage );
		$controller->init();
		$customisedController = $controller->customise(array(
			'TagPages' => $this->getPagesByTag( $tag ),
		));
		
		return $customisedController->renderWith( array('TagsController_show', 'TagsController', 'Page') );
	}
	
	/**
	 * Get all pages by tag name
	 * 
	 * @param string $tag
	 */
	protected function getPagesByTag( $tag ) {
		$tagID = Tag::getIDByTagName( $tag );
		if( !$tagID ) {
			return;
		}
		$set = new DataObjectSet();
		$pageTypes = ClassInfo::subclassesFor( 'SiteTree' );
		foreach( $pageTypes as $type ) {
			$extensions = Object::get_extensions( $type );
			if( in_array( 'TagsDecorator', $extensions ) ) {
				$pages = DataObject::get( $type, "{$type}_Tags.TagID = $tagID", '', "JOIN {$type}_Tags ON {$type}_Tags.{$type}ID = {$type}_Live.ID" );
				$set->merge( $pages );
			}
		}
		
		return $set;
	}
	
	
	
}