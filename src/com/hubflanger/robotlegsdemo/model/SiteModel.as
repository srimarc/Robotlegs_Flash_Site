/**
 * Robot Legs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.model
{
	import com.hubflanger.robotlegsdemo.events.SystemEvent;
	
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * A model for the application. 
	 */	
	public class SiteModel extends Actor
	{
		private var _header:String;
		private var _sectionsList:Array = new Array();
		private var _sectionsHash:Dictionary = new Dictionary();
		private var _currentSection:String = "";
		private var _defaultSection:String;
		
		public function SiteModel()
		{
			//trace("SiteModel:constructor");
		}

		public function get header():String
		{
			return _header;
		}

		public function set header(value:String):void
		{
			_header = value;
		}

		public function get sectionsList():Array
		{
			return _sectionsList;
		}

		public function set sectionsList(value:Array):void
		{
			_sectionsList = value;
		}

		public function get sectionsHash():Dictionary
		{
			return _sectionsHash;
		}

		public function set sectionsHash(value:Dictionary):void
		{
			_sectionsHash = value;
		}

		public function get currentSection():String
		{
			return _currentSection;
		}

		public function set currentSection(value:String):void
		{
			_currentSection = value;
			dispatch(new SystemEvent(SystemEvent.SECTION_CHANGED, false));
		}

		public function get defaultSection():String
		{
			return _defaultSection;
		}

		public function set defaultSection(value:String):void
		{
			_defaultSection = value;
		}

	}
}