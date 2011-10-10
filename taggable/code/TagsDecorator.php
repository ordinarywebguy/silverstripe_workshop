<?php
/**
 * Tags Decorator to enable tagging on pagetypes/dataobjects
 * 
 * @package taggable
 * 
 */
class TagsDecorator extends DataObjectDecorator {

	protected static $tag_separator = '; ';
	
	/**
	 * Extra static variables on decorated dataobjects
	 * 
	 * @see sapphire/core/model/DataObjectDecorator::extraStatics()
	 */
	public function extraStatics() {
		return array(
			'many_many' => array(
				'Tags' => 'Tag'
			),
		);
	}
	
	/**
	 * Additional admin page CMS fields on decorated dataobjects/pagetypes 
	 * 
	 * @see sapphire/core/model/DataObjectDecorator::updateCMSFields()
	 */
	public function updateCMSFields( FieldSet $fields ) {
		$tags = $this->owner->Tags();
		$tags = implode( self::$tag_separator, $tags->column( 'Tag' ) );
		$textField = new TextField( '_tags', 'Tags', $tags );
		$fields->addFieldToTab( 'Root.Content.Main',  $textField );
		
		if( $relatedPages = $this->getRelatedPages() ) {
			foreach( $relatedPages as $page ) {
				$fields->addFieldToTab( 'Root.Content.RelatedPages',  new LiteralField( $page->ID, $page->URLSegment ) );
			}
		}	
	}
	
	/**
	 * Saves the tag
	 * 
	 * @see sapphire/core/model/DataObjectDecorator::onBeforeWrite()
	 */
	public function onBeforeWrite() {
		$request = Controller::curr()->getRequest();
		$posts = $request->postVars();
		if( isset( $posts[ '_tags' ] ) ) {
			$newTags = explode( self::$tag_separator, $posts[ '_tags' ] );
			$this->removeTags( $newTags );
			$this->addTags( $newTags );
		}
	}	

	/**
	 * Setter of tag delimiter
	 * 
	 * @param string $separator
	 */
	public static function set_tag_separator( $separator = '; ' ) {
		self::$tag_separator = $separator;
	}
	
	/**
	 * Get all pages that has related tags
	 */
	public function getRelatedPages() {
		$tags = $this->owner->Tags()->column( 'ID' );
		$tagIDs = implode( ',', $tags );
		$pageType = get_class( $this->owner );
		$filter = '';
		
		if(  !empty( $tagIDs ) ) {
			$filter = "{$pageType}_Tags.TagID IN ($tagIDs)";
		}
		
		$pages = DataObject::get( $pageType, $filter, '', 
			"JOIN {$pageType}_Tags ON {$pageType}_Tags.{$pageType}ID = {$pageType}.ID AND {$pageType}.ID <> {$this->owner->ID}" );
		
		return $pages;
	}

	/**
	 * Removes old tags
	 * 
	 * @param array $newTags
	 */
	protected function removeTags( array $newTags ) {
		$oldTags = $this->owner->Tags();
		$retainTags = array_intersect( $newTags, $this->owner->Tags()->column( 'Tag' ) );
		foreach( $oldTags as $tag ) {
			if( in_array( $tag->Tag, $retainTags ) ) {
				continue;
			}
			$this->owner->Tags()->remove( $tag );
		}
	}
	
	/**
	 * Adds new tags
	 * 
	 * @param array $tags
	 */
	protected function addTags( array $tags ) {
		if( empty( $tags ) ) {
			return;
		}
		foreach( $tags as $tag ) {
			if( empty( $tag ) ) {
				continue;
			}
			$tag = Convert::raw2sql( $tag );
			$tagDO = DataObject::get_one( 'Tag', "Tag = '$tag'" );
			
			if( !$tagDO ) {
				$tagDO = new Tag();
				$tagDO->Tag = $tag;
				$tagDO->write();
			}
			$this->owner->Tags()->add( $tagDO );
		}
	}
	
	
	
}