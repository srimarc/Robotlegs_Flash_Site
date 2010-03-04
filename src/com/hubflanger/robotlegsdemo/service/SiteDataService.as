package com.hubflanger.robotlegsdemo.service
{
	import com.hubflanger.robotlegsdemo.model.vo.SectionVO;
	import com.hubflanger.robotlegsdemo.model.SiteModel;
	import com.hubflanger.robotlegsdemo.events.SystemEvent;
	
	import flash.events.Event;
	import flash.net.*;
	
	import org.robotlegs.mvcs.Actor;
		
	public class SiteDataService extends Actor implements ISiteDataService
	{
		[Inject]
		public var model:SiteModel;

		public function SiteDataService()
		{
			//
		}
		
		public function loadData():void 
		{
			//trace("SiteDataService:loadData");
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loadCompleteHandler);
			loader.load(new URLRequest("assets/data.xml"));
		}
		
		private function loadCompleteHandler(event:Event):void 
		{
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, loadCompleteHandler);

			var xml:XML = new XML(event.target.data);
			model.header = xml.header.text();
			
			var sections:XMLList = xml.sections.section;
			
			for each (var section:XML in sections) {
				var sectionVO:SectionVO = new SectionVO(section.@id,
														section.label.toString(),
														section.content.toString());
				
				model.sectionsList.push(sectionVO);
				model.sectionsHash[sectionVO.id] = sectionVO;
			}
			
			model.defaultSection = model.sectionsList[0].id;
			
			dispatch(new SystemEvent(SystemEvent.INIT_VIEW, false));
		}
	}
}