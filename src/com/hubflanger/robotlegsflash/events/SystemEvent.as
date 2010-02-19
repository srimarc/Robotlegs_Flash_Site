package com.hubflanger.robotlegsflash.events
{
	import flash.events.Event;
	
	public class SystemEvent extends Event
	{
		public static const LOAD_SITE_DATA:String = "loadSiteData";
		
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