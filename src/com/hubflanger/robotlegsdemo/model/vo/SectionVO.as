/**
 * Robot Legs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.model.vo
{
	public class SectionVO
	{
		private var _id:String;
		private var _label:String;
		private var _content:String;
		
		/**
		 * A custom  object for storing Section node data
		 */
		public function SectionVO( id:String, label:String, content:String )
		{
			_id = id;
			_label = label;
			_content = content;
		}

		public function get id():String
		{
			return _id;
		}
		
		public function get label():String
		{
			return _label;
		}
		
		public function get content():String
		{
			return _content;
		}
	}
}