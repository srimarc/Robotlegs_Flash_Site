package com.hubflanger.robotlegsflash.service
{
	import com.hubflanger.robotlegsflash.model.SiteModel;
	
	import flash.events.Event;
	import flash.net.*;
	
	import org.robotlegs.mvcs.Actor;
		
	public class SiteDataService extends Actor implements ISiteDataService
	{
		[Inject]
		public var siteModel:SiteModel;

		public function SiteDataService()
		{
			super();
		}
		
		public function loadData():void 
		{
			//trace("SiteDataService:loadData");
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loadCompleteHandler);
			loader.load(new URLRequest("data.xml"));
		}
		
		private function loadCompleteHandler(event:Event):void 
		{
			var loader:URLLoader = event.target as URLLoader;
			//loader.removeEventListener(Event.COMPLETE, loadCompleteHandler);
			trace("loader.data: " + loader.data);
			var xml:XML = new XML( event.target.data );
			xml.ignoreWhitespace = true;
			
			var sections:XMLList = xml.section.sections;
			
			for each (var section:XML in sections) {
				trace("section: " + section.toString());
			}
		}
	}
}