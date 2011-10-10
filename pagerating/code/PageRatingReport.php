<?php
/**
 * Pages rating report
 * 
 * @package product
 * 
 */
class PageRatingReport extends SS_Report {
	
	
	/**
	 * Report title
	 * 
	 * @var string
	 */
	protected $title = 'Pages Rating';
	
	/**
	 * Report description
	 * 
	 * @var string
	 */
	protected $description = 'Page rating';
	
	
	/**
	 * sourceRecords definition
	 *  
	 * @param array $params
	 * @param string $sort
	 * @param string $limit
	 * @return DataObjectSet
	 */
	public function sourceRecords( $params, $sort, $limit ) {
		$set = new DataObjectSet();
		$records = DB::query( 'SELECT SiteTree.URLSegment, SiteTree.Title AS PageTitle, 
			( SELECT SUM(Rate) / COUNT(Rate) FROM PageRating spr WHERE spr.PageID = SiteTree.ID  ) AS Rate 
			FROM SiteTree JOIN PageRating ON PageRating.PageID = SiteTree.ID GROUP BY SiteTree.ID' );
		
		if( !$records ) {
			return;
		}
		foreach( $records as $record ) {
   			$set->push( new DataObject( $record ) );
      	}
      	return $set;
	}

	/**
	 * Table columns 
	 */
	public function columns() {
		return array(
			'PageTitle' => 'PageTitle',
			'URLSegment' => 'URLSegment',
			'Rate' => 'Average Rate'
		);
	}

	
	
	
}