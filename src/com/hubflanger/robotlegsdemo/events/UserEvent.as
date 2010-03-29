/**
 * Robotlegs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.events
{
	import flash.events.Event;
	
	/**
	 * A custom event for the application.
	 */	
	public class UserEvent extends Event
	{
		/**
		 * Dispatched by the <code>NavigationMediator</code> when a 
		 * <code>NavButton</code> is clicked.
		 */		
		public static const NAV_CLICK:String	= "navClick";
		
		private var _id:String;
		
		public function UserEvent(type:String, id:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_id = id;
		}
		
		override public function clone():Event 
		{
			return new UserEvent(type, id, bubbles, cancelable);
		}

		public function get id():String
		{
			return _id;
		}
	}
}