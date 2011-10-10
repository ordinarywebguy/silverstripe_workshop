<?php
/**
 * Taggable module
 * 
 * @package taggable
 * 
 */

Director::addRules( 10, array( 'tags/$Action/$Tag' => 'TagsController' ) );