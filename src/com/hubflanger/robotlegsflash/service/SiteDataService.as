package com.hubflanger.robotlegsflash.service
{
	import flash.events.Event;
	import flash.net.*;
	
	import org.robotlegs.mvcs.Actor;
	
	[ResourceBundle("SiteDataService")]
	public class SiteDataService extends Actor implements ISiteDataService
	{
		public function SiteDataService()
		{
			super();
		}
		
		public function loadData():void 
		{
//			var loader:URLLoader = new URLLoader();
//			loader.addEventListener(Event.COMPLETE, loadCompleteHandler);
//			loader.load(new URLRequest("data.xml"));
		}
		
//		private function loadCompleteFunction():void 
//		{
//			loader.removeEventListener(Event.COMPLETE, loadCompleteHandler);
//			trace("loader.data: " + loader.data);
//		}
	}
}