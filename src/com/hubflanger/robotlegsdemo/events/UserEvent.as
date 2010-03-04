package com.hubflanger.robotlegsdemo.events
{
	import flash.events.Event;
	
	public class UserEvent extends Event
	{
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