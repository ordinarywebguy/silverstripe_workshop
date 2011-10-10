<?php

DataObject::add_extension( 'SiteConfig', 'PageRatingConfigDecorator' );

SS_Report::register( 'ReportAdmin', 'PageRatingReport', 1 );