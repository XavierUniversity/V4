/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig = function( config ) {
	config.contentsCss = "/Template-v41/css/global.css";
};

CKEDITOR.stylesSet.add( 'cs_styles',
[
	
	/* Default editor styles */
	/* Inline Styles */
	/* Object Styles */
	{ name : 'Lead'						, element : 'p', attributes : { 'class' : 'deck' }},
	{ name : 'H2 Subheader'				, element : 'h2', attributes : { 'class' : 'subheader' } },
	{ name : 'H3 Subheader'				, element : 'h3', attributes : { 'class' : 'subheader' } },
	{ name : 'H4 Subheader'				, element : 'h4', attributes : { 'class' : 'subheader' } },
	{ name : 'H5 Subheader'				, element : 'h5', attributes : { 'class' : 'subheader' } },
	{ name : 'H6 Subheader'				, element : 'h6', attributes : { 'class' : 'subheader' } },
	
	{ name : 'Underline Text'						, element : 'p', attributes : { 'class' : 'text-underline' }},
	{ name : 'Highlight 1'				, element : 'span', attributes : { 'class' : 'highlight1' } },
	{ name : 'Highlight 2'				, element : 'span', attributes : { 'class' : 'highlight2' } },
	{ name : 'Highlight 3'				, element : 'span', attributes : { 'class' : 'highlight3' } },
	{ name : 'Secondary Text'			, element : 'span', attributes : { 'class' : 'secondary-text' } },

 	{ name : 'List (disc)'				, element : 'ul', attributes : { 'class' : 'disc' } },
    { name : 'List (circle)'			, element : 'ul', attributes : { 'class' : 'circle' } },
    { name : 'List (square)'			, element : 'ul', attributes : { 'class' : 'square' } },
    { name : 'Custom List (arrow)'		, element : 'ul', attributes : { 'class' : 'customList-A' } },

 	{ name : 'Image Left'				, element : 'img', attributes : { 'class' : 'left' } },
    { name : 'Image Right'				, element : 'img', attributes : { 'class' : 'right' } },
    { name : 'Responsive Image' 		, element : 'img', attributes : { 'class' : 'img-responsive' } },
	
    { name : 'Alert box (Urgent)'		, element : 'div', attributes : { 'class' : 'alert alert-danger' } },
    { name : 'Alert box (Success)'		, element : 'div', attributes : { 'class' : 'alert alert-success' } },
    { name : 'Alert box (Secondary)'	, element : 'div', attributes : { 'class' : 'alert alert-info' } },

    { name : 'Panel'					, element : 'div', attributes : { 'class' : 'panel-grey' } },
    { name : 'Panel Callout'			, element : 'div', attributes : { 'class' : 'panel-callout' } },
	{ name : 'Message Panel'			, element : 'div', attributes : { 'class' : 'panel-message' } },
	{ name : 'Aside Callout'			, element : 'div', attributes : { 'class' : 'aside-cta' } },
	{ name : 'Illustration'				, element : 'div', attributes : { 'class' : 'illustration' } },
	{ name : 'Callout Orange'			, element : 'div', attributes : { 'class' : 'callout orange' } },
	{ name : 'Callout Green'			, element : 'div', attributes : { 'class' : 'callout green' } },
	{ name : 'Callout Purple'			, element : 'div', attributes : { 'class' : 'callout purple' } },
	
    { name : 'Flex Container'			, element : 'div', attributes : { 'class' : 'flex-video' } },

    { name : 'Button 1'					, element : 'a', attributes : { 'class' : 'button1' } },
    { name : 'Button 2'					, element : 'a', attributes : { 'class' : 'button2' } },
    { name : 'Button 3'					, element : 'a', attributes : { 'class' : 'button3' } },

    { name : 'Table'					, element : 'table', attributes : { 'class' : 'table' } },
    { name : 'Table Striped'			, element : 'table', attributes : { 'class' : 'table table-striped' } },
    { name : 'Table Bordered'			, element : 'table', attributes : { 'class' : 'table table-bordered' } },
    { name : 'Table Hovered'			, element : 'table', attributes : { 'class' : 'table table-hover' } },
    { name : 'Table Condensed'			, element : 'table', attributes : { 'class' : 'table table-condensed' } },
//    { name : 'Table Responsive'		, element : 'div', attributes : { 'class' : 'table-responsive' } },
]);