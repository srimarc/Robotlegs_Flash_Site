/**
 * Robot Legs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.events
{
	import flash.events.Event;
	
	public class SystemEvent extends Event
	{
		public static const INIT_VIEW:String		= "initView";
		public static const SECTION_CHANGED:String 	= "sectionChanged";
		
		public function SystemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			return new SystemEvent(type, bubbles, cancelable);
		}
			
	}
}