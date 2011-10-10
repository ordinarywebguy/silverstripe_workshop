<?php
/**
 * mysite configuration
 * 
 * @package mysite
 * 
 */
global $project;
$project = 'mysite';

global $databaseConfig;
$databaseConfig = array(
	"type" => 'MySQLDatabase',
	"server" => 'localhost',
	"username" => 'root',
	"password" => '',
	"database" => 'education',
	"path" => '',
);

MySQLDatabase::set_connection_charset( 'utf8' );

Director::set_environment_type( 'dev' );

// This line set's the current theme. More themes can be
// downloaded from http://www.silverstripe.org/themes/
SSViewer::set_theme( 'simplestripe' );

// Set the site locale
i18n::set_locale( 'en_US' );

// enable nested URLs for this site (e.g. page/sub-page/)
SiteTree::enable_nested_urls();

Translatable::set_default_locale( 'en_US' );
Translatable::set_allowed_locales( array( 'en_US', 'tl_PH' ) );

Object::add_extension( 'SiteTree', 'Translatable' );
Object::add_extension( 'SiteConfig', 'Translatable' ); // 2.4 or newer only

// Enable taggable on Article page type
Object::add_extension( 'Article', 'TagsDecorator' );