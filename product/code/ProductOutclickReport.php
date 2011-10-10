<?php
/**
 * Product outclick report
 * 
 * @package product
 * 
 */
class ProductOutclickReport extends SS_Report {
	
	
	/**
	 * Report title
	 * 
	 * @var string
	 */
	protected $title = 'Product Outclicks';
	
	/**
	 * Report description
	 * 
	 * @var string
	 */
	protected $description = 'Today\'s number of outclicks accumulated by each products';
	
	
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
		$query = new SQLQuery( array( 'Product.Name', 'ClickCount' ) );
		$query->from( 'ProductOutclick' );
		$query->innerJoin( 'Product', 'ProductOutclick.ProductID = Product.ID' );
		$query->where( 'DATE_FORMAT(ProductOutclick.Created, \'%Y%m%d\') = \''. Convert::raw2sql( date( 'Ymd' ) ) . '\' ' );
		$query->groupby( 'ProductOutclick.ProductID' );
		$records = $query->execute();
		
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
			'Name' => 'Name',
			'ClickCount' => 'ClickCount'
		);
	}

	
	
	
}